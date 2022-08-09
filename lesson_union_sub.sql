# Lesson Union 

SELECT 1, 2 
UNION 
SELECT 2, 2 ;

select first_name, 'first_name' from employees.employees 
UNION 
select last_name,  'last name' from employees.employees;

SELECT 1 UNION ALL SELECT 1;

SELECT 1 AS num 
UNION ALL 
SELECT 1 AS num
UNION ALL
SELECT 2 AS num 
UNION ALL
 SELECT 2 AS num
ORDER BY num DESC;

SELECT emp_no
FROM employees
WHERE emp_no  = 10050
UNION ALL 
SELECT emp_no
FROM employees
WHERE emp_no  = 10051
UNION ALL
SELECT emp_no
FROM employees
WHERE emp_no  = 10052;

SELECT * FROM employees.employees;


SELECT 
    emp_no, hire_date, 'hire_date' AS 'Column'
FROM
    employees
WHERE
    emp_no = 10050 
UNION ALL SELECT 
    emp_no, first_name, 'first_name'
FROM
    employees
WHERE
    emp_no = 10051 
UNION ALL SELECT 
    emp_no, last_name, 'last_name'
FROM
    employees
WHERE
    emp_no = 10052;
    
    


# Union  - Union all
SELECT emp_no, hire_date AS value,  'hire_date' AS type
FROM employees
WHERE emp_no  = 10050
UNION ALL 
SELECT emp_no, first_name AS value,  'first_name' AS type
FROM employees
WHERE emp_no  = 10051
UNION ALL
SELECT emp_no,  last_name AS value,  'last_name' AS type
FROM employees
WHERE emp_no  = 10052;


SELECT * FROM t1;

SELECT * FROM t2;

# Slide 5
SELECT
			e.emp_no,   
            e.first_name,   
            e.last_name, 
			NULL  AS dept_no,
			NULL  AS from_date   
 FROM 
			employees AS   e  WHERE last_name  = 'Denis' 
 UNION  
 SELECT   
			NULL  AS emp_no, 
			NULL  AS first_name, 
			NULL  AS last_name, 
			dm.dept_no,   
			dm.from_date
 FROM 
			dept_manager AS dm;

 
# Slide 7
SELECT
		CONCAT(first_Name, ' ' ,last_Name) fullname 
        FROM employees.employees 
        WHERE first_name LIKE 'a%'  
UNION 
        SELECT CONCAT(first_Name,' ',last_Name)
        FROM employees.employees 
        WHERE first_name LIKE 'b%';
        

        
# Slide 8 - Subqueries


# Task 1: Відобразити всіх співробітників в кого ЗП більше ніж середня ЗП співробітника 100050
SELECT AVG(salary)
FROM employees.salaries
WHERE emp_no = 10001; #58615.3077

SELECT * FROM  employees.salaries
WHERE salary > round(58615.3077, 2);

# OR
SELECT * FROM employees.salaries
WHERE salary > 
								round((  SELECT AVG(salary) 
									FROM employees.salaries 
									WHERE emp_no = 10001), 2);
                                    



SELECT * FROM employees.salaries
WHERE salary > 
								(	SELECT AVG(salary) 
									FROM employees.salaries 
									WHERE emp_no = 
																	(SELECT  MAX(emp_no)
                                                                    FROM employees.employees)
                                    )
ORDER BY salary;
                            
                            
  # Step 1 - find more deep sub
  SELECT  MAX(emp_no)  FROM employees.employees;
  
  # Step 2 - find less deep sub(up all time)
SELECT AVG(salary) 
FROM employees.salaries 
WHERE emp_no = 499999;
     
# Step 3 - find last sub
SELECT * FROM employees.salaries
WHERE salary > 70625.0000
ORDER BY salary;


# Відобразити всі періоди по всіх співробітників в кого ЗП меньше ніж ЗП за період 
SELECT * 
FROM employees.salaries as sal1
WHERE salary  > 
						( SELECT AVG(salary) 
                        FROM employees.salaries as sal2
                        WHERE sal1.emp_no = sal2.emp_no);

select avg(salary) from employees.salaries; #63801

# CHECK  for emp_no 10002
SELECT AVG(salary) FROM employees.salaries WHERE emp_no = 10003; # 68854

