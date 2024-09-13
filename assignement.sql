1.what is column level and table level constraint?

column level constraint means defining a constraint to one column. ex: Primary key
table level constraint means defining a constraint more then one table 

2.what is the use of check constraint?

check constraint is used to specify the condition on column,
that must be validated while inserting the data into the column.


3.create a table and write the query sequence in ascending order?

create sequence my_seq
	start with 1
	increment by 1
	min value 1
	max value 100
	nocycle;
	
4.write query of equence in descending order?
create sequence my_seq
	start with 100
	increment by -1
	minvalue 1
	maxvalue 100
	nocycle;
	
	
	

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