minus = To return all the rows of the first SELECT statement which are not common to the rows of the second SELECT statement, 
	After the subtraction process, the MINUS operator returns the uncommon or 
	unique records from the corresponding rows of the first SELECT statement.

There are however two mandatory conditions for using the MINUS operator in Oracle.

	Each SELECT statement must have the same number of expressions.
	Each corresponding expression in the different SELECT statement should be of the same data type.
	
syntax:
SELECT expr_1, expr_2, ... expr_n  
FROM table1  
WHERE conditions  
MINUS  
SELECT expr_1, expr_2, ... expr_n  
FROM table2  
WHERE conditions;   

===========================================================================================

functions:

Extract:
	The Oracle EXTRACT() function extracts a specific component 
	(year, month, day, hour, minute, second, etc.,) from a datetime or an interval value


MOD():
	the MOD() function returns the modulo operation. In other words, 
	it returns the remainder of its first argument divided by its second.
 
syntax:
MOD(n2, n1)
 
EX:
SELECT MOD(100, 6)
FROM DUAL;


====================================================================
clause:

FETCH clause:

The FETCH clause specifies the number of rows or percentage of rows to return.

syntax:
[ OFFSET offset ROWS]
 FETCH  NEXT [  row_count | percent PERCENT  ] ROWS  [ ONLY | WITH TIES ] 


OFFSET clause:

	The OFFSET clause specifies the number of rows to skip before the row limiting starts. 
	The OFFSET clause is optional. If you skip it, then offset is 0 and row limiting starts with the first row.

The offset must be a number or an expression that evaluates to a number. 
The offset is subjected to the following rules:
	If the offset is negative, then it is treated as 0.
	If the offset is NULL or greater than the number of rows returned by the query, then no row is returned.
	If the offset includes a fraction, then the fractional portion is truncated.
	
	
ONLY | WITH TIES:

	The ONLY returns exactly the number of rows or percentage of rows after FETCH NEXT (or FIRST).
	The WITH TIES returns additional rows with the same sort key as the last row fetched. 
	Note that if you use WITH TIES, you must specify an ORDER BY clause in the query. 
	If you don’t, the query will not return the additional rows.
	
	
--=========================================================
--Index 
Indexes are used to retrieve data from the database very fast. 
The users cannot see the indexes, they are just used to speed up searches/queries.

The CREATE INDEX command is used to create indexes in tables (allows duplicate values).

syntax =  
CREATE INDEX index
 ON TABLE column;

When should indexes be created: 
	A column contains a wide range of values.
	A column does not contain a large number of null values.
	One or more columns are frequently used together in a where clause or a join condition.
When should indexes be avoided: 
	The table is small
	The columns are not often used as a condition in the query
	The column is updated frequently	
	
	
types of indexes:
	1. Simple index 
		syntax : create index index_name on table_name (col1);
		in simple index we will mention only one column.
		ex: create index backup_idx on backup_tb (ename);

	2. composite index:
		syntax : create index index_name on table_name (col1,col2,.....);
		in composite index we will mention more then one cloumn.
		ex: create index backup2_idx on backup_tb(empno,ename);

	3. Implicit index:
		In this index the oracle server will automatically create a index for these columns,
		when we mention a constraints primary key & unique.
		-- implicit index will autometically create a 
		-- index for columns where primary key and unique constraints will mention on the columns.
		ex: create table work(
				empno int primary key,
				job_name varchar(20),
				phone_number number (10) unique);
				
	4. Unique index:
		syntax : create unique index index_name table_name (col);
		ex: create unique index work_uq_i on work (empno,phone_number);

--==================================================================================================
--=========================== Regular Expresions =============================
REGULAR EXPRESSIONS :
Regular expressions specifies a search pattern using meta characters and charcter literals.
oracle sql supports regular expressions with the pattern matching conditions and functions.

REGEXP_LIKE 
Condition that can be appear in the where clause of a query to return rows that match the given pattern.
REGEXP_COUNT
Function that returns the number of times the given patterm appers in the given string.
Function 
REGEXP_INSTR
Function that returns an integer that indicates the starting position of the given pattern in the string. the integer indicates the position immediatly following the end of the pattern .
REGEXP_REPLACE 
Function that returns an integer that indicates the starting position of the given string.
Alternatively the integer can indicate the position immediatly following the end of the pattern.
REGEXP_SUBSTR
It is same as the REGEXP_INSTR it matching integer instead matching substring itself.




