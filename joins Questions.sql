1. Write a query to display student details and dept details who are joining in the year of 2022 and dept_name is hr.

2. write a query to display staff details and subject details who are teaching English and drawing who is ending in the month of 12.

3. Write a query to display student details and project details who is working on website redesign and joining date from 2021 to till now.

4. write a query to display student details who are not completed their project work along with project name.

5. Write a query to display student details who are coming from ngri, and end_year in 23.
student, stu_location

1.Write a query to display student location, location pin and student name?
2.Write a query to display who are eligible for scholorship along with the name of the student and their department?
3.WAQTD student name, department name, project name, location pin?
4.WAQTD role name, staff name, joining date?
5.WAQTD project name, department name, duration of the project?


1.write a query to display the role name of the staff who are working as 'LIBRARIAN'
2.write a query to display projectname,startdate studentname who are completed intime?
3.write a query to display sub_name,staff_name,dept_name,rolename,,joining_date who are not 'principle'?
4.write a query to display department details and staff details where start date of department is in either 'march' or 'JULY'?
5.write a query to display dept_name,st_name,staffname,rolename,subname,project name?




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



--.Write a query to display student location, location pin and student name

SELECT
    s.st_name,
    l.location,
    l.loc_pin
FROM
    students          s,
    student_adderess  l
WHERE
    s.st_id = l.st_id;

--Write a query to display who are eligible for scholorship along with the name
--of the student and their department

select * from scholorship;
select * from dept;
select * from students;
--====================================
SELECT
    st.st_name,
    d.dept_name,
    sc.eligible
FROM
    students     st,
    department   d,
    scholorship  sc
WHERE
        st.st_id = sc.st_id
    AND st.dept_id = d.dept_id
    and sc.eligible = 'Yes' ;

--========================================

--WAQTD student name, department name, project name, location pin?
select * from students;
select * from project;
select * from dept;
select * from student_adderess;

SELECT
    st.st_name,
    d.dept_name,
    pr.project_name,
    sd.loc_pin
FROM
    students          st,
    project           pr,
    department         d,
    student_adderess  sd
WHERE
        st.st_id = sd.st_id
    AND pr.dept_id = d.dept_id
    AND st.dept_id = d.dept_id;
    
--=========================================

--WAQTD role name, staff name, joining date
select * from roles;
select * from staff;

SELECT
    r.role_name,
    st.staff_name
FROM
    roles  r,
    staff  st
WHERE
    r.role_id = st.role_id;
    
--================================================

--WAQTD project name, department name, duration of the project
select * from project;
select * from department;

select pr.project_name, pr.duration,d.dept_name
from project pr, department d
where d.dept_id = pr.dept_id;
--=============================================

--write a query to display the role name of the staff who are working as 'LIBRARIAN'
select * from roles;
select * from staff;

select r.role_name,st.staff_name
from roles r,staff st
where st.role_id = r.role_id
and role_name = 'librarian';

--write a query to display projectname,startdate, studentname who are completed intime

select * from project;
select * from student_project_assignment;
select * from students;

SELECT
    pr.project_name,
    sp.start_date,
    st.st_name,
    sp.completion_intime
FROM
    project                     pr,
    student_project_assignment  sp,
    students                    st
WHERE
        pr.project_id = sp.project_id
    AND sp.st_id = st.st_id
    AND completion_intime = 'Completed';


--write a query to display sub_name,staff_name,dept_name,rolename,,joining_date who are not 'principle'?
select * from subject;
select * from staff;
select * from department;


SELECT
    sub.sub_name,
    st.staff_name,
    dt.dept_name,
    r.role_name,
    st.joining_date
FROM
    subject     sub,
    staff       st,
    department  dt,
    roles       r
WHERE
        sub.dept_id = st.dept_id
    AND st.dept_id = dt.dept_id
    AND st.role_id = r.role_id
    AND role_name <> 'principle';
    
--write a query to display department details and staff details 
--where start date of department is in either 'march' or 'JULY'?


select * from staff;
select * from department;

SELECT
    d.dept_name,
    st.staff_name
FROM
    department  d
    LEFT JOIN staff       st ON st.dept_id = d.dept_id
WHERE
    to_char(start_date, 'FMMONTH') = 'MARCH'
    OR to_char(start_date, 'FMMONTH') = 'JULY';

--5.write a query to display dept_name,st_name,staffname,rolename,subname,project name

SELECT
    d.dept_name,
    st.st_name,
    sf.staff_name,
    r.role_name,
    pr.project_name
FROM
    department  d,
    students    st,
    staff       sf,
    roles       r,
    project     pr
WHERE
        d.dept_id = st.dept_id
    AND sf.dept_id = d.dept_id
    AND sf.role_id = r.role_id
    AND d.dept_id = pr.dept_id;


