# Practise 
/*
	Practise every day: 
    - https://leetcode.com
	- https://www.hackerrank.com
    - https://exercism.org/dashboard
    
    - https://www.w3schools.com/mysql/default.asp
*/

/*
	1.  Вивести всіх співробітників в кого ЗП більше 99999
    
    2. Вивезти всіх співробітників в кого імя Parto
    
    3. Вивести всіх співпробітників, хто народився в періоді з
		01-01-1952 по 12-31-1955 і з 01-01-1960 по 12-31-1965
        
	4. Вивести всіх співробітників з сумарним заробітком починаючи з 1 млн
    
    5. Вивести загальну кількість чоловіків і жінок
    
    6. Вивезти роки прийняття на роботу, коли було прийнято меньше 10000
    
    7. Починаючи з 01-01-2000 показати середній заробіток кожного співробітника
    
    8. Відобразити статистуку по співробітникам, відности дати народження 
    з розбивкою по рокам і місяцям
    
    9. Вивести всіх співробітників, які мають максимальну ЗП
    більше 99999 і порядковий номер більше 123456
    
    10. Вивести всіх чоловіків, які народились в червні 1972
    
    11. Відобразити поточні посади для всіх співробітників в кого назва 
    посади містить другу букву е
    
	12. Відобразити в зворотньому порядку лише ті відділи, де на момент 10-01-1998 працювало меньше 500 працівників;
    
	13. Показати кількісну статистику працівників по відділам на сьогоднішню дату;
    
	14. Скільки жінок було прийнято в 1993 році, які народились після 02-01-1940;
    
	15. Показати всі пари однофамільців(імя + прізвище), 
		 в яких зустрічаються чоловік і жінка з одноковим іменем і прізвищем; 

	16. Показати, дату найму на роботу, яка зустрічається найчастіше;

	17. Вивести Імя і ЗП співробітників;
    
	18. Вивести Прізвище, посаду на поточний момент і назву відділу  співробітників  на поточний момент

	19. Вивести Імя і актуальну ЗП співробітників, для тих в кого відсутня, відобразити 0
	
    20. Вивести Імя і актуальну ЗП співробітників жіночої статі, для тих в кого відсутня, відобразити 0

	21. Вивести Імя, emp_no і максимальну ЗП співробітників жіночої статі, в кого сумарна ЗП більше 1млн;
	
    22. Вивести Прізвище і період з/до за який вони отримували таку ЗП всіх співробітників в кого ЗП більше ніж середня ЗП по компанії;

	23. Вивести Прізвище і мінімальну ЗП кожного співробітника і максимальну ЗП по компанії(реалізувати двома способами);

	24. Вивести Імя співробітників, дату народження і періоди(з і до) 
		для тих в кого ЗП дорівняє максимальній заробітній платі за самий перший звітний період(from_date)

	25. Вивести порядковий номер співробітників, період отримання ЗП(з і до), 
			хто працював на посаді, яка містить текст 'Engineer', 
			мав ЗП більше ніж середню серед співробітників, 
			які працювали на посаді, яка містить текст 'Staff';
            
	26. Вивести назви посад і відділів з дублікатами;
    
	27. Вивести, лише унікальні значення назви посад і відділів з характеристикою, з якої таблиці взята інформація;
    
	28. Вивести всіх чолоків, хто працює в відділі 'Finance' в поточний момент, колонку з текстом 'Men' і нище списком
всіх жінок, хто працював в відділі 'Production' на момент 1999-01-01 і колонку з текстом 'Women';
        
*/


