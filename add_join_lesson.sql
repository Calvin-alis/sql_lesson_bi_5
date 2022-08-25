# Join Add
SELECT * FROM employees;


ALTER TABLE employees
DROP COLUMN gender_id;
/*
				Inner Join 
	id			id_sec			result_table
	1			3						3 - 3
	2			4						4 -4 
    3			5	
    4			6
    
				Left Join 
	id			id_sec 			result_table
    1				3					1 - NULL
    2				4					2 - NULL
    3				5					3 - 3
    4				6					4 - 4
    
    
				Right Join
    	id			id_sec 			result_table
    1				3					null - 5
    2				4		 			null - 6	
    3				5					3 - 3
    4				6					4 - 4
    
    
				Full Join
     	id			id_sec 			result_table
    1				3					1 - null
    2				4		 			2  - null	
    3				5					3 - 3
    4				6					4 - 4    
										null - 5
                                        null - 6
	
*/

# Inner Join
SELECT *
FROM employees.employees AS ee
INNER JOIN employees.dept_emp AS ede
USING(emp_no);

SELECT *
FROM employees.employees AS ee
INNER JOIN employees.dept_emp AS ede
ON( ee.emp_no = ede.emp_no);



SELECT *
FROM employees.employees AS ee
INNER JOIN employees.dept_emp AS ede
ON( ee.emp_no = ede.emp_no AND ee.hire_date = ede.from_date);

SELECT *
FROM employees.employees AS ee
INNER JOIN employees.dept_manager AS edm
ON( ee.emp_no = edm.emp_no);

# Left Join 
SELECT *
FROM employees.employees AS ee
LEFT JOIN employees.dept_manager AS edm
ON( ee.emp_no = edm.emp_no);

# Right Join
SELECT *
FROM employees.dept_manager AS ee
RIGHT JOIN employees.employees AS edm
USING (emp_no);

/*
		Cross - Join - декартовий добуток(по рядкам) 
        
        id 		id_sec
        1			1
        2			2
        3			3
        
        result 
        1	1
        1	2
        1	3
        2	1
		2	2
        2  3
        3	1
        3	2
        3	3
*/

SELECT *
FROM employees.dept_manager
CROSS JOIN (SELECT 1) AS cel;

SELECT *
FROM employees.dept_manager_dup;

SELECT *
FROM gender;

# 52  2

SELECT *
FROM employees.dept_manager_dup
CROSS JOIN  gender AS cel;


SELECT emp_no, AVG(salary), test.salary_avg
FROM employees.salaries 
CROSS JOIN (
		SELECT AVG(salary) AS salary_avg
        FROM employees.salaries
) AS test
GROUP BY emp_no;


SELECT emp_no, AVG(salary), ( SELECT AVG(salary) FROM employees.salaries)
FROM employees.salaries 
GROUP BY emp_no;


# Self Join - табличка join сама для себе
/*
		id 	p_id
		1		null
        2		1
        3		1
        4		2
        5		4
*/

SELECT *
FROM employees.employees AS ee
INNER JOIN employees.employees AS eee 
ON (ee.emp_no = eee.emp_no);

# IS NULL/ IS NOT NULL
SELECT *
FROM dept_manager
LEFT JOIN dept_manager_dup USING(dept_no);

SELECT *
FROM dept_manager
LEFT JOIN dept_manager_dup USING(dept_no)
WHERE dept_manager_dup.dept_no IS NULL;


SELECT *
FROM dept_manager
LEFT JOIN dept_manager_dup USING(dept_no)
WHERE dept_manager_dup.dept_no IS NOT NULL;


# Natual Join 
SELECT ee.emp_no, ee.first_name, ee.last_name, es.salary
FROM employees.employees AS ee
NATURAL JOIN employees.salaries AS  es;

/*
Join the 'employees' and the 'dept_manager'  tables to return a 
subset of all the employees whose last name is Markovitch. 
See if the output contains  a manager  with that name. 

Hint: Create an output containing information 
corresponding to the following fields:‘emp_no’, ‘first_name’,
‘last_name’, ‘dept_no’,  ‘from_date’.  
Order by 'dept_no' descending,and then by 'emp_no'.
*/
SELECT ee.emp_no , ee.first_name, ee.last_name, edm.dept_no, edm.from_date
FROM employees.employees AS ee
LEFT JOIN employees.dept_manager  AS edm USING(emp_no)
WHERE last_name = 'Markovitch';



# Old style with cross-join
SELECT ee.emp_no , ee.first_name, ee.last_name, edm.dept_no, edm.from_date
FROM employees.employees AS ee, employees.dept_manager   AS edm
WHERE last_name = 'Markovitch';


SELECT ee.emp_no , ee.first_name, ee.last_name, edm.dept_no, edm.from_date
FROM employees.employees AS ee, employees.dept_manager   AS edm
WHERE last_name = 'Markovitch'
AND ee.emp_no = edm.emp_no;



/*
		1. Відобразити всіх співробітників(імя, останню посаду, яку займали, остання назва департаменту в якому працювали), 
			які не працюють на данний момент.
		2. Показати всіх чоловіків співробітників в кого поточна ЗП меньше середній поточній ЗП по компанії, 
			якщо такиї співробітників більше ніж 1000 за рік народження
*/