Single Row Functions:
---------------------
General functions
------------------
NVL, NVL2, NULLIF, COALESCE, CASE, DECODE.

SELECT first_name, last_name, salary, NVL (commission_pct,0) 
FROM employees
WHERE rownum < 5;

SELECT NVL2(JOB_CODE, 'Job Assigned', 'Bench')
FROM employees;

SELECT NULLIF ('SUN', 'MOON')
FROM DUAL; -- if first value is null then we get a error

Case Conversion functions
-------------------------
Upper
Lower
Initcap

SELECT UPPER (first_name), INITCAP (last_name), LOWER (job_id)
FROM employees
WHERE rownum < 5;

Character functions
---------------------
Concat -- ||
Length
Substr
Instr
Lpad
Rpad
Trim
Replace

CONCAT function concatenates two string values.(||)

SELECT CONCAT (first_name, last_name) 
FROM employees
WHERE rownum < 5;

LENGTH function returns the length of the input string.

SUBSTR function returns a portion of a string from a given start point to an end point.

INSTR function returns numeric position of a character or a string in a given string.

SELECT SUBSTR (first_name,1,5), INSTR (first_name,'a')
FROM employees
WHERE rownum < 5;

LPAD and RPAD functions pad the given string upto a specific length with a given character.

SELECT RPAD(first_name,10,'_')||LPAD (job_id,15,'_')
FROM employees
WHERE rownum < 5;

TRIM function trims the string input from the start or end.

select substr('sathish',2,4) from dual;

select instr('sathisha','a',1,2) from dual;

select concat(ename,concat(empno,job)) from emp;

select lpad('df',5,'-') from dual;

select rpad('fff',3,'-') from dual;

select length(TRIM(LEADING ' ' FROM ' ABC ')) from dual;

select length(TRIM(TRAILING ' ' FROM ' ABC ')) from dual;

SELECT TRIM(LEADING '0' FROM '000123450') FROM dual;

SELECT TRIM(BOTH '.' FROM '...Cat...') FROM DUAL;

select ltrim('-ss','-') from dual;

select rtrim('ss-','-') from dual;

select replace('ssdfs','s','@') from dual;

REPLACE function replaces characters from the input string with a given character.

Date functions
---------------
MONTHS_BETWEEN, ADD_MONTHS, NEXT_DAY, LAST_DAY, ROUND and TRUNC.

MONTHS_BETWEEN function returns the count of months between the two dates.

SELECT employee_id, MONTHS_BETWEEN (sysdate, hire_date) Employment_months
FROM employees
WHERE rownum < 5;

ADD_MONTHS function add 'n' number of months to an input date.

NEXT_DAY function returns the next day of the date specified.

LAST_DAY function returns last day of the month of the input date.

SELECT ADD_MONTHS (sysdate, 5), NEXT_DAY (sysdate)
FROM dual;

ROUND and TRUNC functions are used to round and truncates the date value.

SELECT ROUND (1372.472,1)
FROM dual;

ROUND(1372.472,1)
-----------------
           1372.5

SELECT TRUNC (72183,-2)
FROM dual;

TRUNC(72183,-2)
---------------
          72100

Number functions
-----------------
ROUND, TRUNC, and MOD.

ROUND and TRUNC functions are used to round and truncate the number value.

MOD is used to return the remainder of the division operation between two numbers.

select round(99.446,-2) from dual;

select trunc(99.22,-2) from dual;

select mod(9,2) from dual;


Aggrigate Functions/Multi Row Functions
----------------------------------------
select count(empno) from emp;

select count(*) from emp;

select sum(sal) from emp;

select avg(sal) from emp;

select min(sal) from emp;

select max(sal) from emp;