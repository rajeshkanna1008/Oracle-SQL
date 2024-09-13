
1)find the secomd occurence of 7 from the string '7895-4562-859-4587-965'?

select instr ('7895-4562-859-4587-965','7',1,2) as second_occurence from dual;

2) find the  first occurence of 5 from the  above string?

select instr ('7895-4562-859-4587-965','5',1,1) as first_occurence from dual;

3)display employee details whose joined in sunday ?

select * from emp 
where joindate = 'sunday'; 

4)find the length of the string '7895-4562-859-4587-965'?

select length('7895-4562-859-4587-965') 
as len_string from dual;

5)display employee details who ended in april?

select * from emp 
where enddate = 'april';

7)who is getting higher salary than avg salary?

select emp_name from emp 
where salary > (select avg(salary) from emp);

6)get the employee details are not  joined in december ?

select * from emp 
where joindate <> 'december';

8)find the employee details whose  slaray is greater than 20000 ?

select * from emp 
where sal>20000;

9)find the employee details whose commission is less than 1000 ?

select * from emp 
where comm < 1000;

10)get the employee details who end_date in april and salary greater than 25000? 

select * from emp 
where end_date = 'april' and sal>25000;

11)display employee details whose salary is  25000,35000,20000?

select * from emp 
where sal in (25000,35000,20000);

12)get employee details who joined between 2016 to 2019?

select * from emp 
where join_date >= to_date ('2016-01-01', 'YYYY-MM-DD') 
and join_date <= to_date('2019-12-31', 'YYYY-MM-DD');

13)find the minimum salary of the employee ?

select min(sal) as minimum_salary from emp;

14)display the name start with letter 'r' from employee table ?

select emp_name from emp 
where name like 'r%';
 
15)write a query to retrieve the number of employees having different salaries in employee table ?

select count(distinct (sal)) 
as sal_count from emp; 

17)display employee details where salary is sorted in ascending order ?

select * from emp order by sal;

18)display employee details where commision sorted in descending order ?

select * from emp order by comm desc;

19)find the position of string from second occurence of '-' from the string '7895-4562-859-4587-965'?

select instr ('7895-4562-859-4587-965','-',1,2) 
as position from dual;

20)find employee id, employee name whose start in december ?

select empno, ename from emp
where to_char(hiredate,'MM') = 12;

21)find employee name whose started on monday ? 

select emp_name from emp 
where to_char (start_date,'day') = 'monday';

22)find employees who ended in april? .

select emp_name from emp where 
to_char(end_date,'MM') = 04;

23)find employees who startted in october, march, june?

select emp_name from emp 
where to_char (start_date,'MM') in (11,03,06);

24)find employee id, employeename whose salary is less than 20000 ?

select emp_id, emp_name from emp 
where sal<20000;

25)get the department id whose employee salary is between 20000 to 25000 ?

select dept_id from emp 
where sal between 20000 and 25000;
 
26)find today date ?

select sysdate from dual;

27)find employee name whose started on monday ?

select employee_name from employees 
where to_char (start_date, 'DAY') = 'monday';

28)find employee id and employee name  who started in october, march, june?

select emp_name from emp 
where to_char(start_date,'MM') in (11,03,06);

29)find employee whose salary is greater than 5000 ?

select emp_name from emp 
where sal>5000;

30)find employee id, employeename whose salary is less than 20000 ?

select emp_id, emp_name from emp 
where sal < 20000;

31)find employees salary and commision whose salary is less than 20000 and commision is greater than 500?

select sal, comm from emp 
where sal < 20000 and comm > 500;

32) get the department id whose employee salary is between 20000 to 25000 ?

select dept_id from emp 
where sal between 20000 and 25000;

33)display employee details whose  join date between april and august ?

select * from emp 
where to_char (start_date,'MM') 
between 04 and 07;

34)find today day?

select sysdate from dual;

35)find today month?

select to_char(sysdate,'month') 
as current_month from dual;

36)write a query to display all the departnames where number of employees are less than 2 ?

select dept_name from emp 
group by dept_name having count(*)<2;

37)Display department name and no of employess for each department and sum of their salary and greater than 2000?

select dept_name, count(*) as num_employees, sum(sal) as total_salary 
from emp
group by dept_name
having sum(sal) > 2000;

