create database IF NOT EXISTS book;

use book;

DROP TABLE IF EXISTS loan;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS employee;

create table employee(
  empno int not null,
  name varchar(50) not null,
  office varchar(50) not null,
  age int not null,
  constraint pk_employee primary key (empno)
);

create table books(
  isbn varchar(50) not null,
  title varchar(50) not null,
  authors varchar(50) not null,
  publisher varchar(50) not null,
  price int not null,
  constraint pk_books primary key (isbn)
);

create table loan(
  empno int not null,
  isbn varchar(50) not null,
  loan_date date not null,
  constraint pk_loan primary key (empno, isbn),
  constraint fk_loan_employee foreign key (empno) references employee(empno),
  constraint fk_loan_books foreign key (isbn) references books(isbn)
);

insert into employee values
(1, 'Jones', 'CA', 30),
(2, 'Alice', 'SJ', 33),
(3, 'Bob', 'NY', 29),
(4, 'Jack', 'CN', 50),
(5, 'J', 'CN', 40),#newly added
(6, 'Ja', 'SH', 45);#newly added

insert into books values
(1, 'T1', 'A1', 'McGraw-Hill', 10),
(2, 'T1', 'A1', 'McGraw-Hill', 20),
(3, 'T2', 'A2', 'McGraw-Hill', 30),
(4, 'T2', 'A2', 'Tsinghua', 40),
(5, 'T3', 'A3', 'Tsinghua', 50),
(6, 'T3', 'A3', 'Tsinghua', 60),
(11, 'T4', 'A4', 'Peking', 20),
(12, 'T4', 'A4', 'Peking', 30),
(13, 'T5', 'A5', 'Peking', 40),
(14, 'T6', 'A6', 'Fudan', 50),
(15, 'T7', 'A7', 'Fudan', 60),
(16, 'T8', 'A8', 'Fudan', 70);


insert into loan values
(1, 1, '2016-3-24'),
(2, 2, '2016-3-24'),
(2, 3, '2016-3-24'),
(1, 4, '2016-3-25'),
(3, 5, '2016-3-25'),
(1, 6, '2016-3-25'),
(1, 11, '2018-4-18'),
(4, 12, '2018-4-18'),
(4, 13, '2018-4-18'),
(1, 14, '2018-4-18'),
(1, 15, '2018-4-18'),
(2, 16, '2018-4-18'),
(1, 13, '2018-5-1'),
(3, 14, '2018-5-1'),
(2, 11, '2018-5-1'),
(2, 1, '2018-3-18');