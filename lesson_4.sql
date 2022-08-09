# Lesson Type of Join 
SHOW DATABASES;
USE employees;

SHOW TABLES;


SELECT * FROM employees.employees, employees.dept_emp;

SELECT * FROM employees.dept_emp;

SELECT * FROM titles;


SELECT ee.emp_no, ee.first_name AS 'First name',  ee.last_name, ede.dept_no, ede.from_date
FROM employees.employees AS ee
INNER JOIN employees.dept_emp AS ede ON(ee.emp_no  = ede.emp_no);


SELECT * 
FROM employees.employees AS ee
INNER JOIN employees.dept_emp AS ede ON(ee.emp_no  = ede.emp_no);


SELECT ee.emp_no,  ee.first_name, ee.last_name, es.salary
FROM employees.employees AS ee
INNER JOIN employees.salaries AS es ON (ee.emp_no = es.emp_no)
WHERE ee.emp_no = 10051;



SELECT ee.emp_no, ee.first_name, ee.last_name, et.title, es.salary
FROM employees.employees AS  ee
INNER JOIN employees.titles  AS et ON (ee.emp_no = et.emp_no)
INNER JOIN employees.salaries AS es ON (et.emp_no = es.emp_no);


# Or you can use USING
SELECT ee.emp_no, ee.first_name, ee.last_name, et.title, es.salary
FROM employees.employees AS  ee
INNER JOIN employees.titles  AS et USING(emp_no)
INNER JOIN employees.salaries AS es USING(emp_no);
# USING -> ON 

# SET sql_safe_update = 0;

select * from employees.employees;

/*
	Slide 17 
	Task 1: Extract a list containing information about all managers’ employee number,first and last name,  
	department  number,  and hire date.
 */
 SELECT ee.emp_no, ee.first_name, ee.last_name, ed.dept_no,   ee.hire_date
 FROM employees.employees as ee
 INNER JOIN employees.dept_emp as ed USING(emp_no);
 
  SELECT ee.emp_no, ee.first_name, ee.last_name, ed.dept_no,   ee.hire_date
 FROM employees.employees as ee
 INNER JOIN employees.dept_emp as ed ON(ee.emp_no = ed.emp_no);
 
 
 SELECT * 
FROM employees.employees AS ee
LEFT JOIN employees.salaries as es ON(ee.emp_no = es.emp_no AND NOW() BETWEEN es.from_date AND es.to_date);


SELECT ee.emp_no, ee.first_name, ee.last_name, ee.gender, es.salary
FROM employees.employees AS ee
LEFT JOIN employees.salaries as es ON(ee.emp_no = es.emp_no )
WHERE es.emp_no IS NOT NULL AND  NOW() BETWEEN es.from_date AND es.to_date;


SELECT *
FROM employees.employees AS ee
INNER JOIN employees.salaries as es ON(ee.emp_no = es.emp_no AND NOW() BETWEEN es.from_date AND es.to_date);


SELECT *
FROM employees.employees AS ee
INNER JOIN employees.salaries as es ON(ee.emp_no = es.emp_no)
WHERE NOW() BETWEEN es.from_date AND es.to_date;





SELECT emp_no, first_name, last_name, dept_no, from_date
FROM employees.employees AS ee
LEFT JOIN employees.dept_manager as ed ON(ee.emp_no = ed.emp_no )
WHERE last_name = 'Markovitch'
Order by dept_no DESC;


SELECT ee.emp_no, ee.first_name, ee.last_name, dm.dept_no
FROM 
		employees.employees AS ee 
LEFT JOIN 
		dept_manager AS dm ON (ee.emp_no = dm.emp_no)
WHERE 
		ee.last_name = 'Markovitch'
ORDER BY 
	dept_no DESC, 
    emp_no;




 /* 
	Slide 21
    Task 1: Join the 'employees' and the 'dept_manager'  tables to return a subset of all theemployees whose last name is Markovitch. 
    See if the output contains  amanager  with that name.
    */
SELECT ee.emp_no, ee.first_name, ee.last_name,  dm.dept_no 
FROM employees.employees AS ee
LEFT JOIN   employees.dept_manager AS  dm ON(ee.emp_no = dm.emp_no)
WHERE ee.last_name = 'Markovitch' # AND dm.dept_no IS NOT NULL
ORDER BY dm.dept_no DESC, emp_no ASC;
# add where cond WHERE es.emp_no  IS NOT NULL; 


# Old style
SELECT ee.emp_no, ee.first_name, ee.last_name, edm.dept_no, ee.hire_date
FROM employees.employees AS ee, employees.dept_manager AS edm
WHERE ee.emp_no =  edm.emp_no;


SELECT ee.emp_no, ee.first_name, ee.last_name, ed.dept_no,   ee.hire_date
FROM employees.employees AS ee
JOIN employees.dept_emp AS ed USING(emp_no);



/* 
	Slide 27 
	Extract a list containing information about all managers’ employee number,first and last name,  department  number,  and hire date. 
	Use the old type of joinsyntax  to obtain the result.
*/
SELECT * FROM dept_manager;

SELECT  ee.emp_no, first_name, ee.last_name, edm.dept_no, ee.hire_date
FROM employees.employees AS ee
INNER JOIN employees.dept_manager_dup AS edm
ON ee.emp_no = edm.emp_no;


SELECT ee.emp_no, ee.first_name, ee.last_name, edm.dept_no , ee.hire_date
FROM employees.employees AS ee, employees.dept_manager AS edm
WHERE ee.emp_no = edm.emp_no;

/* 
	Slide 30 
    Select the first and last name,  the hire date, and the job title of all employees
    whose first name is “Margareta” and have the last name “Markovitch”.
*/
SELECT  * FROM titles;

        

# Slide 30
SELECT 
		ee.emp_no, ee.first_name, ee.last_name, ee.hire_date, et.title
FROM 
		employees.employees AS ee 
INNER JOIN 
		employees.titles AS et 
        USING(emp_no)
WHERE 
		ee.first_name = 'Margareta' AND 
        ee.last_name = 'Markovitch';