38)Print employee and department details who are getting highest salary and greater than 2000 


39)Create a department table with columns(dept_id,dept_name,salary, emp_name,who columns);

create table department (
  dept_id INT,
  dept_name VARCHAR(20),
  salary number,
  emp_name VARCHAR(20),
  who VARCHAR(20)
);



40)Display the avg salary of employess in each dept ?

select dept_no, avg(sal) from emp 
group by dept_no;
 
41)Display  the no of employees in each department   ?

select dept_name , count(emp_name) from emp 
group by dept_name;

42)Lpad the text in 'customer name' with 'abc' to a total length of 30 ?

select lpad('Rajesh', 30, 'abc') 
as padded_name from dual;

43)Lpad the text in 'customer name' with '123' to a total length of 20 ?

select lpad('Rajesh', 20, '123') 
as padded_name from dual;

44)Rpad the text in 'customer name' with 'abc' to a total length of 50 ?

select rpad ('Rajesh',50,'abc') 
as padded_name from dual;

45)Rpad the text in 'department name' with '*' to a total length of 10 ?

select rpad ('ACCOUNTING',10,'*') from dual;



46)create 5 questions on LTRIM and RTRIM ?

1. What is the purpose of the LTRIM function?
2. How does the LTRIM function work in SQL?




47)Employee who born in the year 1999 ?

select * from emp where DOB like '%1999';

48)Remove ' All ' from  the word 'ALL IS WELL' ?

select ltrim ('ALL IS WELL', 'ALL') from dual;

49)Combine employeeid,employee name,  with '-' symbol ?

select empno ||'-'|| ename from emp;

50)Remove  the ' up ' from  the word 'keep it up ' ?

select trim ('keep it up','up') from dual;

51)Display the Maximum salaray of the Employee ?

select emp_name,sal from emp 
where sal= (select max(sal) from emp);

52)Insert  5 Rows in employee table and department table ?

--insert inot emp TABLE

INSERT INTO EMP VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        TO_DATE('17-DEC-1980', 'DD-MON-YYYY'),  800, NULL, 20);
INSERT INTO EMP VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        TO_DATE('20-FEB-1981', 'DD-MON-YYYY'), 1600,  300, 30);
INSERT INTO EMP VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        TO_DATE('22-FEB-1981', 'DD-MON-YYYY'), 1250,  500, 30);
INSERT INTO EMP VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        TO_DATE('2-APR-1981', 'DD-MON-YYYY'),  2975, NULL, 20);
INSERT INTO EMP VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        TO_DATE('28-SEP-1981', 'DD-MON-YYYY'), 1250, 1400, 30);
		
		
-- insert into dept table

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');
INSERT INTO DEPT VALUES (50, 'DEVELOPER', 'INDIA');

53)Update the name by Ravi with Ravikumar ?

update emp set emp_name = 'Ravikumar' 
where 'emp_name = Ravi';

54)Modify the emp_name to employee name ?

alter table emp rename column 
emp_name to employee name;

55)Delete any one coloumn in employee table?

delete from table emp 
where emp_id = 7369;

56)Delete the record whose department is ECE ?

delete from dept 
where dept_name = 'ECE';

57)ADD new coloumn to employee table and department table ?

alter table emp add (emp_location varchar(20));
alter table dept add (No_of_emp, number);

58)Display emp id, empname from employee table ? 

select emp_id,empname from emp;

59)Display employee name whose salary is 25000?

select emp_name from emp 
where sal = 25000;

60)Display employee name whose startdate is april ?

select emp_name from emp 
where to_char (start_date,'MON') = 'APRIL';

61)Display employee name whose not in april ?

select ename from emp 
where to_char (hiredate,'MON')!= 'APRIL';

62)FIND THE NUMBER OF EMPLOYEES IN EMPLOYEE TABLE ?

select count(emp_name) from emp;

63)FIND THE HIGHEST SALARY FROM EMPLOYEE TABLE ?

select max(sal) from emp;
 
64)DISPLAY SALARYDETAILS,COMMISION DETAILS WHOSE EMPLOYE NAME IS RAVI ?

select sal,comm from emp 
where emp_name = 'RAVI';

65)DISPLAY  HIGHEST COMMISION WHOSE NAME START WITH R ?

select max(comm) from emp 
where emp_name like 'R%';

