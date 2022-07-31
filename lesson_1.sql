# Lesson 1
SHOW databases;

-- мій перши комметар --

# Мій другой комметар

/* 
  Lesson 1
    Use select, tables , .. 
    best regards ,
*/

#USE employees;

#SHOW tables;

/* select * from departments; */

SELECT * FROM employees.salaries;

#select distinct(salary) from salaries; 

/*
  Slide 9
    Task 1: Get a list of all first names from employees table
    Task 2: Get a list of all unique first names from employees table
    Task 3: Get a list of all department names (without duplicates) from departments table
 */
 
# Task 1 
SELECT first_name FROM employees.employees;

# Task 2
SELECT  DISTINCT first_name
FROM employees.employees;

# Task 3
SELECT DISTINCT dept_name  AS 'Depart name'
FROM employees.departments;


# Slide 12
SELECT CONCAT(first_name,' ',last_name) AS 'Full name'
FROM employees.employees;


# Slide 15
SELECT DISTINCT(emp_no) 
FROM employees.salaries
WHERE salary > 100000;


# Slide 20 
# Task 1
SELECT * FROM employees.employees WHERE first_name IN ('Denis', 'Elvis');  

# Task 2
SELECT *
FROM employees.employees
WHERE first_name NOT IN ('John', 'Marc', 'Jacob');

# Task 2
#SELECT * FROM employees.employees WHERE first_name NOT IN ('John', 'Mark', 'Jacob');


# Slide 23 
# Task 1
#SELECT * FROM employees.employees WHERE first_name LIKE  'Mark%';

# Task 2
SELECT * FROM employees.employees  WHERE hire_date LIKE '2__0%';

# Task 3
/*
SELECT *
FROM employees.employees
WHERE emp_no LIKE '1000_';
*/


# Slide 24
# Task 1 
SELECT *
FROM employees.employees
WHERE first_name NOT LIKE 'Jack' ;

# Task 2
SELECT dept_name
FROM employees.departments
WHERE dept_name LIKE '%a%' OR dept_name LIKE '_e%' AND dept_no IS NOT NULL;



# Slide 26
# Task 1
SELECT * FROM salaries WHERE salary  BETWEEN 66000 AND 70000;

# Task 2. First Variant
SELECT * FROM employees.salaries WHERE emp_no NOT BETWEEN 10004 AND 10012;
# Task 2. Second variant
# SELECT * FROM salaries WHERE emp_no > 10004 AND emp_no < 10012;

# Task 3
SELECT * FROM employees.departments WHERE dept_no BETWEEN 'd003' AND 'd006';


# Slide 29
# Task 1
# SELECT * FROM employees.employees ORDER BY first_name;

# Task 2
#SELECT * FROM employees.employees ORDER BY last_name DESC;

/* 
  Slide 31
  Task 1: Show 10 newest employees.
    Task 2: Show top 50 current salaries
*/
# Task 1
SELECT hire_date FROM employees.employees ORDER BY hire_date DESC LIMIT 10;

#SELECT max(hire_date) AS 'latest hire ' FROM employees.employees;

# Task 2
SELECT salary AS 'Salary', emp_no  AS 'Emp_no' FROM employees.salaries ORDER BY salary DESC LIMIT 50;

/*
  Slide 36
    Task 1: Show all employees who was hired in May
  Task 2: Show all female employees who was born in the summer
*/

# Task 1
SELECT first_name, last_name, hire_date 
FROM employees.employees 
WHERE MONTH(hire_date) = 5 
ORDER BY hire_date DESC;

#SELECT  first_name, last_name, MAX(hire_date)  FROM employees.employees;

# Task 2
SELECT first_name, last_name, hire_date FROM employees.employees
WHERE gender = 'F' 
ORDER BY hire_date ; 


# Slide 37
# Task 1: Show each employee who was hired on his/her birthday
SELECT first_name, last_name, hire_date, birth_date 
FROM employees.employees
WHERE MONTH(hire_date) = MONTH(birth_date) AND
DAY(hire_date) = DAY(birth_date);

# Slide 33
# Task 1
#SELECT 20 + 50  as Plus;+

# Slide 38
#SELECT curdate();

# Slide 39
# Task 1: Show all data from employees table and current age for 10 youngest employees
SELECT * FROM employees.employees ORDER BY birth_date LIMIT 10;

/*
  Slide 41.   
    Task 1: Show date that will be in 2 month
    Task 2: Show date thatesterday. Call output yesterday
*/

# Task 1.
SELECT ADDDATE('2022-07-24', interval +2  month); 

# Task 2.
SELECT ADDDATE('2022-07-24', INTERVAL -1 DAY) AS 'Yesterday';


# Slide 42
# Task 1: Show all data from employees table for employees who were hired in the age of 35 or older
SELECT * FROM employees.employees 
WHERE YEAR(birth_date) >= 35
ORDER BY birth_date ASC;
# Slide 44
# Task 1: Show for each employee: their full name as single column and their age (in years) whenhired to the company.
SELECT CONCAT(first_name,' ' ,last_name) AS 'Full name',  year(hire_date)-  year(birth_date)  AS 'Years old'
FROM employees.employees;