/*

DBMS

 1 What is the Database Management System (DBMS)?
 2 Which of components are usually DBMS consists?
 3 What is the Database Access Language?
 4 What is the Query Processor?
 5 What are DBMS functions?
 6 What is the Relational Database Management System (RDBMS)?
 7 What is Structured Query Language (SQL)?
 8 What is NoSQL?
 9 What is In-Memory Database Management System (IMDBMS)?
 10 What is Columnar Database Management System (CDBMS)?
 11 What is Cloud (Based) Database Management Systemis (C(B)DBMS)?
 12 What is Redundant Array of Independent Disks (RAID)?
 13 How does a RDBMS work?
 14 What is Big O notation?
 15 How to sort?
 16 SMP vs MPP
 17 What is RAID?

BASIC SQL    

 1 What Can SQL Do?
 2 What is Data Manipulation Language?
 3 What are SQL Components?
 4 What is the Logical Operators Precedence?
 5 What are SQL Aliases?
 6 What are SQL Comments?
 7 What is AdventureWorks Sample Database?
 8 What are SQL JOINS?
 9 What are SET Operations?
 10 What are Aggregate Functions?
 11 What is GROUP BY Statement?
 12 What is CASE Statement?
 13 What types of Subqueries exist?
 14 What is CTE (Common Table Expression)?
 15 What are SQL Data Types?
 16 What types of relationships exist?
 17 What are SQL constraints?
 18 What are Window Functions?
 19 What are DATE and TIME FUNCTIONS?
 20 What are STRING FUNCTIONS?

ADVANCED SQL  

 1 What is SQL Views?
 2 What is SQL Triggers?
 3 What are SQL grouping functions and ranking functions?
 4 What are SQL XML data-types?
 5 What are SQL User-Defined Functions?
 6 What are SQL Transactions and Error Handling?
 7 What are SQL Dynamic Queries?
 8 What is SQL Filestream and Free-Text Search?
 9 What are SQL Stored Procedures?
 10 What are SQL Computed Columns?
 11 What are SQL Partitions?
 12 What are SQL Geography and Geometry types?

QUERYING DATA TRANSACT-SQL  

 1 What is SQL Alias Syntax?
 2 What are SQL Synonyms?
 3 What are JOINs and Advanced JOINs?
 4 What are SQL Sub Queries?
 5 What are SQL Table Expression?
 6 What are TOP and OFFSET-FETCH filters?
 7 What are Apply Statements?
 8 What are PIVOT and UNPIVOT Statements?
 9 What are CASE Statements?
 10 What are SQL Execution Plans types?
 11 What are Live Execution Statistics?
 12 What are Types of physical joins?
 13 What are NESTED LOOPS?
 14 What is HASH Match?
 15 What is B-tree index structure?
 16 What are Clustered Tables vs Heap Tables?
 17 What is Index Fragmentation?
 18 What is Rebuild vs. Reorganize Strategy?

BUSINESS INTELLIGENCE, DATA WAREHOUSE

 1 What is Business Intelligence?
 2 What are the functions of Data Engineer, Data Quality Engineer, Data Scientist, Data Analyst?
 3 What is Data Warehouse?
 4 What is Data Lake?
 5 What are Normalization / Denormalization / Normal Forms?
 6 What are Fact/Dimension tables?
 7 What is Bill Inmon`s Top-Down approach to build Data Warehouse?
 8 What is Ralph Kimball`s Bottom-Up approach to build Data Warehouse?
 9 What is Dan Linstedt`s Data Vault?
*/

# 1
SELECT *
FROM employees.salaries
WHERE salary > 99999;


# 2
SELECT * 
FROM employees.employees
WHERE first_name = 'Parto';


# 3
SELECT *
FROM employees.employees
WHERE (birth_date  BETWEEN '1952-01-01' AND '1955-12-31')
OR 
(birth_date BETWEEN '1960-01-01' AND '1965-12-31');


# 4
SELECT emp_no, SUM(salary) AS 'sum of all year'
FROM employees.salaries
GROUP BY emp_no
HAVING SUM(salary) > 1000000;


# 5
SELECT gender, COUNT(gender)
FROM employees.employees
GROUP BY gender;


# 5.1
SELECT DISTINCT
(SELECT COUNT(gender)
FROM employees.employees
WHERE gender = 'F') AS F, 
(SELECT COUNT(gender)
FROM employees.employees
WHERE gender = 'M') AS M
FROM employees.employees;


# 6
SELECT YEAR(hire_date), COUNT(emp_no)
FROM employees.employees
GROUP BY YEAR(hire_date)
HAVING COUNT(emp_no) < 10000;