66)ET THE EMPLOYEE NAMES WHOSE EMPLOYEE SALARY IS BETWEEN 25000 TO 30000 ?

select emp_name from emp 
where sal between 25000 and 30000;

67)FIND THE TOTAL COMMISION FROM EMPLOYEE DETAILS ?

select sum(comm) as total_comm from emp;

68)DISPLAY EMPLOYEE DETAILS WHOSE  JOIN DATE BETWEEN APRIL AND AUGUST ?

select * from emp 
where to_char(hiredate,'mm') between '04' and '07';

69)Find the minimum salary of the employee ?

select ename from emp 
where sal in (select min(sal) from emp);

70)DISPLAY TOTAL NUMBER OF EMPLOYEES IN EACH DEPARTEMENT ?

select d.dname, count(e.ename) 
from emp e,dept d 
where e.deptno = d.deptno 
group by dname;

71)DISPLAY THE EMPLOYEE NAMES IN ASCENDING ORDER ?

select emp_name from emp order by emp_name;

72)Write a query to extract a substring from the string “Good Morning”, starting from the 2nd character and must contain 4 characters?

select substr ('Good Morning',2,4) from dual;

73)write a query to display all the departnames where number of employees are less than 2 ?

select dept_name from emp 
group by dept_name 
having count(emp_name)>2; 

74)Display department name and no of employess for each department and sum of their salary and greater than 2000?

SELECT d.dname, COUNT(e.empno) no_of_emp, SUM(e.sal) total_sal 
FROM emp e,dept d
where  d.deptno = e.deptno
GROUP BY d.dname
HAVING SUM(e.sal) > 2000 ; --***


75)Combine employeeid,salary,employee name with '#' symbol ?

select ename ||'#'|| sal ||'#'|| empno from emp;

76) What are joins in SQL?

Join is a query that is used to combine rows from two or more tables,
 It retrieves data from multiple tables.
 
Types of Joins:

Inner Joins (Simple Join)
Outer Joins
Left Outer Join (Left Join)
Right Outer Join (Right Join)
Full Outer Join (Full Join)
Equijoins
Self Joins
Cross Joins

77.What is the importance of SQL joins in database management?

joins play a crucial role in combining and accessing data from multiple tables, 
facilitating data integration, query flexibility, normalization, efficient retrieval, 
relationship representation, and data analysis in relational databases.

78.What is the difference between WHERE and HAVING in SQL?

where Clause:

		1. It is used to perform filtration on individual rows.
		2. It is implemented in row operations.
		3. The WHERE clause fetches the specific data from 
			particular rows based on the specified condition.
		4. The WHERE clause does not allow to work with aggregate functions.
		5. The WHERE clause acts as a pre-filter
		6. We can use the WHERE clause with the SELECT, UPDATE, and DELETE statements.
		7. The GROUP BY clause comes after the WHERE clause.

Having Clause:

		1. It is used to perform filtration on groups.
		2. It is implemented in column operations.
		3. The HAVING clause first fetches the complete data. 
		4. It then separates them according to the given condition.
		5. The HAVING clause can work with aggregate functions.
		6. The HAVING clause acts as a post-filter.
		7. The HAVING clause can only use with the SELECT statement.
		8. The GROUP BY clause comes before the HAVING clause.


79.What are the clauses in oracle SQL?

SELECT: The SELECT clause is used to specify the columns or 
expressions you want to retrieve from the database.

FROM: The FROM clause is used to specify the table or 
tables from which you want to retrieve data.

WHERE: The WHERE clause is used to filter rows based on specified conditions.

GROUP BY: The GROUP BY clause is used to group rows based on one or more columns. 
It is used in combination with aggregate functions (e.g., SUM, COUNT) 
to perform calculations on each group.

HAVING: The HAVING clause is used to filter groups based on conditions specified after the GROUP BY clause. 
It is similar to the WHERE clause but operates on grouped data.

ORDER BY: The ORDER BY clause is used to sort the result set based on one or more columns. 
It allows you to specify the sort order as ascending (ASC) or descending (DESC).

JOIN: The JOIN clause is used to combine rows from different tables based on specified join conditions. 
It allows you to retrieve data from multiple related tables in a single query.

UNION: The UNION clause is used to combine the result sets of two or 
more SELECT statements into a single result set. It removes duplicate rows by default.

