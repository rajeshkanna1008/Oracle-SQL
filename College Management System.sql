create table department (
    dept_id int primary key ,
    dept_name varchar(20),
    start_date DATE,
    end_date DATE);
    
    
create table students(
    st_id int primary key,
    st_name varchar(20),
    dept_id int,
    joining_date DATE,
    end_date DATE);
    

create table roles(
	role_id int primary key,
	role_name varchar(50)
);

create table staff(
    staff_id int primary key,
    staff_name varchar(20),
    dept_id int,
    role_id int,
    joining_date DATE,
    end_date DATE);


Create table  Subject(
	Sub_Id int primary key,
	Sub_Name varchar(30),
	Dept_Id int);


Create table Scholorship(
	S_Id int primary key,
	Eligible varchar(20),
	Non_Eligible varchar(20),
	St_id int);
    
    
Create table Project(
	Project_Id int primary key,
	Project_Name varchar(20),
	Duration varchar(5),
	Fees int,
	Dept_Id int);
    

create table student_project_assignment(
	st_id int,
	project_id int,
	dept_id int,
	start_date DATE,
	end_date DATE,
	completion_intime varchar(20));

create table staff_adderess(
	loc_pin int primary key,
	location varchar(50),
	staff_id int);


create table student_adderess(
	loc_pin int primary key,
	location varchar(50),
	st_id int);

SELECT table_name
FROM user_tables;


insert into department values
(101,'Engineering','01-Jan-2021','30-Jul-2022');

insert into department values
(102,'Marketing','15-Mar-2022','31-Dec-2023');

insert into department values
(103,'Finance','01-Jul-2020','30-Dec-2023');

insert into department values
(104,'HR','01-Jan-2023','30-Jun-2022');

select * from department;

insert into students values
(01,'John',101,'01-Feb-2022','30-Jun-2023');

insert into students values
(02,'Smith',102,'15-Jul-2021','30-Jun-2023');

insert into students values
(03,'Mike',103,'10-Apl-2023','30-Dec-2023');

insert into students values
(04,'Emma',104,'05-Sep-2022','25-Jul-2027');
select * from students;

insert into roles values
(1,'HOD');
insert into roles values
(2,'librarian');
insert into roles values
(3,'principle');
insert into roles values
(4,'professor');
insert into roles values
(5,'asst.professor');

select * from roles;


insert into staff values
(11,'John Smith',101,2,'01-Jan-2021','31-Dec-2022');
insert into staff values
(12,'Emily Johnson',102,3,'15-Mar-2022','31-Dec-2023');
insert into staff values
(13,'Michael Brown',103,4,'01-Jul-2020','31-Dec-2024');
insert into staff values
(14,'Sarah Wilson',104,5,'01-Ian-2023','01-Nov-2025');

select * from staff;


insert into subject
values(21,'M1',102);

insert into subject
values(22,'English',103);

insert into subject
values(23,'Drawing',101);

insert into subject
values(24,'M2',104);

insert into subject
values(25,'Accounting',102);

select * from subject;


insert into SCHOLORSHIP 
values(1011,'Yes','No',03);

insert into SCHOLORSHIP 
values(1012,'No','Yes',02);

insert into SCHOLORSHIP 
values(1013,'Yes','No',01);

insert into SCHOLORSHIP 
values(1014,'No','Yes',04);


insert into project values
(123,'Website Redesign','6m',5000,101);

insert into project values
(124,'Market Research','3m',3000,102);

insert into project values
(125,'Software Development','9m',8000,103);

insert into project values
(126,'Machine Learning','6m',10000,104);
select * from project;

insert INTO STUDENT_PROJECT_ASSIGNMENT
values(01,124,102,'12-Apl-2022','13-May-2022','Completed');

insert INTO STUDENT_PROJECT_ASSIGNMENT
values(03,125,104,'23-Apl-2021','25-May-2021','Completed');

insert INTO STUDENT_PROJECT_ASSIGNMENT
values(02,126,101,'02-Apl-2023','','Not Completed');

