from django.shortcuts import render
from library import models
from django.http import HttpResponseRedirect,Http404,HttpResponse
from django.urls import reverse
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import login,logout,authenticate
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.db.models import Count
from django.core.exceptions import ObjectDoesNotExist
from datetime import datetime, date
from django.utils import timezone
from django.utils.timezone import now, timedelta

from .models import AuthUser
from .forms import ProfileForm
#from .forms import BookForm, StorageForm
from .forms import AddBookForm, CommentForm, ReserveForm, SearchBookForm

from django.db.models import Q

# Create your views here.

#main site
def index(request):
    #return HttpResponse(u"Hello, world!你好，世界！")
    # if request.method == "POST":
    #     email = request.POST.get("email", None)
    #     password = request.POST.get("password", None)
    #     # add data into database
    #     models.Users.objects.create(email=email, pwd=password)
    # read all data from database
    #user_list = models.AuthUser.objects.all()

    return render(request, "index.html", )

#display all the books
@login_required
def books(request):
    if request.method != 'POST':
        form=SearchBookForm()

        # existing books table
        books=models.Books.objects.all()
        # dict list, contains book and other aspects
        all=[]

        for book in books:
            storages=models.Storages.objects.filter(isbn=book.isbn)
            loaned=models.Storages.objects.filter()
            loaned_count = 0
            for storage in storages:
                loaned = models.Loans.objects.filter(stono=storage.stono,return_date__isnull=True,admin_id__isnull=True)
                loaned_count += loaned.count()

            # new dictionary
            dic={'isbn': book.isbn, 'title': book.title, 'authors': book.authors,
               'publisher': book.publisher, 'price': book.price,
               'count': storages.count(), 'loaned': loaned_count}
            all.append(dic)

        #loaned=models.Loans.objects.all()
        #context={'books':all, 'loaned':loaned}
        context={'form':form,'books':all}
        return render(request, 'books.html', context)
    else:
        form = SearchBookForm(request.POST)
        if form.is_valid():
            text=form.cleaned_data['text']
            books = models.Books.objects.filter(Q(isbn__icontains=text)|
                                                Q(title__icontains=text)|
                                                Q(authors__icontains=text)|
                                                Q(publisher__icontains=text))
        else:
            books = models.Books.objects.all()

        # dict list, contains book and other aspects
        all = []

        for book in books:
            storages = models.Storages.objects.filter(isbn=book.isbn)
            loaned = models.Storages.objects.filter()
            loaned_count = 0
            for storage in storages:
                loaned = models.Loans.objects.filter(stono=storage.stono, return_date__isnull=True,
                                                     admin_id__isnull=True)
                loaned_count += loaned.count()
            # new dictionary
            dic = {'isbn': book.isbn, 'title': book.title, 'authors': book.authors,
                   'publisher': book.publisher, 'price': book.price,
                   'count': storages.count(), 'loaned': loaned_count}
            all.append(dic)

        # loaned=models.Loans.objects.all()
         # context={'books':all, 'loaned':loaned}
        context = {'form':form,'books': all}
        return render(request, 'books.html', context)



@login_required
def book(request, book_isbn):
    book=models.Books.objects.get(isbn=book_isbn)
    storages=models.Storages.objects.filter(isbn=book.isbn).order_by('lno')
    comments=models.Comments.objects.filter(isbn=book.isbn)
    all=[]

    for storage in storages:
        try:
            loan=models.Loans.objects.get(stono=storage.stono, return_date__isnull=True, admin_id__isnull=True)
            due_date=loan.due_date
            available=0
        except ObjectDoesNotExist:
            due_date=None
            available=1
        try:
            reserve=models.Reserves.objects.get(stono=storage.stono, admin_id__isnull=True)
            reservable=0
        except ObjectDoesNotExist:
            reservable = 1
        dic={'stono': storage.stono, 'isbn': storage.isbn, 'lno': storage.lno,
             'due_date': due_date, 'available': available, 'reservable':reservable}
        all.append(dic)

    context={'book': book, 'storages': all, 'comments':comments}
    return render(request,'book.html',context)

def signup(request):
    if request.method != 'POST':
        form = UserCreationForm()
    else:
        form = UserCreationForm(data=request.POST)

        if form.is_valid():
            new_user = form.save()
            authenticated_user = authenticate(username=new_user.username,
                                              password=request.POST['password1'])
            login(request, authenticated_user)
            return HttpResponseRedirect(reverse('library:index'))
    context={'form':form}
    return render(request, 'signup.html', context)

@login_required
def signout(request):
    logout(request)
    return HttpResponseRedirect(reverse('library:index'))

@login_required
def profile(request):
    #loans=models.Loans.objects.filter(id=request.user.id)
    #comments=models.Comments.objects.filter(id=request.user.id)
    #context={'loans':loans,'comments':comments}
    return render(request, 'profile.html', )

@login_required
def profile_edit(request):
    if request.method == 'POST':
        form = ProfileForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse('library:profile'))
        else:
            error=form.errors
            return render(request, 'profile_edit.html', {'form':form, 'errors':error})
    else:
        form = ProfileForm(instance=request.user)
        return render(request, 'profile_edit.html', {'form':form, })

