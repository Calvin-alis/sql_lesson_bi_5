# Add case

USE employees;

SHOW TABLES;

SELECT * FROM employees.employees;
WITH full_nameCTE(full_name)
AS (
		SELECT CONCAT(first_name, ' ', last_name) FROM employees.employees
)

SELECT * from full_nameCTE;

select * from employees.employees;


SELECT emp_no,  first_name, last_name,
	CASE 
		WHEN gender = 'M'  THEN 'Male'
		WHEN gender = 'f' THEN 'Female'
		END AS 'Full gender'
FROM employees.employees;


SELECT * FROM employees.salaries;


SELECT es.emp_no,  ee.first_name, ee.last_name, es.salary,
	CASE 
		WHEN gender = 'M'  THEN 'Male'
		WHEN gender = 'f' THEN 'Female'
		END AS 'Full gender',
	CASE 
		WHEN es.salary BETWEEN 40000 AND 70000 THEN 'Low class'
        WHEN es.salary BETWEEN 70000 AND 100000 THEN 'Middle class'
        WHEN es.salary BETWEEN 100000 AND 120000 THEN 'High class'
        ELSE 'Class 1'
        END AS 'Level of salary'
FROM employees.salaries AS es
INNER JOIN employees.employees AS ee USING(emp_no);


SELECT emp_no, salary, IF(salary >= (SELECT AVG(salary) FROM employees.salaries), 'More or equal avg',  'Less that equal ')
FROM employees.salaries
LIMIT 20 , 10;

SELECT es.emp_no,  ee.first_name, ee.last_name, es.salary,
	CASE 
		WHEN gender = 'M'  THEN 'Male'
		WHEN gender = 'f' THEN 'Female'
        ELSE 'Unknown'
		END AS 'Full gender',
	IF(es.salary < (SELECT MAX(salary)  / 2 FROM  employees.salaries) , 'Less than middle', 'More than middle')
FROM employees.salaries AS es
INNER JOIN employees.employees AS ee USING(emp_no);
# Вивезти кількість співробітників за групою років роботи(групи створити самим)  в компанії і посадою