DISTINCT: The DISTINCT clause is used to eliminate duplicate rows from the result set. 
It ensures that only unique values are returned for the specified columns.

LIMIT / FETCH: The LIMIT or FETCH clause is used to restrict the number of rows returned by a query. 
It is often used in conjunction with the ORDER BY clause.

80.Find the employee details whose salary is more than 25000 and age above 25?

select * from emp 
where sal > 25000 and age > 25;

81.Increase the employee sal by 25.85% whose salary is from 10000 to 25000 and decrease the employee sal by 10.52% whose salary is above 50000 ?

update emp 
set sal =
case 
     when sal between 1000 and 2500 then sal * 1.2585
     when sal > 2000 then sal * 0.8948
end;                     --***

82.list all the employee details who joined in last 2 years ?

select * from emp
where  hiredate >= ADD_MONTHS(TRUNC(SYSDATE), -24); --***

83.find the employees who are created in last 5 min?

select *
from employees
where creation_timestamp >= SYSTIMESTAMP - INTERVAL '2' MINUTE; --***


84.find the min,max sal of the employee?

select min(sal) min_sal, max(sal) max_sal from emp;

85.find the 4th highest salary from the employees.

select sal from (
  select sal, row_number () over (order by sal asc) as row_num
  from emp
) ranked_employees
where row_num = 4;   --***

86.find the 3th lowest salary form the employees.

select sal from (
  select sal, row_number () over (order by sal asc) as row_num
  from emp
) ranked_employees
where row_num = 3; --***

87.find the annual salary  of the employees who are in the  dept 10,30 and who are joined last two weeks?

select employee_id, salary * 12 as annual_salary 
from employees 
where department_id IN (10, 30)
and hire_date >= sysdate - INTERVAL '14' DAY;   --***

88.find the number of employees in each department ?

select dept_name, count(emp_name) from emp 
group by dept_name;

89.delete the dublicate records in the employee table?

delete from employees
where rowid not in (
    select min(rowid)
    from employees
    group by employee_id); --***


90.Increase the salary of employees by 20% whose experience is more than two years?

update employees
set salary = salary * 1.2
where hire_date <= add_months (trunc(sysdate), -24); --***


91 find the department details where number of employees are more than 2 ?

select deptno, dname, count(*) as num_employees
from emp
group by deptno, dname
having count(*) > 2;

92.find the details of employees whose age is between 22 to 28 and earn less than 30,000.

select * from emp 
where age 
between 22 and 28  and sal < 30000;

93. find the employees with age more than 26 or a salary more than 30000.

select * from emp 
where age > 26 or sal > 30000;

94. display the details of employees in Descending order according to salary

select * from emp 
order by sal desc;

95. find the dublicate records from the employee table.

select emp_id, count(*) as duplicate_count 
from emp group by employee_id having count(*) > 1;

96. display employee name ,salary ,hire date whose end date is not null;

select emp_name, sal, hire_date from emp 
where end_date is not null;

97. display all the employees whose departmentname is HR.

select * from emp 
where dept_name = 'HR';

98. delete the employee whose experience is more then 20years.

delete from emp 
where hiredate <= add_months(trunc(sysdate), -240); --***

99. delete the employee who are wrking as MANAGER and the name starts with 'S'.

delete from employees 
where job_title = 'MANAGER' 
and employee_name like 'S%';

100. display the employee details who joined before 2020?

select * from employees 
where hire_date < DATE '2020-01-01';

101. display the employee name, salary,emp_id, departmentname,joindate.

select emp_name, sall, emp_id, dept_name, join_date from emp;

102. Write a SQL query to find records in table A that are not in Table B without using NOT IN operator.?


103. How can we retrieve alternate records from a table ?


104. Write a Query to find Max salary from each department.?

select dept_name , max(sal) from emp 
group by dept_name;

105. How many duplicates are there in each em_id and display from employee table??

select em_id, count(*) as duplicate_count from emp 
group by em_id having count(*) > 1;

106. Display those employees who joined the company before 25th of the month?

select * from employee 
where to_char(join_date, 'DD')::integer < 25; --***

107. Display  employee names who have 5  experience in company??

select emp_name from emp 
where join_date <= current_date - interval '5 years'; -- if there is no experience column
--OR
select emp_name from emp where experience = 5;