@login_required
def loans(request):
    all=[]
    if request.user.is_staff:
        loans=models.Loans.objects.all()
        for loan in loans:
            try:
                reserve=models.Reserves.objects.get(stono=loan.stono, admin_id__isnull=True)
                reservable =0
            except ObjectDoesNotExist:
                reservable=1
            dic={'loan_date':loan.loan_date, 'due_date':loan.due_date,
                 'renewed':loan.renewed, 'stono':loan.stono,
                 'id':loan.id,'return_date':loan.return_date,
                 'admin_id':loan.admin_id,'loanno':loan.loanno,
                 'reservable':reservable}
            all.append(dic)
    else:
        loans = models.Loans.objects.filter(id=request.user.id)
        for loan in loans:
            try:
                reserve=models.Reserves.objects.get(stono=loan.stono)
                reservable =0
            except ObjectDoesNotExist:
                reservable=1
            dic={'loan_date':loan.loan_date, 'due_date':loan.due_date,
                 'renewed':loan.renewed, 'stono':loan.stono,
                 'id':loan.id,'return_date':loan.return_date,
                 'admin_id':loan.admin_id,'loanno':loan.loanno,
                 'reservable':reservable}
            all.append(dic)

    context = {'loans': all}
    return render(request, 'loans.html', context)

@login_required
def comments(request):
    if request.user.is_staff:
        comments = models.Comments.objects.all()
    else:
        comments = models.Comments.objects.filter(id=request.user.id)

    context = {'comments': comments}
    return render(request, 'comments.html', context)

@login_required
def loan(request, storage_stono):
    #already loaned out
    try:
        loan=models.Loans.objects.get(stono=storage_stono, return_date__isnull=True, admin_id__isnull=True)
    #available
    except ObjectDoesNotExist:
        try:
            reserve=models.Reserves.objects.get(stono=storage_stono, admin_id__isnull=True)
        except ObjectDoesNotExist:
            loan_date = now().date()
            due_date=loan_date+timedelta(days=30)
            storage=models.Storages.objects.get(stono=storage_stono)
            user=models.AuthUser.objects.get(id=request.user.id)
            add_loan=models.Loans.objects.create(loan_date=loan_date, due_date=due_date,
                                        renewed=0, stono=storage, id=user)
            add_loan.save()

    return HttpResponseRedirect(reverse('library:loans'))

@login_required
def return_book(request, loan_loanno):
    #exist
    if request.user.is_staff:
        try:
            loan = models.Loans.objects.get(loanno=loan_loanno)
            loan.return_date = now().date()
            loan.admin_id = request.user.id
            loan.save()
        #not exist
        except ObjectDoesNotExist:
            error="Not loaned out"

    return HttpResponseRedirect(reverse('library:loans'))

@login_required
def addbook(request):
    if request.user.is_staff:
        if request.method == 'POST':
            form = AddBookForm(data=request.POST)
            if form.is_valid():
                add_book=models.Books.objects.create(isbn=form.cleaned_data['isbn'], title=form.cleaned_data['title'], authors=form.cleaned_data['authors'], publisher = form.cleaned_data['publisher'], price = form.cleaned_data['price'])
                add_book.save()
                lno = form.cleaned_data['lno']
                # try:
                library = models.Libraries.objects.get(lno=lno)
                add_storage = models.Storages.objects.create(isbn=add_book, lno=library)
                add_storage.save()
                return HttpResponseRedirect(reverse('library:books'))
                # except ObjectDoesNotExist:
                #     error = form.errors
                #     context = {'form': form, 'error': error}
                #     return render(request, 'addbook.html', context)
            else:
                error = form.errors
                context={'form':form, 'error':error}
                return render(request, 'addbook.html', context)
        else:
            form = AddBookForm()
            context = {'form':form}
            return render(request, 'addbook.html', context)
    else:
        return HttpResponseRedirect(reverse('library:books'))

@login_required
def deletebook(request, storage_stono):
    if request.user.is_staff:
        #loaned out, can't be deleted
        try:
            loan = models.Loans.objects.get(stono=storage_stono, return_date__isnull=True, admin_id__isnull=True)
            return HttpResponseRedirect(reverse('library:books'))
        #not exist
        except ObjectDoesNotExist:
            #reserved, can't be deleted
            try:
                reserve = models.Reserves.objects.get(stono=storage_stono)
            except ObjectDoesNotExist:
                try:
                    storage = models.Storages.objects.get(stono=storage_stono)
                    count = models.Storages.objects.filter(isbn=storage.isbn.isbn).count()
                    storage_isbn = storage.isbn.isbn
                    loans = models.Loans.objects.filter(stono = storage.stono)
                    for loan in loans:
                        loan.delete()
                    storage.delete()
                    if count <= 1:
                        book = models.Books.objects.get(isbn=storage_isbn)
                        book.delete()

                    return HttpResponseRedirect(reverse('library:books'))
                except ObjectDoesNotExist:
                    return HttpResponseRedirect(reverse('library:books'))

    return HttpResponseRedirect(reverse('library:books'))