# 7
SELECT emp_no, AVG(salary)
FROM employees.salaries
WHERE from_date >= '2000-01-01'
GROUP BY emp_no;


# 8
SELECT YEAR(birth_date) 'Рік народження', 
				MONTH(birth_date) 'Місяць народження',
				COUNT(emp_no) 'Кількість народженних'
FROM employees.employees
GROUP BY YEAR(birth_date), MONTH(birth_date)
ORDER BY YEAR(birth_date), MONTH(birth_date);

# 9
SELECT *
FROM employees
WHERE birth_date 
BETWEEN '1972-06-01' AND '1972-06-30'
AND gender = 'M';


# 10
SELECT emp_no, MAX(salary)
FROM employees.salaries
WHERE emp_no > 123456
GROUP BY emp_no
HAVING MAX(salary) > 99999;


# 11
SELECT *
FROM employees.titles
WHERE title LIKE '_e%' AND NOW() 
BETWEEN from_date AND to_date;


# 12
SELECT dept_no, COUNT(emp_no)
FROM employees.dept_emp
WHERE '1998-01-10' BETWEEN from_date AND to_date
GROUP BY dept_no
HAVING COUNT(emp_no) < 15000
ORDER BY COUNT(emp_no) DESC;

# 13
SELECT dept_no, COUNT(emp_no) AS 'Кількість emp_no'
FROM employees.dept_emp
WHERE CURDATE() BETWEEN from_date AND to_date
GROUP BY dept_no;


# 14
SELECT COUNT(emp_no)
FROM employees.employees
WHERE  birth_date > 1940-02-01 AND gender = 'F' 
AND YEAR(hire_date) = 1993;


# 15
SELECT first_name, last_name
FROM employees.employees
GROUP BY first_name, last_name
HAVING COUNT(DISTINCT gender) > 1;


# 16
SELECT hire_date,  COUNT(emp_no) 
FROM employees.employees
GROUP BY hire_date
HAVING COUNT(emp_no) = (SELECT COUNT(emp_no)
      FROM employees.employees
                        GROUP BY hire_date
                        ORDER BY COUNT(emp_no) DESC
                        LIMIT 1);

# 17
SELECT first_name, s.salary
FROM employees AS e
INNER join salaries AS s ON (e.emp_no = s.emp_no);


# 18 
SELECT ee.last_name, et.title, ed.dept_name
FROM employees.employees AS ee
INNER JOIN employees.titles AS et ON (ee.emp_no = et.emp_no)
INNER JOIN employees.dept_emp AS ede ON (ee.emp_no = ede.emp_no)
INNER JOIN employees.departments AS ed ON (ede.dept_no = ed.dept_no)
WHERE CURDATE() BETWEEN et.from_date AND et.to_date AND CURDATE() 
BETWEEN ede.from_date AND ede.to_date;


# 19 
SELECT *
FROM employees.employees AS ee
LEFT JOIN employees.salaries AS es
 ON (ee.emp_no = es.emp_no AND CURDATE()
 BETWEEN es.from_date AND es.to_date)
WHERE ee.emp_no = 10021;

# 20
SELECT e.first_name, IFNULL(s.salary, 0)
FROM employees.employees AS e
LEFT JOIN employees.salaries AS s ON(e.emp_no = s.emp_no AND NOW() BETWEEN s.from_date AND s.to_date)
WHERE gender = 'F';


# 21
SELECT emp_no, first_name, MAX(salary)
FROM employees.employees
INNER JOIN employees.salaries USING(emp_no) WHERE gender = 'F' 
GROUP BY emp_no, first_name
HAVING SUM(salary) > 1000000;

# 22
SELECT last_name, from_date, to_date
FROM employees.employees
INNER JOIN employees.salaries USING(emp_no)
WHERE salary > 
(SELECT AVG(salary)FROM employees.salaries);


# 23
SELECT last_name, MIN(salary), 
(SELECT MAX(salary)FROM employees.salaries)
FROM employees.employees
INNER JOIN employees.salaries USING(emp_no)
GROUP BY emp_no;