108. Write a query to display the employee id and employee name who are working under the Manager id is 7782 in emp table.?

select emp_id, emp_name from emp
where manager_id = 7782;

109. Display employee salary  in words.?

select empno, ename, sal,
  initcap(to_char(to_date(sal, 'J'), 'JSP')) as salary_in_words
from emp; --***

110. Show employee name and job , who have the job equal to that of allen’s job.?

select emp_name, job from emp 
where job = (select job from emp where emp_name = 'ALLEN');

111. Copy the emp table as duplicate table name is emp_dup.?

create table  emp_dup  
as select * from emp;

112	 Write the query to get the first record from the table?

select * from emp 
where rownum = 1;

113. Show the maximum salary and minimum together from EMPLOYEES table.?

select max(sal) as maximum_salary, 
min(sal) as minimum_salary from emp;

114. Increase the salary of RS 1000 to each department?

update emp 
set sal = sal+1000;

115. Display the 50% records from the table.?

select * from emp 
fetch first 50 percent rows only;

116. Get all records from employee who are joined in 2020.?

select * from emp 
where to_char(join_date, 'YYYY')= '2020';

117. Display the name of employee whose joined in same date.?

select e1.ename
from emp e1
join emp e2 on e1.hiredate = e2.hiredate
where e1.empno <> e2.empno;

118. Find lowest salary from employee table.?

select min(sal) from emp;

119. Write an query to display records that are present in one table but not in another table?

--syntax
select * from table1 where column_name 
not in (select column_name from dept);

select * from emp where dept_no 
not in (select dept_no from dept);

120. write a query to join 4 tables.?

--syntax
select * from table1
join table2 on table1.column_name = table2.column_name
join table3 on table2.column_name = table3.column_name
join table4 on table3.column_name = table4.column_name;

121.write a query employee name and salary whos getting above 25000.?

select emp_name, sal from emp 
where sal > 25000;

122.Display the employee details whos name 3 letter is 'j'??

select * from emp where emp_name like '__j%';
--OR
select * from employee 
where substr(emp_name, 3, 1) = 'j';

123.Display 3 to 7 records from Employee table?

select * from emp offset 2 rows
fetch next 5 rows only;

124.Display all the records from Employee whose joining year is  2018?

select * from emp 
where  to_char(join_date ,'YYYY') = '2018';

125.Write a query to display  third day of Next Month??

select trunc(sysdate, 'MM') + interval '2' day + interval '1' 
month as third_day_next_month
from dual; --***

126.Create a sequence with maximum value 8 , increment value is 3 and insert the data in emp backup table?

create sequence emp_seq
    start with 1
    increment by 3
    maxvalue 8
    nocycle;
	
create table emp_backup (
    emp_id NUMBER,
    emp_name VARCHAR2(100),

);

insert into emp_backup (emp_id, emp_name) values (emp_seq.nextval,'Rajesh');
insert into emp_backup (emp_id, emp_name) values (emp_seq.nextval,'Naveen');
--or
select emp_seq.nextval, emp_name
from emp;

127.find avg salary for each department?

select dept_name, avg(sal) from emp 
group by dept_name;

128.create a backup table with only columns with fetching data?

create table backup_tb as 
select empno,ename,job from emp 
where empno is not null or ename is not null or job is not null ; 

select * from backup_tb;

129.write  a query to display the name and hire date of any employee hired after employee 'scott'.?

select ename, hiredate
from emp
where hiredate > (
  select hiredate
  from emp
  where ename = 'SCOTT'
); --***

130.Difference between group by and order by clause.?

GROUP BY:

	GROUP BY is used to group rows based on one or more columns
	and perform aggregate functions on each group.

	GROUP BY is typically used in combination with aggregate functions like COUNT(), SUM(), AVG(), etc., 
	to generate summary reports or analyze data by groups.
 
 
ORDER BY:

	ORDER BY is used to sort the result set based on one or 
	more columns in ascending or descending order.

	It arranges the rows in a specific order based on the specified column(s) or expressions.

	ORDER BY is commonly used to present data in a specific order, 
	such as sorting names alphabetically, ordering by dates, or arranging values from highest to lowest.


131.write a query to disply the first and last record from the employee table.?

select * from emp
order by emp_id
fetch first 1 row only;

