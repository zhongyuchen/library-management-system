# library-management-system

![build status](https://img.shields.io/badge/build-passing-green.svg)
[![python version](https://img.shields.io/badge/python-3.6.5-fbb4ae.svg)](https://python.org)
[![Django version](https://img.shields.io/badge/Django-2.0.5-b3cde3.svg)](https://www.djangoproject.com/)
[![MySQL version](https://img.shields.io/badge/MySQL-5.9.7-ccebc5.svg)](https://www.mysql.com/)
[![Materialize version](https://img.shields.io/badge/Materialize-1.0.0-decbe4.svg)](https://materializecss.com/)
[![Apache License](https://img.shields.io/badge/license-Apache2.0-fed9a6.svg)](http://www.apache.org/licenses/)

Good-looking, adaptive and powerful library management system website implemented with python package Django, using MySQL for database and materialize for web design, embedded with a lot of nice features.

![homepage](https://raw.githubusercontent.com/czhongyu/library-management-system/master/source/pic/homepage.jpg?token=AgmiqBxZHqKfEPCixdVH0ATO7raM8uRNks5cg4AmwA%3D%3D)

## Prerequisites

### MySQL

1. Install [MySQL](https://dev.mysql.com/downloads/mysql/)
2. Install [MySQL Workbench](https://dev.mysql.com/downloads/workbench/) 
3. Create an empty schema `book` in MySQL
4. Import /source/book.sql file into `book` schema via
    * Replace `<USERNAME>` with the your local instance MySQL username, which is usually `root`
    * Replace `<LOCATION>` with the actual path of /source/book.sql file
    * Input the password for your local instance MySQL afterwards

```commandline
mysql -u <USERNAME> -p book < <LOCATION>
```

### PyCharm

(Recommended, but not necessary!)

1. Install [PyCharm](https://www.jetbrains.com/pycharm/)
2. Add Data Source schema `book` at Database in PyCharm
    * If username and password are required, enter the username and password for your local instance MySQL

### Required Packages

Install all required via
```commandline
pip install -r requirements.txt
```

Since [![Django version](https://img.shields.io/badge/Django-2.0.5-fc8d62.svg)](https://www.djangoproject.com/) is the only package needed, you can simply install it via
```commandline
pip install Django==2.0.5
```

## Usage

```commandline
python manage.py runserver
```

## MySQL Schema

In `book` schema, the following tables are important:
* `auth_user` stores all the users including readers, staff and superusers 
* `books` stores the book info
* `libraries` stores the library info
* `loans` stores the loan info
* `reserves` stores the reservations
* `comments` stores the comments
* `storages` stores the storage info

## Library Management System

### Features

1. Good-looking, neat and adaptive web design
2. Sign up, sign in, update user profile, change password, log out
3. View all the books
4. Search for a book, view book info, storage info, comments
5. Add a book, delete a book
6. Comment on a book, delete a comment
7. Loan a book
8. Return date can be extended once at most
9. Return a book
10. Reserve a book (apply for moving the book from one library to another)
11. Confirm a reservation (confirm that the book is moved to another desired library)
12. View all comments
13. View all reservations
14. View all loans
15. Django administration site available for superusers

### Login Info

| Role      | Username  | Password  |
| --------- | --------- | --------- |
| superuser | admin000  | person000 |
| staff     | staff000  | person000 |
| staff     | staff001  | person000 |
| reader    | reader000 | person000 |
| reader    | reader001 | person000 |

### Roles

1. Tourists:
    * Sign up
2. Readers:
    * Sign in, update user profile, change password, log out
    * View all the books
    * Search for a book, view book info, storage info, comments
    * Comment on a book, delete his/her comments
    * Loan a book
    * Return date can be extended once at most
    * Reserve a book (apply for moving the book from one library to another)
    * View all comments
    * View his/her reservations
    * View his/her loans
3. Staff:
    * Anything that readers can do
    * Add a book, delete a book
    * Delete any comments
    * Return a book (confirm that the book is returned)
    * Confirm a reservation (confirm that the book is moved to another desired library)
    * View all reservations
    * View all loans
4. Superusers:
    * Anything that staff can do
    * log into Django administration site (anything can be changed here)
    
### Rules

1. Once a book is loaned, the book has to be returned in a month
2. The return date can be extended for a month more at most once, which means the book has to be returned in 2 months since the book is loaned
3. When a reader tries to return a book, a staff member can confirm that the book is returned
4. After a reader tries to reserve a book, a staff member can confirmed that the book is moved to another library that the reader desired
5. When a book is loaned or reserved, it can not be deleted

### Screen Shots

* Sign Up
![sign up](https://raw.githubusercontent.com/czhongyu/library-management-system/master/source/pic/signup.jpg?token=AgmiqFZjwlsgdD0sujXdGrFupr7ICuijks5cg4CgwA%3D%3D)

* Profile
![profile](https://raw.githubusercontent.com/czhongyu/library-management-system/master/source/pic/profile.jpg?token=AgmiqFSo5c3jd18fdRBQgC-50nJRjzJvks5cg4D0wA%3D%3D)

* Library
![library](https://raw.githubusercontent.com/czhongyu/library-management-system/master/source/pic/library.jpg?token=AgmiqFRn_VpFT-ngEF9DdCfO5uLaqzdbks5cg4DSwA%3D%3D)

* Book
![book](https://raw.githubusercontent.com/czhongyu/library-management-system/master/source/pic/book.jpg?token=AgmiqPYe_X-eewek9I8nu4ZZHC9Dmntcks5cg4EMwA%3D%3D)

* Comments
![comments](https://raw.githubusercontent.com/czhongyu/library-management-system/master/source/pic/comments.jpg?token=AgmiqLY2nkLJuSavIwGbQ5YDoWGq3yM8ks5cg4EkwA%3D%3D)

* Loans
![loans](https://raw.githubusercontent.com/czhongyu/library-management-system/master/source/pic/loans.jpg?token=AgmiqMm3rEHOjWUuEWYS3bC5J90pVnB7ks5cg4E5wA%3D%3D)

* Reservations
![reserve](https://raw.githubusercontent.com/czhongyu/library-management-system/master/source/pic/reserve.jpg?token=AgmiqHjklVJYgW5-kZBZHu8dL_OlHw_4ks5cg4FNwA%3D%3D)

* Django Administration Site
![admin](https://raw.githubusercontent.com/czhongyu/library-management-system/master/source/pic/admin.jpg?token=AgmiqB-nqv5xvQXhIlLw-zBpO6M_GthMks5cg4GfwA%3D%3D)

## Author

Zhongyu Chen