@login_required
def deletecomment(request, comment_comno):
    comment = models.Comments.objects.get(comno=comment_comno)
    if request.user.id == comment.id.id or request.user.is_staff:
        comment.delete()
    return HttpResponseRedirect(reverse('library:comments'))

@login_required
def addcomment(request, book_isbn):
    # if request.method == 'GET':
    #     request.session['CommentForm'] = request.META.get('HTTP_REFERER', '/')
    #     form = CommentForm()
    #     context = {'form': form}
    #     return render(request, 'addcomment.html', context)
    #     #return HttpResponseRedirect(reverse('library:addcomment' ))
    # else:
        if request.method == 'POST':
            form = CommentForm(data=request.POST)
            if form.is_valid():
                #form.save()
                text=form.cleaned_data['text']
                user=models.AuthUser.objects.get(id=request.user.id)
                book=models.Books.objects.get(isbn=book_isbn)
                #return HttpResponseRedirect(request.session['CommentForm'])
                comment=models.Comments.objects.create(isbn=book,text=text,id=user)
                comment.save()
                return HttpResponseRedirect(reverse('library:books'))
            else:
                error = form.errors
                context={'form':form, 'error':error}
                #return HttpResponseRedirect(request.session['CommentForm'])
                return HttpResponseRedirect(reverse('library:books'))
        else:
            form = CommentForm()
            book=models.Books.objects.get(isbn=book_isbn)
            context = {'form':form, 'book_isbn':book_isbn, 'book':book}
            return render(request, 'addcomment.html', context)

@login_required
def renew(request, loan_loanno):
    try:
        loan=models.Loans.objects.get(loanno=loan_loanno, return_date__isnull=True, admin_id__isnull=True)
        if request.user.id == loan.id.id or request.user.is_staff:
            if loan.renewed:
                return HttpResponseRedirect(reverse('library:loans'))
            else:
                loan.due_date = loan.due_date + timedelta(days=30)
                loan.renewed = 1
                loan.save()
                return HttpResponseRedirect(reverse('library:loans'))
        else:
            return HttpResponseRedirect(reverse('library:loans'))
    except ObjectDoesNotExist:
        return HttpResponseRedirect(reverse('library:loans'))

@login_required
def reserves(request):
    if request.user.is_staff:
        reserves = models.Reserves.objects.all()
    else:
        reserves = models.Reserves.objects.filter(id=request.user.id)
    context={'reserves':reserves}
    return render(request, 'reserves.html', context)


@login_required
def reservebook(request, storage_stono):
    try:
        loan=models.Loans.objects.get(stono=storage_stono, admin_id__isnull=True, return_date__isnull=True)
        return HttpResponseRedirect(reverse('library:books'))
    except ObjectDoesNotExist:
        try:
            reserve=models.Reserves.objects.get(stono=storage_stono, admin_id__isnull=True)
            return HttpResponseRedirect(reverse('library:books'))
        except ObjectDoesNotExist:
            if request.method != 'POST':
                form = ReserveForm()
                storage=models.Storages.objects.get(stono=storage_stono)
                context = {'form': form, 'storage_stono': storage_stono, 'storage':storage}
                return render(request, 'reservebook.html', context)
            else:
                form = ReserveForm(data=request.POST)
                if form.is_valid():
                    lno = form.cleaned_data['lno']
                    library = models.Libraries.objects.get(lno=lno)
                    storage = models.Storages.objects.get(stono=storage_stono)
                    try:
                        storage=models.Storages.objects.get(stono=storage_stono,lno__lno=lno)
                        return HttpResponseRedirect(reverse('library:books'))
                    # if lno != storage.lno.lno:
                    except ObjectDoesNotExist:
                        #form.save()
                        user=models.AuthUser.objects.get(id=request.user.id)
                        reserve = models.Reserves.objects.create(lno=library, stono= storage, id=user)
                        reserve.save()
                        return HttpResponseRedirect(reverse('library:books'))
                        #return HttpResponse(lno)
                    else:
                        #return HttpResponseRedirect(request.session['CommentForm'])
                        return HttpResponseRedirect(reverse('library:books'))
                else:
                    error = form.errors
                    storage = models.Storages.objects.get(stono=storage_stono)
                    context={'form':form, 'error':error, 'storage':storage}
                    #return HttpResponseRedirect(request.session['CommentForm'])
                    return render(request, 'reservebook.html', context)

@login_required
def confirmreserve(request, reserve_reno):
    if request.user.is_staff:
        try:
            reserve=models.Reserves.objects.get(reno=reserve_reno)
            storage=models.Storages.objects.get(stono=reserve.stono.stono)
            user=models.AuthUser.objects.get(id=request.user.id)
            storage.lno=reserve.lno
            storage.save()
            reserve.admin_id=request.user.id
            reserve.save()
            return HttpResponseRedirect(reverse('library:reserves'))
        except ObjectDoesNotExist:
            return HttpResponseRedirect(reverse('library:reserves'))
    else:
        return HttpResponseRedirect(reverse('library:reserves'))