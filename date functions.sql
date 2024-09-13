select * from emp;

select * from emp;
select
(select count(ename) as no_of_emp_in_dept_10 from emp where deptno in (select deptno from emp where deptno = 10)) dept_10,
(select count(ename) as no_of_emp_in_dept_20 from emp where deptno in (select deptno from emp where deptno = 20)) dept_20,
(select count(ename) as no_of_emp_in_dept_10 from emp where deptno in (select deptno from emp where deptno = 30)) dept_30
from dual;

select deptno,count(ename),sum(sal) from emp group by deptno order by deptno nulls first;


select e.ename, d.dname,e.hiredate,e.sal,e.sal*12 as annual_salary,
        case 
            when e.sal*12 < 100000 then (e.sal*12*10)/100 + e.sal*12
            when e.sal*12 = 100000 then (e.sal*12*5)/100 + e.sal*12
            when e.sal*12 > 100000 then (e.sal*12*2)/100 + e.sal*12
            when e.sal*12 = 'NULL' then 0
        end as increment_sal
from emp e , dept d
where e.deptno = d.deptno;


select e.ename,(select dname from dept d where d.deptno = e.deptno) dept_name,e.hiredate,e.sal,e.sal*12 as annual_salary,
        case 
            when e.sal*12 < 100000 then (e.sal*12*10)/100 + e.sal*12
            when e.sal*12 = 100000 then (e.sal*12*5)/100 + e.sal*12
            when e.sal*12 > 100000 then (e.sal*12*2)/100 + e.sal*12
            when e.sal*12 = 'NULL' then 0
        end as increment_sal
from emp e ;

-- to_char
select to_char(sysdate) from dual;
select to_char(sysdate,'D') from dual; -- day of a week
select to_char(sysdate,'DD') from dual; -- present day
select to_char(sysdate,'DDD') from dual; -- day of the year
select to_char(sysdate,'DDTH') from dual; --add th to the date
select to_char(sysdate,'DDSPTH') from dual; -- spelling of the current day
-- time
select to_char(sysdate,'HH:MI:SS') from dual; -- TIME by default it is in 12 hr
select to_char(sysdate,'HH24:MI:SS') from dual;
--to_date
select to_date('26/jan/2023') from dual;
select to_date('26/jan/2023')+5 from dual;
select to_date('26/01/2023', 'DD/MM/YYYY')+5 from dual;
select to_char(to_date('26-03-2023'),'DD/MONTH/YYYY') from dual;
select to_char(to_date('26-03-2023'),'DD/FMMONTH/YYYY') from dual;
select * from emp where to_char(hiredate,'mm') = 12;
select * from emp where to_char(hiredate,'YY') = 83;
-- automatic conversoin
select last_day(sysdate)from dual;
select last_day('02/05/2023') from dual;

--months_between:it returns the number of months present in the given two dates
select trunc(MONTHS_BETWEEN(SYSDATE,hiredate)/12) from emp;
select trunc(MONTHS_BETWEEN(SYSDATE,hiredate)) from emp;

--to_char: it is used to convert the date type to character type
select to_char(sysdate,'Dy-MM-YYYY') from dual;

--to_date: it is used to convert the character type to date type
select to_date('20-3-2022','DD-MM-YYYY')from dual;
select to_date(200322,'DD-MM-YY')from dual;

--months betwwen : it returns the number of months betwee the given two days
select months_between (to_date('20-02-2029','DD/MM/YYYY'),to_date('30-06-2026','DD/MM/YYYY')) FROM DUAL;

-- current_timestamp: it returns the current timestamp with time zone
select current_timestamp from dual;

--systimestamp: it returns the current system timestamp
select systimestamp from dual;

--current_date: it is used to return the current date, it is worked same as sysdate
select current_date from dual;

--add_months: it is used to add months to the given date
select add_months(sysdate,2)from dual;
select add_months(to_date('20-05-2022','DD/MM/YYYY'),5) from dual;

-- last_day: it is used to give the last day of the gievn month

select last_day(sysdate) from dual;
select last_day(add_months(sysdate,6)) from dual;

-- next_day: it return the next date of the given day
select next_day(sysdate,'Friday') from  dual;

--===================================================================

select (352.8*352.8) from dual;

create table test(num number);

insert
into test values(1);
insert
into test values(2);
insert
into test values(3);
insert
into test values(4);
insert
into test values(5);
select * from test;

select variance(num) from test;


