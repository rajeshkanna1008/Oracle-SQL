select
(select count(ename) as no_of_emp_in_dept_10 from emp where deptno in (select deptno from emp where deptno = 10)) dept_10,
(select count(ename) as no_of_emp_in_dept_20 from emp where deptno in (select deptno from emp where deptno = 20)) dept_20,
(select count(ename) as no_of_emp_in_dept_10 from emp where deptno in (select deptno from emp where deptno = 30)) dept_30
from dual;


select substr('hello_abc_xyz_jkl',instr('hello_abc_xyz_jkl','_',1,2),
 instr('hello_abc_xyz_jkl','_',1,3)-instr('hello_abc_xyz_jkl','_',1,2)) substring
from dual;

select substr('hello_abc_xyz_jkl',instr('hello_abc_xyz_jkl','_',2),4) from dual;

select deptno, count(*) as emp_count , min(sal),max(sal),sum(sal),round(avg(sal)) from emp group by deptno;

select deptno,count(ename) no_of_emp,
        max(sal),
        min(sal),
        sum(sal),
        round(avg(sal)) 
        from emp 
        where deptno in (select deptno from emp where deptno in (10,20,30)) group by deptno;



select regexp_instr('abc123def','[[:digit:]]',1,1) from dual;
--or
select regexp_instr('abc123def','[0-9]',1,1) from dual;

select regexp_instr('abc123def','[[:digit:]]',1,1,1) from dual;

select regexp_substr ('Rajesh1108','[Raj]+') from dual;

select regexp_substr ('123 456 789 abc efg xyz','\w+',1,5) from dual;

select regexp_replace ('Rajesh -','-','Madupu') from dual;

select regexp_replace ('rajesh','r')from dual;


select * from emp;

update emp set end_date = '12-04-2022' where empno =7369;
update emp set end_date = '12-04-2022' where empno =7521;
