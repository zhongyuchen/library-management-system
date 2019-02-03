from django import forms

from .models import AuthUser,Books,Storages,Comments,Reserves

class ProfileForm(forms.ModelForm):
    class Meta:
        model = AuthUser
        # fields = [ 'id', 'password','last_login','is_superuser','username',
        #           'first_name', 'last_name','email','is_staff','is_active','date_joined']
        fields = [  'first_name', 'last_name','email' ]

# class BookForm(forms.ModelForm):
#     class Meta:
#         model = Books
#         fields = [ 'isbn', 'title', 'authors', 'publisher', 'price' ]

# class StorageForm(forms.ModelForm):
#     class Meta:
#         model = Storages
#         fields = [ 'stono', 'isbn', 'lno']

# class AddBookForm(forms.ModelForm):
#     class Meta:
#         model = Books, Storages
#         fields = [ 'isbn', 'title', 'authors', 'publisher', 'price', 'lno']

class AddBookForm(forms.Form):
    isbn = forms.CharField(max_length=50)
    title = forms.CharField(max_length=50)
    authors = forms.CharField(max_length=50)
    publisher = forms.CharField(max_length=50)
    price = forms.FloatField()
    lno = forms.ChoiceField(choices=(('1', 'Lee Shau Kee Library'),
                                         ('2', 'Liberal Arts Library'),
                                         ('3', 'Science Library'),
                                         ('4', 'Zhangjiang Library')))
    #lno = forms.IntegerField(max_value=4,min_value=1)

    lno.widget.attrs.update({'class':'dropdown-trigger waves-effect'})

class CommentForm(forms.ModelForm):
    class Meta:
        model = Comments
        fields = [ 'text']

class ReserveForm(forms.Form):

    lno = forms.ChoiceField(choices=(('1', 'Lee Shau Kee Library'),
                                         ('2', 'Liberal Arts Library'),
                                         ('3', 'Science Library'),
                                         ('4', 'Zhangjiang Library')))
    #lno = forms.IntegerField(max_value=4,min_value=1)

    lno.widget.attrs.update({'class':'dropdown-trigger waves-effect'})

class SearchBookForm(forms.Form):
    text=forms.CharField(max_length=50, required=False)