select (3.53*3.53) from dual;

--=========================================================================
--1.Calculate tha variance of the employee salaries in employee table?
select variance(sal) from emp; 

--2.list the total employee sal who does not belong to any department?
select e.sal,e.ename from emp e,dept d where e.deptno=d.deptno and dname is null;
select sum(sal) from emp where deptno is null;

--3.list the employees in department 10 with the same job as in department 30?
select ename,job from emp
where deptno = 10
and job in (select job from emp where deptno = 30);

--4.To list the department and count of job in which there are more than one salesman?
select deptno,count(job) from emp 
where job = 'SALESMAN' 
group by deptno 
having count(job)>1;

--5.select the even number of records from employee table?
select * from 
            (select ename, rownum rn from emp) 
            where mod(rn,2)=0;

--6.select the odd number of records from employee table?
select * from 
            (select ename,rownum rn from emp) 
            where mod(rn,2) <> 0;

--7.Display the year and number of employess for the 
--year in which more than one  employee was hired?
select hiredate, count(ename) from emp 
group by hiredate 
having count(ename)>1;

--8.delete the duplicate records from the employee table?
delete emp where rowid not in(select max(rowid) from emp);

delete from emp where empno in (select empno from emp group by empno having count(empno)>1);
--9.List last five records from emp table?
select * from emp
minus
select * from emp
where rownum<(select max(rownum)-4 from emp);

--10.List the third highest salary from employee?
select * from emp where sal=(select max(sal) from emp where sal<
(select max(sal) from emp where sal<(select max(sal) from emp)));

select * from emp
order by sal desc
offset 2 rows fetch next 1 row only;

--11.List the different designations in deparetment 20 and 30 ?
select job from emp 
where deptno in (20,30)
group by job;

--12.list the employee names whose salary is greater than 
--the lowest sal of an employee belogs to the department 20?
select ename from emp 
where sal>(select min(sal) from emp where deptno=20);

--13.Create a view with columns empno and sal sal hike 
--10% and try to insert a row in this view and verify it?
create or replace view my_vi2 as
select empno,sal, sal+sal*10/100 as update_sal from emp;

insert into my_vi2 values (2222,15000,16200);

--14.Create a view  with the columns empno,ename,deptno,dname from the 
--corresponding department is ACCOUNTING and insert the rows into this view and verify the result?
create or replace view emp_vi as 
select e.empno, e.ename, d.deptno, d.dname 
from emp e, dept d
where e.deptno = d.deptno
and dname = 'ACCOUNTING';

--15.Print the Department wise average,minimum,maximun 
--and sum of all the employees annual salary of the employees? 
select * from 
(select deptno, sum(sal) as sum_of_sal,
                min(sal) as min_of_sal,
                max(sal) as max_of_sal,
                round(avg(sal)) as avg_sal,
                sum(sal*12) as annual_sal
                from emp
                group by deptno);


--Get the employees who has salary greater than his average department salary?
select ename,deptno,sal from emp e
where sal > (select avg(sal) from emp e2 where e.deptno=e2.deptno);

select round(avg(sal)),deptno from emp group by deptno;

select ename,deptno,sal
from emp e
where 1=1
group by ename,deptno,sal
having sal>(select avg(sal) from emp e1 where e1.deptno = e.deptno);

--get the employees whose sal is greater than his manager salary?
select e.ename as emp_name,e.sal as emp_sal, m.ename as mgr_name,m.sal as mgr_sal from emp e , emp m
where e.mgr = m.empno
and e.sal > m.sal;

--=================== Listagg ====================

select LISTAGG (empno,'-')
            within group (order by sal) "listtag"
            from emp;



select sal,LISTAGG (empno ||'-'|| coalesce (ename, ' '),';')
            within group (order by sal) "listtag"
            from emp
            group by ename,sal;
            
-- rank()
select ename,sal,deptno,
rank() over(order by sal)
from emp;

select ename,sal,deptno,
rank() over (partition by deptno order by sal) as part
from emp;

select *, 
rank() over (partition by deptno order by ename)
from emp;

-- dense rank()
select max(sal) from emp order by empno;


select * from (select sal,
dense_rank() over(order by empno desc) job_name
from emp ) a where a.job_name = 4;

select * from 
(select sal, dense_rank () over (order by empno desc))

select empno,ename,sal,hiredate,
dense_rank() over (partition by hiredate order by job) as num_of_count  from emp;