insert INTO STUDENT_PROJECT_ASSIGNMENT
values(04,123,103,'17-Jun-2019','18-Jul-2019','Completed');


select * from student_project_assignment;

insert into staff_adderess values
(500001,'Abids',12);
insert into staff_adderess values
(500002,'Begumpet',11);
insert into staff_adderess values
(500003,'Hitech City',13);
insert into staff_adderess values
(500016,'Ameerpet',14);

select * from staff_adderess;

insert into student_adderess
values(505502,'uppal',02);

insert into student_adderess
values(505563,'kphb',03);

insert into student_adderess
values(505582,'ngri',04);

insert into student_adderess
values(505526,'Habsiguda',02);

select * from student_adderess;


=====================================================================================

create table department (
    dept_id int primary key ,
    dept_name varchar(20),
    start_date DATE,
    end_date DATE);
    
    
create table students(
    st_id int primary key,
    st_name varchar(20),
    dept_id int,
    joining_date DATE,
    end_date DATE,
    foreign key (dept_id) references department(dept_id));

create table roles(
	role_id int primary key,
	role_name varchar(50)
);

create table staff(
    staff_id int primary key,
    staff_name varchar(20),
    dept_id int,
    role_id int,
    joining_date DATE,
    end_date DATE,
    foreign key (dept_id) references department(dept_id),
    foreign key (role_id) references roles(role_id)
    );


Create table  Subject(
	Sub_Id int primary key,
	Sub_Name varchar(30),
	Dept_Id int,
	FOREIGN KEY (Dept_Id) REFERENCES Department(dept_id));


Create table Scholorship(
	S_Id int primary key,
	Eligible varchar(20),
	Non_Eligible varchar(20),
	St_id int,
	FOREIGN KEY (St_Id) REFERENCES Students(St_id));
    
    
Create table Project(
	Project_Id int primary key,
	Project_Name varchar(20),
	Duration varchar(5),
	Fees int,
	Dept_Id int,
	FOREIGN KEY (Dept_Id) REFERENCES Department(Dept_Id));
    

create table student_project_assignment(
	st_id int,
	project_id ,
	dept_id int,
	start_date DATE,
	end_date DATE,
	completion_intime varchar(20),
	foreign key(st_id) references students(st_id),
	foreign key(project_id) references project(project_id)
);

create table staff_adderess(
	loc_pin int primary key,
	location varchar(50),
	staff_id int,
	foreign key (staff_id) references staff(staff_id)
);


