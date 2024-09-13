CREATE TABLE EMP
       (EMPNO NUMBER(4) NOT NULL,
        ENAME VARCHAR2(10),
        JOB VARCHAR2(9),
        MGR NUMBER(4),
        HIREDATE DATE,
        SAL NUMBER(7, 2),
        COMM NUMBER(7, 2),
        DEPTNO NUMBER(2));
        
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
INSERT INTO EMP VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        TO_DATE('1-MAY-1981', 'DD-MON-YYYY'),  2850, NULL, 30);
INSERT INTO EMP VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        TO_DATE('9-JUN-1981', 'DD-MON-YYYY'),  2450, NULL, 10);
INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        TO_DATE('09-DEC-1982', 'DD-MON-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        TO_DATE('17-NOV-1981', 'DD-MON-YYYY'), 5000, NULL, 10);
INSERT INTO EMP VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        TO_DATE('8-SEP-1981', 'DD-MON-YYYY'),  1500,    0, 30);
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        TO_DATE('12-JAN-1983', 'DD-MON-YYYY'), 1100, NULL, 20);
INSERT INTO EMP VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        TO_DATE('3-DEC-1981', 'DD-MON-YYYY'),   950, NULL, 30);
INSERT INTO EMP VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        TO_DATE('3-DEC-1981', 'DD-MON-YYYY'),  3000, NULL, 20);
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        TO_DATE('23-JAN-1982', 'DD-MON-YYYY'), 1300, NULL, 10);
        
select * from emp;


CREATE TABLE DEPT
       (DEPTNO NUMBER(2),
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13) );
 
INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');


select ename from emp where mgr is null;

select * from emp where deptno = 10;

select * from emp where sal >= 1000;

select empno,ename,sal from emp where deptno in(10,20);

select * from emp where deptno=10 or sal=1000;

select count(deptno)from emp where comm is null;

select count (*) from emp where job = 'CLERK';

select avg(sal) from emp where sal>=1000;

select avg(sal) from emp where hiredate like '%81';

select sum(sal) from emp where job = 'CLERK';

select sum(sal) from emp where hiredate like '%83' and comm is null;

select min(sal) from emp where deptno = 10;

select max(sal) from emp where deptno = 20 and job = 'MANAGER';

select max(sal) from emp where comm between 1000 and 2000;

select ename, job, sal, deptno from emp order by deptno;

select * from emp where job = 'CLERK' order by hiredate;

select ename, min(sal) from emp group by ename ;

select job, count(*) from emp group by job;

select  ename,job, max(sal) from emp group by ename,job;

select deptno,ename,sal, min(sal)from emp group by deptno,ename,sal;

select sal from emp group by sal having sal>=1500;

select max(sal),ename,job,mgr from emp group by ename,job,mgr having max(sal)>=1500;

select deptno from emp group by deptno;

update emp 
set ename = 'Raje/sh'
where empno = 7566;

select * from emp
where ename like '%/%' escape 'R';

select * from emp;

CREATE TABLE SALGRADE
        (GRADE NUMBER primary key,
         LOSAL NUMBER,
         HISAL NUMBER);
 
INSERT INTO SALGRADE VALUES (1,  700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);

drop table salgrade;

select * from salgrade;

FLASHBACK table salgrade to before drop;

insert all 
into salgrade(GRADE,LOSAL,HISAL) values (6,600,1254)
into salgrade (GRADE,LOSAL,HISAL) values (7,800,1694)
into salgrade (GRADE,LOSAL,HISAL) values (8,400,2568)
select * from dual;
commit;

select * from salgrade;