select * from employee
order by employee_id desc
fetch first 1 row only; 

132.can you create a table to give all contraints for one column.If not why?

NO,

	Oracle, like many other relational database management systems, has limitations on the number 
	and types of constraints that can be applied to a single column. 
	These limitations are in place to maintain the performance and efficiency of the database.

	While Oracle supports multiple constraints on a column, 
	there are certain combinations or excessive use of constraints that may not be accepted. 
	For example, it is not possible to have both a CHECK constraint and a FOREIGN KEY constraint on the same column in Oracle.

133.Display name and start_date from employee whose start_date is 'TWELEFTH'??


134.Dislay the gender column data F as 'FEMALE' and M as 'MALE' from student table by using case??

select
  case gender
    when 'F' then 'FEMALE'
    when 'M' then 'MALE'
  end as gender_display
from student;

135.Display lowest commision whos second letter is 'A'??

select min(comm) from emp 
where emp_name like '_A%';

136.Write a Oracle SQL query to display the name and their annual salary. The result should contain those employees first who earning the highest salary.?

select emp_name, sal*12 as annual_salary from emp 
order by annual_salary; 

137.write a SQL query to find those employees who receive a higher salary than the employee with ID 163.?

select * from emp
where sal > (select sal from emp where emp_id = 163);

138.Write an SQL query to print the name of employees having the highest salary in each department.?

select dept_id, max(sal) as max_salary
from emp
group by dept_id;

139.Write an SQL query to fetch the first 50% records from a table.?

select * from emp
order by emp_name
fetch first 50 percent rows only;

140.write a query to delete duplicate rows from the table.?

delete from emp
where ROWID not in (
  select min(ROWID)
  from emp
  group by emp_id
);

141.How to fetch maximum salary of Employee and minimum salary of Employee together from Employee table.? 

select max(sal) as maximum_salary, min(sal) as minimum_salary from emp;

142.How to convert the System time in to seconds in oracle??

select
  (extract(hour from systimestamp) * 3600) +
  (extract(minute from systimestamp) * 60) +
  extract(second from systimestamp) as seconds
from dual;  --***

143.How to use count and group by at the same select statement??

SELECT column1, column2, COUNT(*) AS count
FROM your_table
GROUP BY column1, column2; 


144. write a SQL query to display all the data of employees including their department.?

select e.*, d.dept_name
from emp e
join dept d ON e.dept_id = d.dept_id; --***

145.DISPLAY 5 TO 7 ROWS FROM A TABLE?

select * from emp
order by emp_id
offset 4 rows fetch next 3 rows only; 

146.Display ename,dname even if there are no employees working in a particular department (use outer join)?.

select e.ename, d.dname from emp e
left outer join dept d on e.dept_id = d.dept_id; 

148.Give the command to add the constraint.?

create table sample_table
(
column1 data_type(size) constraint_name,
column2 data_type(size) constraint_name,
column3 data_type(size) constraint_name,
....
);


149.add the primary key constraint to employee.?

create table employee (
    employee_id int primary key,
    name varchar(50),
    age int,
    department varchar(50)
);


150.Display  names in reverse order?

select reverse(emp_name) as reversed_string
from emp;


151.Display those employee whose 10% of salary is equal to the year of joining?

select * from emp
where (sal * 0.1) = extract(year from joining_date); --***

153.Display those employee whose first 2 characters from hiredate -last 2 characters of salary?

select * from emp
where substr(hire_date, 1, 2) = substr(to_char(sal), -2);

155.Display those managers name whose salary is more than average salary of his employee?

select m.ename
from emp m
where m.sal > (
    select avg(e.sal)
    from emp e
    where e.mgr = m.empno
); --***

157.write a query to display last 5 records from employee table??

select * from emp
order by empno desc
fetch first 5 rows only;

158.write a query to find out the  records which created in last 5 mins.

select * from your_table
where created_at >= sysdate - interval '5' minute; 

159.write a query to find out the  records which created in last 2 weeks before.

select * from table_name
where created_at >= sysdate - interval '14' day; 

160.write a query to find out the  records which created in first week of any month .

select * from table_name
where extract(week from created_at) = 1;

161.write a query to find out the  records which created in last week of the any month .

select * from table_name
where extract(week from created_at) = extract(week from last_day(created_at));