select * from employee;
select * from employee where REGEXP_LIKE ( employee.last_name,'^su(nil|resh)');

select REGEXP_COUNT ('kamal','am',2,'i') REGEXP_COUNT from employee ;

SELECT REGEXP_COUNT('123123123123123', '(12)3', 1, 'i') REGEXP_COUNT
   FROM DUAL;
   
   CREATE TABLE regexp_temp(empName varchar2(20), emailID varchar2(20));

INSERT INTO regexp_temp (empName, emailID) VALUES ('John Doe', 'mailto:johndoe@example.com');
INSERT INTO regexp_temp (empName, emailID) VALUES ('Jane Doe', 'janedoe');

SELECT emailID, REGEXP_INSTR(emailID, '\w+@\w+(\.\w+)+') "IS_A_VALID_EMAIL" FROM regexp_temp;

EMAILID 	     IS_A_VALID_EMAIL
-------------------- ----------------
mailto:johndoe@example.com		    1
example.com			    0


select * from locations;
SELECT
  REGEXP_REPLACE(city,'(.)', '\1 ') "REGEXP_REPLACE"
  FROM locations;

REGEXP_REPLACE
--------------------------------------------------------------------------------
A r g e n t i n a
A u s t r a l i a
B e l g i u m
B r a z i l
C a n a d a
. . .

The following example examines the string, looking for two or more spaces. Oracle replaces each occurrence of two or more spaces with a single space.

SELECT
  REGEXP_REPLACE('500   Oracle     Parkway,    Redwood  Shores, CA',
                 '( ){2,}', ' ') "REGEXP_REPLACE"
  FROM DUAL;

REGEXP_REPLACE
--------------------------------------
500 Oracle Parkway, Redwood Shores, CA



RegEx on its own is a powerful tool that allows for flexible pattern recognition.
 You can use RegEx in many languages like PHP, Python, and also SQL.

RegEx lets you match patterns by character class (like all letters, or just vowels, or all digits).


| : A regular expression can be used to match different possibilities using the character |.

. : The wildcard period . matches any character.

  "w [w]w" : It is used to match the group of characters.
             You can use a character class (or character set) to match a group of characters, for example "b[aiu]g" would match any string that contains a b, then one letter between a, i and u, and then a g, such as "bug", "big", "bag",

 
" [a-z]" range : You have seen above how you can match a group of characters with character classes, but if you want to match a long list of letters that is a lot of typing.

                To avoid all that typing, you can define a range. For example you can match all letters between a and e with "[a-e]".

                A regex like "[a-e]at" would match all strings that have in order one letter between a and e, then an a and then a t, such as "cat", "bat" and "eat",

Range :
You can also use the hyphen to match numbers. For example "[0-5]" would match any number between 0 and 5, including 0 and 5.

You can also combine different ranges together in a single character set. For example "[a-z0-9]" would match all letters from a to z and all numbers from 0 to 5.


Regular expressions :

Regular expressions use patterns to match strings.
Regex in SQL provides a way to query databases to find a smaller subset of data.
The REGEXP operator is used as a keyword before the RegEx pattern to match patterns.
It supports metacharacters that allow flexibility and control while performing pattern matching.
The regular expressions or Regex in SQL are not case-sensitive and can be written as a combination of various data types like integers, special characters, images, and strings.

  


OPERATOR	DESCRIPTION
~	case sensitive, true if the pattern is contained in the string.

select REGEXP_REPLACE('lavanya12 ~`({3^.','[0-9^.{})(`~]') "NAME" from dual;

!~	case sensitive, true if the pattern is not contained in the string
~*	case insensitive, true if the pattern is contained in the string
!~*	case insensitive, true if the pattern is not contained in the string

$ : Matches the end of input.

Match All Letters and Numbers:  "[0-9a-zA-Z]" you can instead write "[[:alphanum:]]".

Match Everything But Letters and Numbers: "[^[0-9a-zA-Z]]" you can instead write "[^[:alphanum:]]".


select REGEXP_REPLACE ('lavanya^.','\^.' ,'')" REGEXP_REPLACE" from dual;

select REGEXP_REPLACE('lavanya214','[0-9]')"MODIFY_NAME"  from dual;

select REGEXP_REPLACE('lavanya12@ ~`({3^.','[0-9^.@{})(`~]') "NAME" from dual;

select REGEXP_REPLACE('lavanya123{9 ~`({3^.','[0-9^.{})(`~]') "NAME" from dual;



