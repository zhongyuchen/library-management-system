from django.contrib import admin
from django.urls import path
from library import views
from django.conf.urls import url, include
from django.contrib.auth.views import login
from django.contrib.auth import views as auth_views

app_name='library'

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^books/$', views.books, name='books'),
    url(r'^books/(?P<book_isbn>\w+)/$', views.book, name='book'),
    url(r'^books/(?P<book_isbn>\w+)/addcomment/$', views.addcomment, name='addcomment'),
    url(r'^signin/$', login, {'template_name':'signin.html'}, name='signin'),
    url(r'^signup/$', views.signup, name='signup'),
    url(r'^signout/$', views.signout, name='signout'),
    url(r'^profile/$', views.profile, name='profile'),
    url(r'^profile/profile_edit/$', views.profile_edit, name='profile_edit'),
    url(r'^profile/password_edit/$', auth_views.password_change,
        {'template_name':'password_edit.html', 'post_change_redirect':'/signout/'},
        name='password_edit'),

    url(r'^loans/$', views.loans, name='loans'),
    url(r'^comments/$', views.comments, name='comments'),

    url(r'^deletecomment/(?P<comment_comno>\d+)/$', views.deletecomment, name='deletecomment'),

    url(r'^loan/(?P<storage_stono>\d+)/$', views.loan, name='loan'),
    url(r'^return/(?P<loan_loanno>\d+)/$', views.return_book, name='return_book'),

    url(r'^addbook/$', views.addbook, name='addbook'),
    url(r'^deletebook/(?P<storage_stono>\d+)/$', views.deletebook, name='deletebook'),

    url(r'^loans/renew/(?P<loan_loanno>\d+)/$', views.renew, name='renew'),
    url(r'^reserves/$', views.reserves, name='reserves'),
    url(r'^reserves/(?P<storage_stono>\d+)/$', views.reservebook, name='reservebook'),
    url(r'^reserves/(?P<reserve_reno>\d+)/confirm/$', views.confirmreserve, name='confirmreserve'),
]
