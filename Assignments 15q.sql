--1.  write a SQL query to find those employees who receive a higher salary than the employee with ID 163. Return first name, last name

select first_name,last_name from emp 
where sal > (select sal from emp where emp_id = 163);

--2.  write a SQL query to find out which employees have the same designation as the employee whose ID is 169. Return first name, last name, department ID and job ID.

select first_name, last_name, department_ID, job_ID from emp 
where designation in (select designation from emp where emp_id = 169);

--3.  write a SQL query to find those employees whose salary matches the lowest salary of any of the departments. Return first name, last name and department ID.

select first_name, last_name, department_ID from emp 
where sal in (select min(sal) from emp group by department_ID);

--4.  write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.

select employee_ID, first_name, last_name from emp 
where sal > (select avg(sal) from emp)

--5.  write a SQL query to find those employees who report to that manager whose first name is ‘Payam’. Return first name, last name, employee ID and salary

select first_name, last_name, emp_id, sal from emp 
where mgr_id = (select emp_id from emp where first_name = 'Payam');

--6.  write a SQL query to find all those employees who work in the Finance department. Return department ID, name (first), job ID and department name.

select d.department_id, e.first_name, e.job_id, d.department_name from employees e
join departments d on e.department_id = d.department_id
where d.department_name = 'finance';
 
--7.  write a SQL query to find the employee whose salary is 3000 and reporting person’s ID is 121. Return all fields.

select * from emp where emp_id in (select emp_id from emp where sal = 3000 and reporting_id = 121);

--8.  write a SQL query to find those employees whose ID matches any of the numbers 134, 159 and 183. Return all the fields

select * from emp where emp_id in 
(select emp_id from emp where emp_id in (134,156,183));

--9.  write a SQL query to find those employees whose salary is in the range of 1000, and 3000 (Begin and end values have included.). Return all the fields.

select * from emp where sal in
( select sal from emp where sal between 1000 and 3000);

--10. write a SQL query to find those employees whose salary falls within the range of the smallest salary and 2500. Return all the fields.

select * from emp where salary between (select min(sal) )

--11. write a SQL query to find those employees who do not work in the departments where managers’ IDs are between 100 and 200 (Begin and end values are included.). Return all the fields of the employeess

select *from emp where dept_name not in 
(select dept_no from emp where mgr_id between 100 and 200);

--12. write a SQL query to find those employees who get second-highest salary. Return all the fields of the employees.

select * from emp where sal = (select max(sal) from emp 
 where sal not in (select max(sal) from emp));
  
--13. write a SQL query to find those employees who work in the same department as ‘Clara’. Exclude all those records where first name is ‘Clara’. Return first name, last name and hire date.

select first_name, last_name, hire_date from emp where dept_name = (select )

--14. write a SQL query to find those employees who work in a department where the employee’s first name contains the letter 'T'. Return employee ID, first name and last name.

select employee_ID, first_name, last_name from emp 
where dept_no in (select dept_no from emp where first_name like '%T%');

--15. write a SQL query to find those employees who earn more than the average salary and work in the same department as an employee whose first name contains the letter 'J'. Return employee ID, first name and salary.

select employee_ID, first_name, salary from emp 
where sal(select avg(sal) from emp) and deptno in(select deptno from emp where first_name like 'J%');
