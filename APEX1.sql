CREATE TABLE employees (
  id integer,
  first_name varchar(20),
  last_name varchar(20),
  position varchar(20),
  salary varchar(20));

INSERT INTO employees VALUES 
(1, 'Andrew', 'Brown', 'Manager', 100000);
INSERT INTO employees VALUES 
(2, 'Maria', 'Johnson', 'Manager', 105000);
INSERT INTO employees VALUES 
(3, 'John', 'Anderson', 'Senior Manager', 130000);
INSERT INTO employees VALUES 
(4, 'Alex', 'Purple', 'Associate', 50000);
INSERT INTO employees VALUES 
(5, 'George', 'Bull', 'Senior Associate', 65000);
INSERT INTO employees VALUES 
(6, 'Jess', 'Fridman', 'Associate', 48000);
INSERT INTO employees VALUES 
(7, 'Marion', 'White', 'Senior Associate', 65000);
INSERT INTO employees VALUES 
(8, 'Andreea', 'Berton', 'Manager', 102000);
INSERT INTO employees VALUES 
(9, 'Bob', 'Johanson', 'Associate', 45000);
INSERT INTO employees VALUES 
(10, 'Georgia', 'Hoffman', 'Senior Associate', 66000);
INSERT INTO employees VALUES 
(11, 'Johan', 'Peterson', 'Senior Associate', 58000);

-- Rank()

select first_name,last_name,
rank() over (order by salary )
from employees;

select * from employees;

SELECT id,first_name, last_name,position,
  DENSE_RANK() OVER (partition by position ORDER BY salary DESC) AS emp_pos_rank
FROM 
  employees;

