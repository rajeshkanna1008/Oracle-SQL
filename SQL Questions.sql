1.Write a query to display student location, location pin and student name?
2.Write a query to display who are eligible for scholorship along with the name of the student and their department?
3.WAQTD student name, department name, project name, location pin?
4.WAQTD role name, staff name, joining date?
5.WAQTD project name, department name, duration of the project?
6.write a query to display the role name of the staff who are working as 'LIBRARIAN'
7.write a query to display projectname,startdate studentname who are completed intime?
8.write a query to display sub_name,staff_name,dept_name,rolename,,joining_date who are not 'principle'?
9.write a query to display department details and staff details where start date of department is in either 'march' or 'JULY'?
10.write a query to display dept_name,st_name,staffname,rolename,subname,project name?
11. write query of sequence in descending order?
12. write the query to find the third highest salary person from the epmloyee
table but check his exprienace should not greater than 10 years?
13. Display department name and no of employess for each department and sum of their salary and greater than 2000?
14. Increase the employee sal by 25.85% whose salary is from 10000 to 25000 and decrease the employee sal by 10.52% whose salary is above 50000 ?
15. Write a query to display last 5 minutes inserted records from employee table?
16. find the 4th highest salary from the employees?
17. write a query to disply the first and last record from the employee table?
18. Write a query to convert the System time in to seconds?
19. Display those managers name whose salary is more than average salary of his employee?
20. Write a SQL query to retrieve the unique list of all cities from both the customers and suppliers tables.


TABLES

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

CREATE TABLE Customers (
    customer_id   NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100),
    city          VARCHAR2(100)
);

CREATE TABLE Suppliers (
    supplier_id   NUMBER PRIMARY KEY,
    supplier_name VARCHAR2(100),
    city          VARCHAR2(100)
);


INSERT INTO Customers (customer_id, customer_name, city) VALUES (1, 'ABC Company', 'New York');
INSERT INTO Customers (customer_id, customer_name, city) VALUES (2, 'XYZ Corp', 'Los Angeles');
INSERT INTO Customers (customer_id, customer_name, city) VALUES (3, 'LMN Ltd', 'Chicago');
INSERT INTO Customers (customer_id, customer_name, city) VALUES (4, 'PQR Inc', 'Houston');


INSERT INTO Suppliers (supplier_id, supplier_name, city) VALUES (101, 'Supplier A', 'Chicago');
INSERT INTO Suppliers (supplier_id, supplier_name, city) VALUES (102, 'Supplier B', 'New York');
INSERT INTO Suppliers (supplier_id, supplier_name, city) VALUES (103, 'Supplier C', 'Los Angeles');
INSERT INTO Suppliers (supplier_id, supplier_name, city) VALUES (104, 'Supplier D', 'Houston');


insert into department values
(101,'Engineering','01-01-2021','30-06-2022');

insert into department values
(102,'Marketing','15-03-2022','31-12-2023');

insert into department values
(103,'Finance','01-07-2020','30-12-2023');

insert into department values
(104,'HR','01-01-2023','30-06-2022');


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



insert into staff values
(11,'John Smith',101,2,'01-01-2021','31-12-2022');
insert into staff values
(12,'Emily Johnson',102,3,'15-03-2022','31-12-2023');
insert into staff values
(13,'Michael Brown',103,4,'01-07-2020','31-12-2024');
insert into staff values
(14,'Sarah Wilson',104,5,'01-01-2023','01-11-2025');



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




insert into staff_adderess values
(500001,'Abids',12);
insert into staff_adderess values
(500002,'Begumpet',11);
insert into staff_adderess values
(500003,'Hitech City',13);
insert into staff_adderess values
(500016,'Ameerpet',14);



insert into student_adderess
values(505502,'uppal',02);

insert into student_adderess
values(505563,'kphb',03);

insert into student_adderess
values(505582,'ngri',04);

insert into student_adderess
values(505526,'Habsiguda',02);
