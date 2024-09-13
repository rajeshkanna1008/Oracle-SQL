--query the list of city names from station that do not start with vowels and do not end with vowels. your result cannot contain duplicates.

select distinct city
from station
where upper(substr(city, 1, 1)) not in ('a', 'e', 'i', 'o', 'u')
  and upper(substr(city, -1, 1)) not in ('a', 'e', 'i', 'o', 'u');
 

-- Write a query to display last year exact previous date

select to_date(to_char(add_months(sysdate, -12), 'dd-mm-yyyy')) -1 from dual;


-- display employee names based on the dept no
select deptno, listagg(ename, ', ') within group (order by deptno) as concatenated_values
from emp
group by deptno;


--write a pl sql program to display the total number of employees in a department, department_no is an dynamic input.
--total employees in 10: 3
--total employees in 20: 5
--total employees in 30: 6

declare
    v_department_no varchar2(50);
    v_department_id number;
    v_total_employees number;
begin
    v_department_no := :deptno;

    for i in (
        select to_number(regexp_substr(v_department_no, '[^,]+', 1, level)) as val
        from dual
        connect by regexp_substr(v_department_no, '[^,]+', 1, level) is not null
    )
    loop
        v_department_id := i.val;

        select count(*) into v_total_employees
        from emp
        where deptno = v_department_id;

        dbms_output.put_line('total employees in ' || v_department_id || ': ' || v_total_employees);
    end loop;

exception
    when no_data_found then
        dbms_output.put_line('department ' || v_department_id || ' not found.');
    when others then
        dbms_output.put_line('an error occurred: ' || sqlerrm);
end;
/

select * from emp fetch first 70 percent rows only; 

select * from emp;
/

declare
    num1 number := :num1;
    num2 number := :num2;
    
    num_large number := null;
    num_small number := null;
begin
    if num1 > num2 then
        num_large := num1;
        num_small := num2;
    elsif num1 < num2 then
        num_large := num2;
        num_small := num1;
    else
        num_large := num1;
        num_small := num2;
    end if;
    
    dbms_output.put_line('The smallest Number is: ' || num_small);
    dbms_output.put_line('The largest Number is: ' || num_large);
end;
/

select * from employees;

create or replace package insert_pkg 
is
procedure employees_insert(p_id number,
                           p_first_name varchar2,
                           p_last_name varchar2,
                           p_salary number,
                           p_department varchar2);
                           
function avg_salary (p_department varchar2)
    return number;
    
end insert_pkg;
/
create or replace package body insert_pkg 
is
    function avg_salary(p_department varchar2)
    return number is
    avg_sal number;
    begin
        select avg(salary) into avg_sal from employees where department = p_department;
        return avg_sal;
    end avg_salary;
    
    procedure employees_insert(p_id number,
                               p_first_name varchar2,
                               p_last_name varchar2,
                               p_salary number,
                               p_department varchar2)
    is
    begin
        insert into employees values (p_id, p_first_name, p_last_name, p_salary, p_department);
        commit;
    end;
end;

/

set serveroutput on;
DECLARE
  P_DEPARTMENT VARCHAR2(200);
  v_Return NUMBER;
BEGIN
  P_DEPARTMENT := 'Accounting';
  
  v_Return := INSERT_PKG.AVG_SALARY(
    P_DEPARTMENT => P_DEPARTMENT
  );
  
DBMS_OUTPUT.PUT_LINE('v_Return = ' || v_Return); 
END;

/
set serveroutput on;
DECLARE
  P_ID NUMBER;
  P_FIRST_NAME VARCHAR2(200);
  P_LAST_NAME VARCHAR2(200);
  P_SALARY NUMBER;
  P_DEPARTMENT VARCHAR2(200);
BEGIN
  P_ID := 11;
  P_FIRST_NAME := 'Rajesh';
  P_LAST_NAME := 'M';
  P_SALARY := 1000;
  P_DEPARTMENT := 'Accounting';

  INSERT_PKG.EMPLOYEES_INSERT(
    P_ID => P_ID,
    P_FIRST_NAME => P_FIRST_NAME,
    P_LAST_NAME => P_LAST_NAME,
    P_SALARY => P_SALARY,
    P_DEPARTMENT => P_DEPARTMENT
  );
commit;
END;
/
select * from employees;
