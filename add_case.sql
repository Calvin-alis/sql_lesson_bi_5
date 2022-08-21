# Add case
/*
		Case 
        WHEN первое условие THEN второе возвращаемое значение
        WHEN первое условие THEN второе возвращаемое значение
		ELSE - вернет условие если не будет выполнено ни одно из них 
        END - конец case

*/
USE employees;


SHOW TABLES;

SELECT * FROM employees.employees;
WITH full_nameCTE(full_name)
AS (
		SELECT CONCAT(first_name, ' ', last_name) FROM employees.employees
)

SELECT * from full_nameCTE;

select * from employees.employees;

# first form
SELECT emp_no,  first_name, last_name,
	CASE 
		WHEN gender = 'M'  THEN 0
		WHEN gender = 'f' THEN  1
		END AS 'Full gender'
FROM employees.employees;

# second form 
SELECT emp_no,  first_name, last_name, gender, 
	CASE gender WHEN gender = 'm'  THEN 0 ELSE 1
    END AS 'Full gender'
    FROM employees.employees;
    
	#,CASE first_name WHEN first_name <> 'Mary' THEN 'Mary'  ELSE 'No mary'
   # END AS 'Like Mary'



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
        END AS 'Level_of_salary'
FROM employees.salaries AS es
INNER JOIN employees.employees AS ee USING(emp_no);


/*
			IF(condition, value_if_true, value_if_false) 
            condition return True or False
*/
SELECT IF(15 > 10, '5 more than 10', '5 less than 10') as 'equal';

SELECT emp_no, salary, IF( salary >=  (SELECT AVG(salary) FROM employees.salaries), 'More or equal avg',  'Less that avg ') as 'AVG'
FROM employees.salaries
LIMIT 20 , 10;

SELECT es.emp_no,  ee.first_name, ee.last_name, es.salary,
	CASE 
		WHEN gender = 'M'  THEN 'Male'
		WHEN gender = 'f' THEN 'Female'
        ELSE 'Unknown'
		END AS 'Full gender',
	IF(es.salary < (SELECT SUM(salary)  / 2 FROM  employees.salaries) , 'Less than middle', 'More than middle') as 'Compere'
FROM employees.salaries AS es
INNER JOIN employees.employees AS ee USING(emp_no);


# Вивезти кількість співробітників за групою років роботи(групи створити самим)  в компанії і посадою
