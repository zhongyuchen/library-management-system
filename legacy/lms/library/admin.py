from django.contrib import admin

# Register your models here.
from library.models import AuthUser,Books,Libraries,Admins,Loans,Reserves,Comments,Storages

admin.site.register(AuthUser)
admin.site.register(Books)
admin.site.register(Libraries)
admin.site.register(Admins)
admin.site.register(Loans)
admin.site.register(Reserves)
admin.site.register(Comments)
admin.site.register(Storages)