162.find all employees whose salaries are greater than the average salary of all employees?

select ename, sal from emp  
where sal > (select avg(sal) from emp);

163.find all departments that do not have any employee with the salary greater than 10000?

select dept_name from emp 
where sal <10000;

164.find all employees whose salaries are greater than the lowest salary of every department?

select ename
from emp
where sal > (
    select min(sal)
    from emp  e
    where e.deptno = emp.deptno
);

165.change the salary by 0.25times in the employee table for all the employees whose age is greater than or equal to 27?

update emp set sal = sal*0.25 
where age >= 27;

166.how do you display the day of the week??

--using this command
select to_char (sysdate ,'Day') as day_of_week from dual;

167.list the employees  whose name starts with a,s characters??

select * from emp 
where emp_name like 'A%' or emp_name like 'S%';

168.how do you find second highest salary using self join??

select distinct e1.sal as second_highest_salary
from emp e1
where e1.sal < (
    select max(sal)
    from emp
)
order by e1.sal desc
fetch first 1 row only;  --***

169.write aquery to display details of employee who are also managers?

select * from emp where job = 'MANAGER';

170.write a query to  find records that are present in one table but not in another table?

select * from emp
where deptno not in
(select deptno from dept);

171.write a query to find those employee  whose salary matches the lowest salary of any of the employee?


172.retrive 3 tables data using minus??

--syntax

select column1, column2, column3 from table1
minus
select column1, column2, column3 from table2
minus
select column1, column2, column3 from table3;

173.display those employee whose joining of month and grade is equal?


174.display those employee whose salary is odd value?

select * from emp where mod (sal, 2)=1;

175.Display employee name,his manager and also display employee who are without manager?


176.list out all employees name,job,grade and department name for everyone in the company except clerk. Sort on the salary display the highest salary?


177.display last day of previous month?

select last_day(add_months(sysdate, -1)) as last_day_previous_month
from dual;

178.display first day of current year?

select trunc(sysdate, 'year') as first_day_current_year
from dual;

179.display first day of current quarter?


180.display last day of next week?

select trunc(next_day(sysdate + 7, 'sunday')) - 1 as last_day_next_week
from dual;


181.Write a query to fetch unique values  from emp table ?

select distinct * from emp;

182.Write an SQL query to show records from one table that another table does not have ?

select * from emp
where dept_no not in (
  select dept_no
  from dept);

183.Write an SQL query to fetch the first 50% records from a table ?

select * from emp
order by emp_name
fetch first 50 percent rows only;

184.Write an SQL query to fetch the job from emp table that have less than five people in it ?

select job from emp
group by job
having count(*) < 5;

185.Display employee records who gets more salary than the average salary?

select * from emp
where sal > (select avg(sal) from emp);

186.Display department_id and total no of employees working in each department_id ?

select deptno, count(*) as total_employees
from emp
group by deptno;

187.Write a query to get the total salary being paid to all employees ?

select sum(sal) as total_paid_sal from emp;

188.Write a query to get names in ascending order , deptno in ascending order and salary in descending order from any exstising table ?

select * from emp
order by ename asc, deptno asc, sal desc;

189.Write a query to get distinct records from the Employee table without using distinct keyword ?

select empno,ename,job, sal from emp
group by empno,ename,job, sal;

190.Display 3 to 7 records from Employee table by using rownum ?


191.Display duplicate rows from Employee table by using rowid ??


192.Display the experience of employees in weeks from any exsting table ??

select ename, floor((sysdate - hiredate) / 7) as experience_weeks
from emp;

193.Display ename,sal,dname from emp and dept table using natural join ??

SELECT ename, sal, dept_name
FROM emp
NATURAL JOIN dept;

194.Display DNAME from dept and Also display those employee name which do not have any DNAME ??


195.Find the names and hire dates for all employees who were hired before their managers, along with their managers names and hire dates ??


196.Write an SQL query to display both the EmpId and employee_name together ??

SELECT (Empno|| '-' || ename) AS EmpId_Name
FROM emp;

197.display last day of previous year?

select trunc(add_months(sysdate, -12), 'year') - 1 as last_day_previous_year
from dual;

198.display no of quaters in an year?


199.how to write sql query for the below scenario;

I/p:ORACLE

O/p:
O
R
A
C
L
E;

200.How to display following using query?

*

**

***