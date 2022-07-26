# Lesson 3

# FROM-WHERE-GROUP BY-HAVING-SELECT-ORDER BY - приоритетнисть 
USE employees; # указываем что будем использовать бд 

SHOW TABLES; # показывает таблицы

#SHOW  COLUMNS  FROM  employees.salaries;

SELECT COUNT(*) FROM employees.titles;

SELECT COUNT(*) FROM employees.salaries;


SELECT * FROM employees.employees;


SELECT  MAX(salary), MIN(salary) FROM employees.salaries;

select * from employees.salaries;
SELECT MAX(salary), min(salary) FROM employees,salaries;

SELECT emp_no, MAX(salary),
MIN(salary)
FROM employees.salaries
WHERE emp_no = 10001;

/*titles
SHOW  COLUMNS  FROM  employees.salaries; # показывает типы данных в таблице по колонкам

SELECT md5('');

SELECT title, count(title) AS  'Count'
 FROM employees.titles
 GROUP BY title
 ;

 /* Aggregation func
	max() - find max in column. Example: SELECT MAX(salary) FROM employees.salaries;
	min() - find min in column. Example: SELECT MIN(salary) FROM employees.salaries;
    avg() - find mean in column. Example:  SELECT AVG(salary) FROM employees.salaries;
    count() - calculate all in column. Example: SELECT COUNT(*) FROM employees.salaries;
    sum() - calculate sum. Example: SELECT SUM(salary) FROM employees.salaries;
 */
  #SELECT MIN(salary), MAX(salary), AVG(salary) FROM employees.salaries;
 
 #SELECT emp_no, COUNT(emp_no), COUNT( DISTINCT emp_no)
 #FROM employees.salaries
 #WHERE emp_no = 10002;
 
 SELECT * from employees.salaries;
 # Group by  
 #  Count all male 
 SELECT * from employees.employees;
 

 
 SELECT DISTINCT(first_name), COUNT(emp_no)
 FROM employees.employees
 GROUP BY first_name
 ORDER BY first_name DESC;
 
 SELECT first_name, count(emp_no)
 FROM employees.employees
 WHERE gender = 'M'
 GROUP BY first_name;


SELECT emp_no, COUNT(emp_no),  MIN(salary), MAX(salary), SUM(salary)
 FROM employees.salaries
 GROUP by emp_no;
 
 
 select * from employees.salaries
 WHERE emp_no = 10002;
 
 
SELECT emp_no, AVG(salary)
FROM employees.salaries
GROUP BY emp_no;

SELECT * FROM employees.titles;

SELECT title, count(title) AS 'Count'
FROM employees.titles
GROUP BY title;
 

#SELECT gender, COUNT(emp_no) 
#FROM employees.employees
#GROUP BY gender;

# Having 
# Student des 1 
SELECT first_name, last_name, count(emp_no)
FROM employees.employees
GROUP BY first_name, last_name
HAVING COUNT(emp_no) >= 5;

# Student des 2
SELECT emp_no, avg(salary) AS 'Average annual salary'
FROM employees.salaries
GROUP BY emp_no
HAVING avg(salary) > 120000;

/* 
Slide 8
Task 1: Select all employees whose average salary is higher than $120,000 per  annum.
*/
SELECT  emp_no , AVG(salary)
FROM employees.salaries  
GROUP BY emp_no
HAVING AVG(salary) > 120000;


# Slide 10
SELECT first_name, COUNT(first_name) AS names_count 
FROM employees.employees
WHERE hire_date > '1999-01-01' 
GROUP BY first_name 
HAVING COUNT(first_name)  <  200 
ORDER BY (first_name) DESC;


SELECT * FROM employees.employees
WHERE first_name  = 'Zsolt' AND hire_date > '1991-01-01';


/*
Slide 11-12
Task 1: Select the employee numbers of all individuals who have signed  more than 1 contract after the 1st of January 2000.
Task 2: What is the total amount of money spent on salaries for all contracts  starting after the 1st of January 1997?
*/

# Task 1 
SELECT emp_no, COUNT(emp_no)
FROM employees.dept_emp
WHERE from_date > '2000-01-01' 
GROUP BY emp_no
HAVING COUNT(dept_no) > 1;

# Task 1.1
SELECT emp_no, COUNT(from_date)
FROM employees.dept_emp
WHERE from_date  >  '2000-01-1'
GROUP BY emp_no
HAVING COUNT(from_date) > 1;

# Task 2
SELECT SUM(salary) 
FROM employees.salaries
WHERE from_date > '1997-01-01';



/* 
Slide 13
Task 1: Which is the lowest employee number in the database?
Task 2: Which is the highest employee number in the database?
*/
# Task 1 - 2
SELECT MIN(emp_no), MAX(emp_no) FROM employees.employees;


/*
Slide 15
Task 1: Show average annual salaries that are above 100k USD paid to  employees who started after the 1st of January 1997?
*/
SELECT emp_no, AVG(salary)
FROM employees.salaries
WHERE from_date > '1997-01-1'
GROUP BY emp_no
HAVING AVG(salary) > 100000;

# Slide 16 - round( value, point after)


/*
Slide 17
Task 1: Round the average amount of money spent on salaries for all contracts  that started after the 1st of January 1997 to a precision of cents.
*/
SELECT ROUND(AVG(salary), 2)  AS 'Round Avg'
FROM employees.salaries
WHERE from_date > '1997-01-01';

/*
	Вивести всіх співробітників в кого рік народження між 1955 і 1970
    Наступний пункт sorted 
*/

SELECT * FROM employees.employees
WHERE YEAR(birth_date) BETWEEN 1955 AND 1970;


/*
	Вивести всіх співробітників кто отримав зп в  2002
    Наступний пункт sorted 
*/
SELECT * FROM employees.salaries
WHERE  2002 >= YEAR(from_date)  AND  YEAR(to_date) >= 2002;

# SELECT * FROM employees.salaries
# WHERE 2002 BETWEEN YEAR(from_date) AND YEAR(to_date);

