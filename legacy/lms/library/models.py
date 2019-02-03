# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Admins(models.Model):
    id = models.ForeignKey('Users', models.DO_NOTHING, db_column='id', primary_key=True)
    salary = models.FloatField()
    age = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'admins'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Books(models.Model):
    isbn = models.CharField(primary_key=True, max_length=50)
    title = models.CharField(max_length=50)
    authors = models.CharField(max_length=50)
    publisher = models.CharField(max_length=50)
    price = models.FloatField()

    class Meta:
        managed = False
        db_table = 'books'


class CmdbUserinfo(models.Model):
    email = models.CharField(max_length=32)
    pwd = models.CharField(max_length=32)
    pos = models.CharField(max_length=10)

    class Meta:
        managed = False
        db_table = 'cmdb_userinfo'


class Comments(models.Model):
    comno = models.AutoField(primary_key=True)
    isbn = models.ForeignKey(Books, models.DO_NOTHING, db_column='isbn')
    text = models.CharField(max_length=140)
    id = models.ForeignKey(AuthUser, models.DO_NOTHING, db_column='id')

    class Meta:
        managed = False
        db_table = 'comments'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Employee(models.Model):
    empno = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)
    office = models.CharField(max_length=50)
    age = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'employee'


class Libraries(models.Model):
    lname = models.CharField(unique=True, max_length=50)
    laddr = models.CharField(max_length=50)
    lno = models.AutoField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'libraries'


class Loans(models.Model):
    loan_date = models.DateField()
    due_date = models.DateField()
    renewed = models.IntegerField()
    stono = models.ForeignKey('Storages', models.DO_NOTHING, db_column='stono')
    id = models.ForeignKey(AuthUser, models.DO_NOTHING, db_column='id')
    return_date = models.DateField(blank=True, null=True)
    admin_id = models.IntegerField(blank=True, null=True)
    loanno = models.AutoField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'loans'


class Login(models.Model):
    email = models.CharField(primary_key=True, max_length=50)
    pwd = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'login'


class Reserves(models.Model):
    lno = models.ForeignKey(Libraries, models.DO_NOTHING, db_column='lno')
    stono = models.ForeignKey('Storages', models.DO_NOTHING, db_column='stono')
    id = models.ForeignKey(AuthUser, models.DO_NOTHING, db_column='id')
    reno = models.AutoField(primary_key=True)
    admin_id = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'reserves'


class Storages(models.Model):
    stono = models.AutoField(primary_key=True)
    isbn = models.ForeignKey(Books, models.DO_NOTHING, db_column='isbn')
    lno = models.ForeignKey(Libraries, models.DO_NOTHING, db_column='lno')

    class Meta:
        managed = False
        db_table = 'storages'


class Users(models.Model):
    id = models.IntegerField(primary_key=True)
    uname = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    password = models.CharField(max_length=50)
    join_date = models.DateField()
    is_admin = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'users'
