# Union Part
SHOW TABLES;

SELECT * FROM ( SELECT 4 UNION SELECT 1 ) AS one
UNION 
SELECT *  from ( SELECT 1 UNION SELECT 2 ) AS two;



SELECT *
FROM employees
WHERE emp_no < 10010
UNION 
SELECT *
FROM employees
WHERE emp_no BETWEEN 10050 AND 10060; 


SELECT emp_no, first_name , 'Full name'
FROM employees
WHERE emp_no < 10010
UNION 
SELECT emp_no, birth_date , 'birth_date'
FROM employees
WHERE emp_no BETWEEN 10050 AND 10060; 

USE employees;

SELECT emp_no, first_name , 'Full name' as flag
FROM employees
WHERE emp_no < 10010
UNION 
SELECT emp_no, birth_date , 'birth_date' 
FROM employees
WHERE emp_no BETWEEN 10050 AND 10060
UNION 
SELECT emp_no, NOW() , 'Now time' 
FROM employees
WHERE emp_no BETWEEN 10060 AND 10070
UNION 
SELECT emp_no,  null , 'null'
FROM employees
WHERE emp_no BETWEEN 10060 AND 10070;




/*
	UNION TASK
    Task 1: Вивезти id, назву і тип данних одним списком(назва посади, департамент), де не має id, відображати 'N/A'
    Task 2: Вивезти одним списком всіх кто отримує зп більше ніж 150000 і id в  range 42620 до 42360 з дуплікатами
*/

# Task 1: Вивезти id(dept_no), назву і тип данних одним списком(назва посади, департамент), де не має id,   відображати 'N/A'
SELECT * FROM titles;
SELECT * FROM departments;


SELECT 'N/A', title, 'titles'
FROM employees.titles 
UNION
SELECT dept_no, dept_name, 'departments'
FROM employees.departments;

# Task 2: Вивезти одним списком всіх кто отримує зп більше ніж 150000 і id в range(emp_no) 43620 до 43630 з дуплікатами
SELECT * FROM employees;
SELECT * FROM salaries;


SELECT  ee.emp_no, ee.first_name, 'first name' AS flag
FROM employees.employees AS ee
WHERE ee.emp_no BETWEEN 43620 AND 43630
UNION ALL
SELECT es.emp_no, es.salary, 'salary'
FROM employees.salaries AS es
WHERE es.salary > 150000;



# Підзапити 
# Task 1 - Вивести порядковий номер, Імя і Призвіще котрі отримуют зп 150000(Унікальних співробітників)
SELECT emp_no FROM salaries WHERE salary >= 150000
UNION 
SELECT emp_no FROM salaries WHERE salary >= 150000;

SELECT DISTINCT(emp_no) FROM salaries WHERE salary >= 150000;

SELECT emp_no FROM salaries
WHERE salary >= 150000
GROUP BY emp_no;

SELECT COUNT( DISTINCT(emp_no) ) FROM salaries WHERE salary > 150000;

/*	Де можемо використовувати sub
		SELECT - (1 - колонка или 1 -  значення)
		WHERE - (1 -  колона або  n -  значення)
		FROM/JOIN - (n - колонок, m - значеннь) + потрібно вказати Alias 
*/

SELECT ee.emp_no, ee.first_name, ee.last_name
 FROM employees AS ee
WHERE ee.emp_no IN ( SELECT emp_no FROM employees.salaries WHERE salary >= 150000);


SELECT ee.emp_no, ee.first_name, ee.last_name
 FROM employees AS ee
 INNER JOIN ( SELECT DISTINCT emp_no FROM employees.salaries 	WHERE salary >= 150000) AS es USING(emp_no);
 
 
# Task 1. Вивезти всіх співробітників які були менеджерами(where, join)
SELECT * FROM employees.dept_manager;

SELECT ee.emp_no, ee.first_name, ee.last_name FROM employees.employees AS ee 
WHERE ee.emp_no IN (SELECT emp_no FROM dept_manager);

SELECT ee.emp_no, ee.first_name, ee.last_name 
FROM employees.employees as ee
INNER JOIN ( 
						SELECT emp_no FROM employees.dept_manager) AS edm 
                        USING(emp_no);


SELECT ee.emp_no, ee.first_name, ee.last_name 
FROM ( SELECT  emp_no FROM employees.dept_manager
			UNION 
            SELECT  emp_no FROM employees.dept_manager) AS edm
INNER JOIN employees.employees AS ee ON(edm.emp_no = ee.emp_no); # or can use USING


# Task 2. Вивезти всіх співробітників в кого зп більша ніж середня по компанії
SELECT AVG(salary) FROM employees.salaries;

SELECT * FROM employees.salaries
WHERE salary > round(63801.4823, 2);



SELECT emp_no, salary FROM employees.salaries AS ee
WHERE ee.salary > ( SELECT AVG(salary) FROM employees.salaries);

# Task *.1: У кого зп середня зп більше? (два запити)
# Task *. Вивезти номер співробітників чоловіків у яких ЗП  більше ніж середня ЗП серед жінок

# Task *.1 

SELECT * FROM employees.salaries;

SELECT * FROM employees.employees;

/*
	Steps
    Step 1: вивезти жінок
	Step 2: вивезти середню
    Step 3: вивезти чоловіків
    Step 4: порівняти
*/

SELECT AVG(salary) FROM employees.salaries
WHERE emp_no IN ( SELECT emp_no FROM employees WHERE gender = 'F' );

SELECT AVG(salary) FROM employees.salaries
WHERE emp_no IN ( SELECT emp_no FROM employees WHERE gender = 'M');

SELECT DISTINCT emp_no 
FROM employees.salaries
WHERE emp_no IN (SELECT emp_no FROM employees.employees WHERE gender = 'M') 
AND 
salary > ( SELECT AVG(salary) FROM employees.salaries WHERE emp_no IN ( SELECT emp_no FROM employees WHERE gender = 'F' ));




# Exsits 
SELECT * FROM
employees as ee
WHERE NOT EXISTS( SELECT * from salaries AS es where ee.emp_no = es.emp_no and salary > 100000);

# Any 
SELECT emp_no FROM
employees as ee
WHERE emp_no = ANY( SELECT emp_no from salaries AS es where  salary > 100000 or salary = 50000);

SELECT   emp_no FROM salaries WHERE salary > 100000 or salary = 50000;

# All 
SELECT emp_no FROM
employees as ee
WHERE emp_no  >  ANY( SELECT emp_no from salaries AS es where  salary > 100000 );