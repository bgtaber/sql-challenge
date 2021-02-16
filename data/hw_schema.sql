create table departments (
dept_no varchar PRIMARY KEY,
dept_name varchar);

create table titles (
title_id varchar PRIMARY KEY,
title varchar);

create table employees (
emp_no int PRIMARY KEY,
emp_title_id varchar,
birth_date date,
first_name varchar,
last_name varchar,
sex varchar,
hire_date date);

create table salaries (
emp_no int,
salary int,
FOREIGN KEY(emp_no) REFERENCES employees(emp_no));

create table dept_emp(
emp_no int,
dept_no varchar,
FOREIGN KEY(emp_no)REFERENCES employees(emp_no),
FOREIGN KEY(dept_no)REFERENCES departments(dept_no));

create table dept_managers(
dept_no varchar,
emp_no int,
FOREIGN KEY(emp_no)REFERENCES employees(emp_no),
FOREIGN KEY(dept_no)REFERENCES departments(dept_no));