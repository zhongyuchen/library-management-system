# library-management-system

![build status](https://img.shields.io/badge/build-passing-green.svg)
[![python version](https://img.shields.io/badge/python-3.6.5-fbb4ae.svg)](https://python.org)
[![Django version](https://img.shields.io/badge/Django-2.0.5-b3cde3.svg)](https://www.djangoproject.com/)
[![MySQL version](https://img.shields.io/badge/MySQL-5.9.7-ccebc5.svg)](https://www.mysql.com/)
[![Materialize version](https://img.shields.io/badge/Materialize-1.0.0-decbe4.svg)](https://materializecss.com/)
[![Apache License](https://img.shields.io/badge/license-Apache2.0-fed9a6.svg)](http://www.apache.org/licenses/)

Good-looking, adaptive and powerful library management system website implemented with python package Django, using MySQL for database and materialize for web design, embedded with a lot of nice features.

![homepage](/source/pic/homepage.jpg)

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
![sign up](/source/pic/signup.jpg)

* Profile
![profile](/source/pic/profile.jpg)

* Library
![library](/source/pic/library.jpg)

* Book
![book](/source/pic/book.jpg)

* Comments
![comments](/source/pic/comments.jpg)

* Loans
![loans](/source/pic/loans.jpg)

* Reservations
![reserve](/source/pic/reserve.jpg)

* Django Administration Site
![admin](/source/pic/admin.jpg)

## Author

Zhongyu Chen