SELECT * FROM employees.salaries WHERE emp_no = 10003 ORDER BY salary;

/*	Де можемо використовувати sub
		SELECT - (1 - колонка или 1 -  значення)
		WHERE - (1 -  колона або  n -  значення)
		FROM/JOIN - (n - колонок, m - значеннь) + потрібно вказати Alias 
*/

# Відобразити всю інформацію про всіх співробітників за всі періоди , а також середню зп компанії
SELECT es.emp_no, es.salary , (SELECT AVG(salary) FROM employees.salaries) AS  'AVG'
FROM employees.salaries as es;


SELECT * 
FROM ( SELECT * FROM employees.employees
				WHERE gender = 'M' ) as res
	WHERE hire_date > '1991-01-01';


# OR - без підзапиту
SELECT * FROM employees.employees
WHERE gender = 'f' AND hire_date > '1991-01-01';


# Повторимо IN - NOT IN
SELECT emp_no FROM employees.employees WHERE emp_no IN (10002, 10003, 10004, 10005);

SELECT emp_no FROM employees.employees WHERE emp_no NOT IN (10001, 10002, 10005);


# Відобразити всіх співробітників котрі не працють в комнаії на данний момент
SELECT * FROM employees.dept_emp;

SELECT * FROM employees.dept_emp WHERE curdate()  BETWEEN from_date AND to_date;

SELECT * FROM employees.dept_emp WHERE curdate()  NOT BETWEEN from_date AND to_date;

SELECT * FROM employees.employees
WHERE emp_no NOT IN ( SELECT emp_no FROM employees.dept_emp WHERE curdate()   BETWEEN from_date AND to_date);



# Slide 12 
# Task 1
SELECT 
    first_name, last_name, emp_no
FROM
    employees
WHERE
    emp_no NOT IN (SELECT DISTINCT
            emp_no
        FROM
            dept_manager);
            

# Task 2
SELECT 
    COUNT(emp_no)
FROM
    employees
WHERE
    emp_no NOT IN (SELECT DISTINCT
            emp_no
        FROM
            dept_manager);


/*  	
		Union Task 
        Task 0: Унікальни назви посад, двома  способами
		Task 1: Унікальні назви посад і назви департаментів одним списком
        Task 2: Відобразити всі імена для людей в кого прізвище починається на 'a' і всі іменна для людей починається  'a'
*/
# Task 0: Унікальні назви посад, двома способами 
SELECT * FROM employees.departments;

# First var
SELECT DISTINCT(title) FROM employees.titles;

# Second var
SELECT title FROM employees.titles
UNION 
SELECT title FROM employees.titles;


# Task 1: Унікальні назви посад і назви департаментів одним списком
SELECT title FROM employees.titles 
UNION 
SELECT dept_name FROM employees.departments;



# Task 2: Відобразити ВСІ імена для людей в кого прізвище починається на 'a' і ВСІ іменна для людей починається  'a'
SELECT first_name AS 'name', 'first_name'
FROM employees.employees WHERE last_name LIKE 'a%' 
UNION ALL
SELECT last_name, 'last_name'
FROM employees.employees WHERE first_name LIKE 'a%' ;


# Відобразити всіх співробітників зі всіма періодами, коли вони отримували ЗП, яка являється мінімальною в Рамках усієї компанії за всі періоди

SELECT MIN(salary) FROM employees.salaries;

SELECT * FROM employees.salaries WHERE  salary = 38735;

SELECT * 
FROM employees.salaries 
WHERE salary = ( SELECT MIN(salary) FROM employees.salaries);

# Slide 13
SELECT 
    MIN(t1.salary), MAX(t1.salary), AVG(t1.salary)
FROM
    (SELECT 
        YEAR(from_date), SUM(salary) AS salary
    FROM
        salaries
    GROUP BY YEAR(from_date)) AS t1;



/* Add task 

# Task 1: Відобразити всіх співробітників із dept, у котрих найвище зп - Доп. практика
SHOW TABLES;

SELECT * FROM employees.dept_emp
ORDER BY dept_no;


SELECT * from salaries;

SELECT * FROM 
employees.salaries 
WHERE salary = (SELECT MAX(salary) FROM employees.salaries) ;


/*