SELECT emailID, REGEXP_INSTR(emailID, '\w+@\w+(\.\w+)+') "IS_A_VALID_EMAIL" FROM regexp_temp;


SELECT REGEXP_COUNT('123123123123123', '(12)3', 1) REGEXP_COUNT
   FROM DUAL;
   
   select REGEXP_COUNT ('kamal','am',2,'i') REGEXP_COUNT from employee ;
   
   select * from employee where REGEXP_LIKE ( employee.last_name,'^sur');
   
SELECT * FROM employee WHERE  REGEXP_LIKE (salary,'2000$'); 

select * from employee where REGEXP_LIKE (FIRST_NAME,'d$');

SELECT * FROM employee WHERE  REGEXP_LIKE (salary,'^.{4}$');

SELECT * FROM employee WHERE  REGEXP_LIKE (salary,'^1');

SELECT * FROM employee WHERE  REGEXP_LIKE (last_name,'kamal|suresh');  

select * from employee where REGEXP_LIKE(last_name,'^su');

select REGEXP_COUNT ('abc1abc1','(abc)1',1)  as count from dual;


 SELECT REGEXP_INSTR('easy come, easy go','e\w*y',2) as instr from dual;
 
  SELECT REGEXP_INSTR('easy come, easy go','e\w*y',1,2) as instr from dual;
  
  SELECT REGEXP_SUBSTR('healthy,wealthy,wire, and wise','\w+thy',1,2)  as substr from dual;
  

Function Name	Description
-------------   -----------
REGEXP_LIKE	Similar to the LIKE operator, but performs regular expression matching instead of simple pattern matching.

REGEXP_INSTR	Searches for a given string for a regular expression pattern and returns the position were the match is found.

REGEXP_REPLACE	Searches for a regular expression pattern and replaces it with a replacement string.

REGEXP_SUBSTR	Searches for a regular expression pattern within a given string and returns the matched substring.

  
  


*
Matches zero or more occurrences

|
Alternation operator for specifying alternative matches

^/$
     
Matches the start of line and the end of line

[]
Bracket expression for a matching list matching any one of the expressions represented in the list

[^exp]
If the caret is inside the bracket, it negates the expression.

{m}
Matches exactly m times

{m,n}
Matches at least m times but no more than n times

[: :]
Specifies a character class and matches any character in that class

\
Can have four different meanings: (1) stand for itself; (2) quote the next character; (3) introduce an operator; (4) do nothing

+
Matches one or more occurrences

?
Matches zero or one occurrence

.
Matches any character in the supported character set (except NULL)

()
Grouping expression (treated as a single subexpression)

\n
Backreference expression

[==]
     
Specifies equivalence classes

[..]
     
Specifies one collation element (such as a multicharacter element)

  
  
Operator	Description
\d
Match a digit character

\D
Match a non-digit character

\w
Match a word character

\W
Match a non-word character

\s
Match a whitespace character

\S
Match a non-whitespace character

\A
Match only at beginning of string

\Z
Match only at end of string, or before newline at the end

\z
Match only at end of string

*?
Match 0 or more times (non-greedy)

+?
Match 1 or more times (non-greedy)

??
Match 0 or 1 time ( non-greedy)

{n}?
Match exactly n times (non-greedy)

{n,}?
Match at least n times (non-greedy)

{n,m}?
Match at least n but not more than m times (non-greedy)


ALTER TABLE customers 
ADD CONSTRAINT cust_email_addr 
CHECK(REGEXP_LIKE(cust_email,'@'))NOVALIDATE ; 


select distinct(last_name) 
from employee
where REGEXP_LIKE(last_name,'[lhni]$');
--====================================================================================================

select
(select count(ename) as no_of_emp_in_dept_10 from emp where deptno in (select deptno from emp where deptno = 10)) dept_10,
(select count(ename) as no_of_emp_in_dept_20 from emp where deptno in (select deptno from emp where deptno = 20)) dept_20,
(select count(ename) as no_of_emp_in_dept_10 from emp where deptno in (select deptno from emp where deptno = 30)) dept_30
from dual;



select substr('hello_abc_xyz_jkl',instr('hello_abc_xyz_jkl','_',1,2),
 instr('hello_abc_xyz_jkl','_',1,3)-instr('hello_abc_xyz_jkl','_',1,2)) substring
from dual;

select substr('hello_abc_xyz_jkl',instr('hello_abc_xyz_jkl','_',2),4) from dual;
