create table student_adderess(
	loc_pin int primary key,
	location varchar(50),
	st_id int,
	foreign key (st_id) referen3

SELECT table_name
FROM user_tables;


insert into department values
(101,'Engineering','01-01-2021','30-06-2022');

insert into department values
(102,'Marketing','15-03-2022','31-12-2023');

insert into department values
(103,'Finance','01-07-2020','30-12-2023');

insert into department values
(104,'HR','01-01-2023','30-06-2022');

select * from department;

insert into students values
(01,'John',101,'01-02-2022','30-06-2023');

insert into students values
(02,'Smith',102,'15-07-2021','30-06-2023');

insert into students values
(03,'Mike',103,'10-04-2023','30-12-2023');

insert into students values
(04,'Emma',104,'05-09-2022','25-06-2027');


insert into roles values
(1,'HOD');
insert into roles values
(2,'librarian');
insert into roles values
(3,'principle');
insert into roles values
(4,'professor');
insert into roles values
(5,'asst.professor');

select * from roles;


insert into staff values
(11,'John Smith',101,2,'01-01-2021','31-12-2022');
insert into staff values
(12,'Emily Johnson',102,3,'15-03-2022','31-12-2023');
insert into staff values
(13,'Michael Brown',103,4,'01-07-2020','31-12-2024');
insert into staff values
(14,'Sarah Wilson',104,5,'01-01-2023','01-11-2025');

select * from staff;


insert into subject
values(21,'M1',102);

insert into subject
values(22,'English',103);

insert into subject
values(23,'Drawing',101);

insert into subject
values(24,'M2',104);

insert into subject
values(25,'Accounting',102);

select * from subject;


insert into SCHOLORSHIP 
values(1011,'Yes','No',03);

insert into SCHOLORSHIP 
values(1012,'No','Yes',02);

insert into SCHOLORSHIP 
values(1013,'Yes','No',01);

insert into SCHOLORSHIP 
values(1014,'No','Yes',04);


insert into project values
(123,'Website Redesign','6m',5000,101);

insert into project values
(124,'Market Research','3m',3000,102);

insert into project values
(125,'Software Development','9m',8000,103);

insert into project values
(126,'Machine Learning','6m',10000,104);

insert INTO STUDENT_PROJECT_ASSIGNMENT
values(01,124,102,'12-04-2022','13-05-2022','Completed');

insert INTO STUDENT_PROJECT_ASSIGNMENT
values(03,125,104,'23-04-2021','25-05-2021','Completed');

insert INTO STUDENT_PROJECT_ASSIGNMENT
values(02,126,101,'02-04-2023','','Not Completed');

insert INTO STUDENT_PROJECT_ASSIGNMENT
values(04,123,103,'17-06-2019','18-07-2019','Completed');


select * from student_project_assignment;

insert into staff_adderess values
(500001,'Abids',12);
insert into staff_adderess values
(500002,'Begumpet',11);
insert into staff_adderess values
(500003,'Hitech City',13);
insert into staff_adderess values
(500016,'Ameerpet',14);

select * from staff_adderess;

insert into student_adderess
values(505502,'uppal',02);

insert into student_adderess
values(505563,'kphb',03);

insert into student_adderess
values(505582,'ngri',04);

insert into student_adderess
values(505526,'Habsiguda',02);

select * from student_adderess;

===============================================================================

day 2:

-- Alter table all the tables 

alter table department modify(start_date not null );

alter table students modify(joining_date not null);

alter table roles modify(role_name not null);

alter table staff modify(staff_name not null,joining_date not null);

alter table Subject modify(Sub_name not null);

alter table Scholorship modify(eligible not null, non_eligible not null);

--alter table project modify (project_name not null, duration not null);

--alter table student_project_assignment modify (start_date not null, end_date not null);

--delete from student_project_assignment  where start_date ='';
 
--delete from student_project_assignment  where end_date ='';

--select * from student_project_assignment;

alter table staff_adderess modify (location not null);

alter table student_adderess modify(location not null);

create sequence my_seq
    increment by 1
    start with 1
    minvalue 1
    maxvalue 100
    nocycle;
    
create table seq (
    s_id int,
    s_marks int);
    
insert into seq (s_id) values  (my_seq.NEXTVAL);
insert into seq (s_id) values  (my_seq.NEXTVAL);
insert into seq (s_id) values  (my_seq.NEXTVAL);
insert into seq (s_id) values  (my_seq.NEXTVAL);
insert into seq (s_id) values  (my_seq.NEXTVAL);
insert into seq (s_id) values  (my_seq.NEXTVAL);
insert into seq (s_id) values  (my_seq.NEXTVAL);
insert into seq (s_id) values  (my_seq.NEXTVAL);
insert into seq (s_id) values  (my_seq.NEXTVAL);


select * from seq;

-- sequence decrement 
create sequence my_seq1
	start with 100
	increment by -1
	minvalue 1
	maxvalue 100
	nocycle;
    
insert into seq (s_id) values  (my_seq1.NEXTVAL);

select * from seq;

drop sequence my_seq1;

-- today topic assignement

Create table Employee(
    Emp_id number primary key,
    Emp_Name varchar(20),
    Salary number,
    Gender varchar(20),
    age number,
    Joining_date DATE,
    job varchar(50),
    dept_id NUMBER );
    

create sequence emp_seq
    increment by 1
    start with 1
    minvalue 1
    maxvalue 999999
    nocycle;
   

insert into employee
values(emp_seq.nextval,'Naveen',20000,'male',23,'05-06-2023','sql_developer',10);


insert into employee
values(emp_seq.nextval,'Raja',25000,'male',25,'03-05-2023','java_developer',30);


insert into employee
values(emp_seq.nextval,'Vaishnavi',22000,'female',24,'10-03-2023','devops',20);


insert into employee
values(emp_seq.nextval,'Sudeepthi',23000,'female',22,'25-02-2023','java_developer',30);


insert into employee
values(emp_seq.nextval,'Rajesh',30000,'male',23,'18-03-2022','HR',40);


insert into employee
values(emp_seq.nextval,'Anil',37000,'male',21,'27-03-2023','test_engineer',80);


insert into employee
values(emp_seq.nextval,'Satyanarayana',35000,'male',20,'12-10-2023','manager',50);


insert into employee
values(emp_seq.nextval,'Aparna',32000,'female',25,'19-08-2022','HR',40);


insert into employee
values(emp_seq.nextval,'Maneesha',29000,'female',28,'13-07-2021','sql_developer',10);


insert into employee
values(emp_seq.nextval,'Nithin',37000,'male',30,'31-08-2020','devops',20);


insert into employee
values(emp_seq.nextval,'Amani',45000,'female',32,'27-10-2020','manager',50);
commit;

select * from employee;


--write query to display emp_name and age whose is getting more then 400000 annual salary?

select emp_name,age,salary*12 as annsal from employee where salary * 12 > 400000;

--Write a query to display the emp datails whose name start with S and salary is morethen 20000?

SELECT *FROM employee
WHERE emp_name LIKE 'S%' AND salary > 20000;

--Write a query to display emp_name and salary whose age is  25  and  30?

SELECT emp_name, salary
FROM employee
WHERE age = 25 OR age = 30;

SELECT * from employee where salary = 25000 or salary =35000;

--write a query to display  whose name starts with A and ends with I ?
select * from employee where emp_name like 'a%i';

--query to display the emp name from emp table who joined on the date 5/3/2023?

select emp_name from employee where Joining_date like '5/3/2023';


--write a query to display employee information who joined in the year 2019 and salary is grater than 25000?
select * from employee where Joining_date like '2019%' and salary <25000;

--write a query to display  all female employees who's age is 20,21?

select * from employee where gender = 'female' and age = 20 and age=21;

--find emp_name start with 's' and are atleast three characters of length?
select emp_name from employee where emp_name like 's__%';

--.write a query to display the employnames who does not have salary 25000, 22000.	
select emp_name from employee where salary not in(25000,22000);

--write a query to display the emp datials who's age is greater than 21 and salary less than 35000 or gender is 'male'.
select * from employee where age > 21 and salary < 35000 or gender= 'male';

--write a query to display  all the employees who have joined in the month of march and having letter 's' as 
--the last but one character in emp_name. and salary between 25000 and 42000 and age equal to 23 
select * from employee where Joining_date like '%04%' and 
emp_name like 's%' and salary =25000 and salary = 42000 and age=23;

--Write a query to display employee information who's salary is greater than 20,000 and hiredate in the year 2020?
select * from employee where salary > 20000 and Joining_date like '%20';

--write a query to display all employees who's name as 'A' and should be female?
select * from employee where emp_name like 'A%' and gender ='female';

--Display all the employees who are having at least two AA's in their job name 
--and salary in the range 12000 to 28000 and age in 23,24,25?
select * from employee where 
job like '%aa%aa%' 
and salary between 12000 and 28000 
and age in (23,24,25);

select * from employee;

==============================================================================================

Retrieve the employee_id and employee_name of all employees whose email addresses contain the substring 'john'.
SELECT employee_id, employee_name
FROM employees
WHERE REGEXP_LIKE(email, 'john', 'i');

Find all employees whose email addresses start with 'm' and end with 'company.com'.
SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^m.*company\.com$', 'i');

Display the employee_name and email of employees whose email addresses do not contain any dots ('.').
SELECT employee_name, email
FROM employees
WHERE NOT REGEXP_LIKE(email, '\.');

List all employees whose email addresses have exactly one dot ('.') in the local part before '@company.com'.
SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^[^@]+(\.[^@]+)?@company\.com$', 'i');

Retrieve the employee_id, employee_name, and email of employees whose email addresses contain hyphens ('-').
SELECT employee_id, employee_name, email
FROM employees
WHERE REGEXP_LIKE(email, '-', 'i');

Find employees whose email addresses have the same first and last name in the local part before '@company.com'.
SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^([a-zA-Z]+)\.\1@company\.com$', 'i');

Display the employee_id and email of employees whose email addresses contain alphabetic characters followed by a dot ('.') followed by alphabetic characters before '@company.com'.
SELECT employee_id, email
FROM employees
WHERE REGEXP_LIKE(email, '^[a-zA-Z]+\.[a-zA-Z]+@company\.com$', 'i');

List all employees whose email addresses have exactly three characters before '@company.com'.
SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^.{3}@company\.com$', 'i');

Retrieve the employee_name and email of employees whose email addresses do not end with 'company.com'.
SELECT employee_name, email
FROM employees
WHERE NOT REGEXP_LIKE(email, 'company\.com$', 'i');

Find all employees whose email addresses start with an alphabetic character followed by any number of alphanumeric characters before '@company.com'.
SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^[a-zA-Z][a-zA-Z0-9]*@company\.com$', 'i');

Display the employee_id and email of employees whose email addresses contain only lowercase alphabetic characters before '@company.com'.
SELECT employee_id, email
FROM employees
WHERE REGEXP_LIKE(email, '^[a-z]+@company\.com$', 'i');
	
List all employees whose email addresses start with an alphabetic character followed by any number of alphanumeric characters, then a dot ('.'), and then again followed by any number of alphanumeric characters before '@company.com'.
SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^[a-zA-Z][a-zA-Z0-9]*\.[a-zA-Z0-9]+@company\.com$', 'i');

Retrieve the employee_name and email of employees whose email addresses contain alphabetic characters or hyphens ('-') before '@company.com'.
SELECT employee_name, email
FROM employees
WHERE REGEXP_LIKE(email, '[a-zA-Z-]+@company\.com$', 'i');

Find all employees whose email addresses contain exactly two dots ('.') in the local part before '@company.com'.
Display the employee_id and email of employees whose email addresses contain only lowercase alphabetic characters or dots ('.') before '@company.com'.
SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^[^@]+\.[^@]+\.[^@]+@company\.com$', 'i');

List all employees whose email addresses start with an alphabetic character followed by any number of alphanumeric characters or dots ('.'), then a hyphen ('-'), and then again followed by any number of alphanumeric characters before '@company.com'.
Retrieve the employee_name and email of employees whose email addresses contain exactly two hyphens ('-') in the local part before '@company.com'.
SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^[a-zA-Z0-9\.]+-[a-zA-Z0-9]+@company\.com$', 'i');

Find all employees whose email addresses contain exactly one dot ('.') and one hyphen ('-') in the local part before '@company.com'.

Display the employee_id and email of employees whose email addresses contain alphabetic characters followed by exactly two digits before '@company.com'.

List all employees whose email addresses start with an alphabetic character followed by any number of alphanumeric characters or dots ('.'), then a hyphen ('-'), and then again followed by any number of alphanumeric characters or dots ('.') before '@company.com'.


=======================================

Retrieve the employee_id and employee_name of all employees whose email addresses contain the substring 'john'.

SELECT employee_id, employee_name
FROM employees
WHERE REGEXP_LIKE(email, 'john', 'i');

Find all employees whose email addresses start with 'm' and end with 'company.com'.

SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^m.*company\.com$', 'i');


Display the employee_name and email of employees whose email addresses do not contain any dots ('.').

SELECT employee_name, email
FROM employees
WHERE NOT REGEXP_LIKE(email, '\.');


List all employees whose email addresses have exactly one dot ('.') in the local part before '@company.com'.

SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^[^@]+(\.[^@]+)?@company\.com$', 'i');


Retrieve the employee_id, employee_name, and email of employees whose email addresses contain hyphens ('-').


SELECT employee_id, employee_name, email
FROM employees
WHERE REGEXP_LIKE(email, '-', 'i');


Find employees whose email addresses have the same first and last name in the local part before '@company.com'.

SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^([a-zA-Z]+)\.\1@company\.com$', 'i');


Display the employee_id and email of employees whose email addresses contain alphabetic characters followed by a dot ('.') followed by alphabetic characters before '@company.com'.

SELECT employee_id, email
FROM employees
WHERE REGEXP_LIKE(email, '^[a-zA-Z]+\.[a-zA-Z]+@company\.com$', 'i');


List all employees whose email addresses have exactly three characters before '@company.com'.

SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^.{3}@company\.com$', 'i');


Retrieve the employee_name and email of employees whose email addresses do not end with 'company.com'.

SELECT employee_name, email
FROM employees
WHERE NOT REGEXP_LIKE(email, 'company\.com$', 'i');


Find all employees whose email addresses start with an alphabetic character followed by any number of alphanumeric characters before '@company.com'.

SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^[a-zA-Z][a-zA-Z0-9]*@company\.com$', 'i');


Display the employee_id and email of employees whose email addresses contain only lowercase alphabetic characters before '@company.com'.

SELECT employee_id, email
FROM employees
WHERE REGEXP_LIKE(email, '^[a-z]+@company\.com$', 'i');


List all employees whose email addresses start with an alphabetic character followed by any number of alphanumeric characters, then a dot ('.'), and then again followed by any number of alphanumeric characters before '@company.com'.

SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^[a-zA-Z][a-zA-Z0-9]*\.[a-zA-Z0-9]+@company\.com$', 'i');


Retrieve the employee_name and email of employees whose email addresses contain alphabetic characters or hyphens ('-') before '@company.com'.

SELECT employee_name, email
FROM employees
WHERE REGEXP_LIKE(email, '[a-zA-Z-]+@company\.com$', 'i');


Find all employees whose email addresses contain exactly two dots ('.') in the local part before '@company.com'.

SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^[^@]+\.[^@]+\.[^@]+@company\.com$', 'i');


Display the employee_id and email of employees whose email addresses contain only lowercase alphabetic characters or dots ('.') before '@company.com'.

SELECT employee_id, email
FROM employees
WHERE REGEXP_LIKE(email, '^[a-z\.]+@company\.com$', 'i');


List all employees whose email addresses start with an alphabetic character followed by any number of alphanumeric characters or dots ('.'), then a hyphen ('-'), and then again followed by any number of alphanumeric characters before '@company.com'.

SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^[a-zA-Z0-9\.]+-[a-zA-Z0-9]+@company\.com$', 'i');


Retrieve the employee_name and email of employees whose email addresses contain exactly two hyphens ('-') in the local part before '@company.com'.

SELECT employee_name, email
FROM employees
WHERE REGEXP_LIKE(email, '^[^-@]+-[^-@]+-[^@]+@company\.com$', 'i');


Find all employees whose email addresses contain exactly one dot ('.') and one hyphen ('-') in the local part before '@company.com'.

SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^[^-@]+-[^-@]+\.[^-@]+@company\.com$', 'i');


Display the employee_id and email of employees whose email addresses contain alphabetic characters followed by exactly two digits before '@company.com'.

SELECT employee_id, email
FROM employees
WHERE REGEXP_LIKE(email, '^[a-zA-Z]+\d{2}@company\.com$', 'i');


List all employees whose email addresses start with an alphabetic character followed by any number of alphanumeric characters or dots ('.'), then a hyphen ('-'), and then again followed by any number of alphanumeric characters or dots ('.') before '@company.com'.

SELECT *
FROM employees
WHERE REGEXP_LIKE(email, '^[a-zA-Z0-9\.]+-[a-zA-Z0-9\.]+@company\.com$', 'i');