madupusiddu@gmail.com

naveenboyarevula1998@gmail.com

sudeepthi.thaati@gmail.com

vkolewar@gmail.com

rajanarendharreddynalla@gmail.com

alladisandeep1@gmail.com

anilkumarjarupula@gmail.com

sathish.kurra@globalsparktek.com
=====================================================
5. write query to display emp_name and age whose is getting more then 400000 annual salary?

select e_name,e_age,salary*12 annsal from emp where sal*12>400000


4. Write a query to display the emp datails whose name start with S 
and salary is morethen 20000?

SELECT *
FROM emp
WHERE name LIKE 'S%' AND salary > 20000;


3. Write a query to display emp_name and salary whose age is  25  and  30?

SELECT emp_name, salary
FROM emp
WHERE age = 25 OR age = 30;



maximum salary of an male employee
select max(salary) from emp where gender = 'm'


=========================================================================
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
	
4.write query of sequence in descending order?
create sequence my_seq
	start with 100
	increment by -1
	minvalue 1
	maxvalue 100
	nocycle;
	

5. wite the query to find the third highest salary person from the epmloyee
table but check his exprienace should not greater than 10 years?

select salary, emp_name from(select salary,name from emp order by salary desc)
where rownumber=3 and age <=30;

====================================================

3. write a query to display all the records present in the employee table?

select * from employee


2.write a query to display  who gets sal 25000 or 35000?

SELECT * from employee where salary = 25000 or salary =35000;

write a query to display the employee id and job 
present in the employee table where salary between 25000 and 40000?


=========================================

INSERT ALL
    INTO s2 (s_id,s_name) --destination table 
    SELECT s_id,s_name 
    FROM s1 -- source table
    WHERE s_id IN (
        SELECT s_id
        FROM s2
    )
SELECT s_id,s_name FROM s1;
