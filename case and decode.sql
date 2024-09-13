create table emp4(
      Empno NUMBER NOT NULL,
      Ename varchar(20),
      sal   NUMBER,
      comm  NUMBER,
      dob   varchar(50));
	  
insert into emp4 values (1,'Rajesh',2000,500,'11-10-1999');
insert into emp4 values (2,'Raja',5500,600,'12-11-1999');
insert into emp4 values (3,'Naveen',7000,600,'06-08-1998');
insert into emp4 values (4,'Anil',8000,600,'08-07-2000');
insert into emp4 values (5,'Sathyanarayana',10500,700,'18-06,2000');
insert into emp4 values (6,'Vaishnavi',11000,700,'25-04-1999');
insert into emp4 values (7,'Sudeepthi',12000,700,'28-02-1999');

update emp set comm = 
    case
        when(sal<5000) then comm*0.1
        when (sal between 5001 and 1000) then comm*0.12
        when (sal between 10001 and 50000) then comm*0.2
        when (sal>50001) then 0
    end;
	

  update emp4 set comm = 
    case
       when(sal<5000) then comm +  ((comm * 10)/100)
        when (sal between 5001 and 10000) then comm + ((comm *12)/100)
        when (sal between 10001 and 50000) then comm+ ((comm * 20)/100)
        when (sal >50001) then 0
    end;




select empno,ename,sal,dob, 
decode (DOB,'jan','Aries',
		DOB,'feb',' Taurus',
		DOB,'mar','Gemini',
		DOB,'apl','Cancer',
		DOB,'may','Leo',
		DOB,'jun','Virgo',
		DOB,'jul','Libra',
		DOB,'aug','Scorpio',
		DOB,'sep','Sagittarius',
		DOB,'oct','Capricorn',
		DOB,'nov','Aquarius',
		DOB,'dec','Pisces'
		);
		
select empno,ename,sal,dob,
decode (DOB,'mm','jan','Aries') as decoed_result from emp4 where DOB like '%jan%';

select empno,ename,sal,dob, 
decode (DOB,'mm','feb','Taurus')as decoed_result from emp4 where dob like '%feb%';











SELECT *
FROM (
  SELECT e.*, ROW_NUMBER() OVER (ORDER BY employee_id) AS row_num
  FROM employees e
) t
WHERE MOD(row_num, 2) = 0;
