--Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE REGEXP_LIKE(CITY, '^[aeiouAEIOU].*[aeiouAEIOU]$', 'i');

--Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE NOT REGEXP_LIKE(CITY, '^[aeiouAEIOU]', 'i');

--Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE NOT REGEXP_LIKE(CITY, '[aeiouAEIOU]$', 'i');

--Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE not REGEXP_LIKE(CITY, '^[aeiouAEIOU].*[aeiouAEIOU]$', 'i');

--Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(SUBSTR(CITY, 1, 1)) NOT IN ('A', 'E', 'I', 'O', 'U')
  AND UPPER(SUBSTR(CITY, -1, 1)) NOT IN ('A', 'E', 'I', 'O', 'U');
  
--Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

select name from employee order by name;

--Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than per month who have been employees for less than months. Sort your result by ascending employee_id.

select name from employee 
where salary > 2000
and months < 10
order by employee_id;

--Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:
--Root: If node is root node.
--Leaf: If node is leaf node.
--Inner: If node is neither root nor leaf node.

SELECT
    N,
    CASE
        WHEN P IS NULL THEN 'Root'
        WHEN N IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL) THEN 'Inner'
        ELSE 'Leaf'
    END AS NodeType
FROM
    BST
ORDER BY
    N;

--Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.

SELECT CEIL(AVG(SALARY) - AVG(TO_NUMBER(REPLACE(TO_CHAR(SALARY), '0', ''))))
FROM EMPLOYEES;

--We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.

SELECT MAX(months * salary) AS max_earnings,
    COUNT(*) AS employees_with_max_earnings
FROM Employee
WHERE months * salary = ( SELECT MAX(months * salary) FROM Employee );

--Query the following two values from the STATION table:
--The sum of all values in LAT_N rounded to a scale of  decimal places.
--The sum of all values in LONG_W rounded to a scale of  decimal places.

SELECT 
  ROUND(SUM(LAT_N), 2) AS SumLAT_N,
  ROUND(SUM(LONG_W), 2) AS SumLONG_W
FROM 
  STATION;


--Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less than . Truncate your answer to  decimal places.

select round(sum(lat_n),4) from station where lat_n > 38.7880 and lat_n < 137.2345;

--Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than . Truncate your answer to  decimal places.

select round(max(lat_n),4) from station where lat_n < 137.2345;


--Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than . Round your answer to  decimal places

select round(long_w,4) from station where lat_n =(select max(lat_n) from station where lat_n<137.2345);

--Query the smallest Northern Latitude (LAT_N) from STATION that is greater than . Round your answer to  decimal places.	
	
select round(min(lat_n),4) from station where lat_n > 38.7780;

--Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than . Round your answer to  decimal places.

select round(long_w,4) from station 
where lat_n = (select min(lat_n) from station where lat_n > 38.7780);


select round(abs(max(lat_n) - min(lat_n)) + abs(max(long_w) - min(long_w)), 4) from station;

select round(sqrt(power(max(LAT_N) - min(LAT_N), 2) + power(max(LONG_W) - min(LONG_W), 2)), 4)
FROM STATION;

--A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.

select round(st.lat_n,4) mediam 
from station st 
where (select count(lat_n) from station where lat_n < st.lat_n ) = 
(select count(lat_n) from station where lat_n > st.lat_n);

--Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

select sum(i.population) 
from city i, country c
where c.CONTINENT = 'Asia'
and i.countrycode = c.code;

--Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

select c.Continent, floor(avg(i.Population))
from city i, country c
where i.countrycode = c.code
group by c.Continent;



select 
case 
    when g.grade < 8 then null 
    when g.grade >= 8 then s.name 
end,
g.grade, std.marks 
from students s, grades g
where s.marks between g.min_mark and g.max_mark
order by g.grade desc, s.name asc;

--Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

SELECT hacker_id, name
FROM (
    SELECT h.hacker_id, h.name, COUNT(*) AS full_score_challenges
    FROM Submissions s
    JOIN Hackers h ON s.hacker_id = h.hacker_id
    JOIN Challenges c ON s.challenge_id = c.challenge_id
    JOIN Difficulty d ON c.Difficulty_level = d.Difficulty_level
    WHERE s.score = d.score
    GROUP BY h.hacker_id, h.name
    HAVING COUNT(*) > 1
)
ORDER BY full_score_challenges DESC, hacker_id ASC;

===============
#!/bin/bash

echo "Enter the limit:"
read limit

echo "Odd natural numbers up to $limit are:"

# Loop to iterate through odd numbers up to the specified limit
for ((i=1; i<=$limit; i+=2))
do
  echo $i
done


==========

--Write an SQL query to fetch the list of employees with the same salary.

select e.empno, e.ename, e.sal from emp e, emp a
where e.sal = a.sal
and e.empno <> a.empno;