
/* 		Type of operation:  unary, binary, ternar

		Unary: -/+ 
        
        Binary: + - / *, **
        
*/


USE fk_demo;
SELECT
employee_name,
department,
hours,
FIRST_VALUE(employee_name) OVER (
PARTITION BY department
ORDER BY hours
) least_over_time
FROM
overtime;

SELECT * FROM employees.employees;

/*
	select  
    название_функции(Столбец для вычисление) 
	over(ключевое слово для начала windows function)
    ( внутри over можна указать три параметра: 
					partition by - столбец для группировки 
                    order by - столбец для сортировки 
                    ROWS, RANGE - выражение для ограничение строк в пределах группы
                    
	ROWS 
    
    RANGE(числовое или дата) 
*/


/*
UNBOUNDED PRECEDING emp_no = 1001
2.PRECEDING emp_no = 10198
CURRENT_ROW emp_no = 10200
2. FOLLOWING 
UNBOUNDED FOLLOWING emp_no = 499999
*/
SELECT emp_no, salary,
		SUM(salary) OVER (
			PARTITION BY emp_no 	
            ROWS unbounded preceding
        ) 'Sum'
FROM employees.salaries;

SELECT employee_name, hours,
LAST_VALUE(employee_name) OVER ( 
			ORDER BY hours
			RANGE BETWEEN
											UNBOUNDED PRECEDING AND
											UNBOUNDED FOLLOWING
) highest_overtime_employee
FROM overtime;


SELECT employee_name, department, hours,
	LAST_VALUE(employee_name) OVER (
							PARTITION BY department
							ORDER BY hours
							RANGE BETWEEN
							UNBOUNDED PRECEDING AND
							UNBOUNDED FOLLOWING
) most_overtime_employee
FROM overtime;

show tables;


# Lead - Lag

SELECT emp_no, from_date,
				LEAD(from_date,1) OVER (
				PARTITION BY emp_no
				ORDER BY from_date ) nextSalaryDate
FROM salaries;

USE employees;

SELECT * FROM salaries 
WHERE emp_no = 10002;

SELECT emp_no, from_date,
			LEAD(from_date,1) 	OVER ( 	# lead повертае наступне значення
									PARTITION BY emp_no
									ORDER BY from_date ) AS nextSalaryDate,
			LAG(from_date, 1) OVER ( 		# lag повертае попереднее значення
									PARTITION BY emp_no
									ORDER BY from_date )  AS previosSalaryDate
FROM salaries
WHERE emp_no < 10050 AND emp_no <> 10001;



# Slide 26 
CREATE TABLE depts_salaries SELECT dept_name,
    YEAR(salaries.from_date) AS salaryYear,
    COUNT(emp_no)  AS emp_salaries 
    FROM departments
        INNER JOIN dept_emp USING (dept_no)
        INNER JOIN salaries USING (emp_no)
GROUP BY dept_name , YEAR(salaries.from_date);

SELECT * FROM depts_salaries;

WITH t AS (
		SELECT dept_name, SUM(emp_salaries) emp_salaries_sum
		FROM depts_salaries
		GROUP BY dept_name
)

SELECT dept_name, emp_salaries_sum,
					ROUND(
					PERCENT_RANK() OVER (
					ORDER BY emp_salaries_sum
					) ,2)  AS percentile_rank
FROM t;

SELECT 1 ;
/* 			
		(rank - 1) / (total_rows - 1) - formula to calculate PERCENT_RANK(діапозон від 0 до 1 )
		(1 - 1) / (9 - 1) = 0 / 8  = 0
        (2 - 1) / (9 - 1) = 1 / 8 = 0.125
        (3 - 1) / (9 - 1) = 2 / 8 = 0.25
        (4 - 1) / (9 - 1) = 3 / 8 = 0.375 etc.
*/


/* 
		Rand  - generate diaposon of 0 to 1 (math [ ))
        seed - repr you value
        RAND( [seed]) -> RAND(5), 5 is seed

*/
SELECT rand(); 


SELECT rand(), rand(), rand(); 

SELECT RAND(10);

SELECT RAND(10), RAND(10);

SELECT FLOOR(RAND()*(100 - 1)) * 1000;

SELECT RAND()*(10 - 5) + 5; # диапозон вид 5 до 10

SELECT FLOOR(RAND()*(10 - 5 + 1)+5) ;

SELECT FLOOR(RAND()*(10-5+1) + 5) * 1000;

SELECT FLOOR(RAND() * 1000);

# SELECT RAND()*(b - a ) + a; a - звідки, b до куди

SELECT FLOOR(RAND()*(10090 - 10001)+10001);

SELECT *
FROM employees.employees
WHERE emp_no IN ( FLOOR(RAND()*(10090-10001)+10001))
LIMIT 2;

SELECT *
FROM employees
ORDER BY rand()
LIMIT 5;



SELECT *
FROM employees
WHERE emp_no IN ( FLOOR(RAND()*(100-5)+4))
;

# Rand - Вивести 5 рандомних співробітників 
SELECT * 
FROM employees 
WHERE emp_no IN (
									FLOOR(RAND()*(10090-10001) + 10001)
                                    );

/*
			SUBSTRING, SUBSTR
            (string, start_position, number_of_char) -> ('Hello World!', 1, 5) -> Hello
*/



SELECT substring('Function substring', 9);
# return substring

SELECT SUBSTR('Function substring' FROM 9);
# return substring

SELECT length(substring('Function substring', 1, 9)),substring('Function substring', 1, 9)
UNION ALL 
SELECT length(substring('Function substring', 1, 10)), substring('Function substring', 1, 10);
# return Function 

SELECT substring('Function substring'  FROM 1 FOR 4);
# return Func

SELECT substring('Function substring', 9);
# return substring

SELECT substring('Function substring', -3,  3);
/* Func -> 
			index 1: f, 
            index 2: u,
            index 3: n,
            index 4: c
	Func -> 
			index -1 : c ,
            index -2 : n,
            index -3 : u
#
# return ing

*/
SELECT substring('Function substring' FROM  -3 FOR 3);
# return ing

SELECT substring('Hello World!', -6 );

                
# substring - отримати 3 символа(last) з фрази 'I love sql'
SELECT substring('I love sql', -3);

SELECT substring('I love sql' FROM -3 FOR 3);

# Вивести значення другого слова з фрази 'Function substring from'
SELECT length('Function ') , Length('substring');

SELECT substring('Function substring from' FROM 9 FOR 10 );

SELECT SUBSTR('Function substring from' FROM 
length('Function ') FOR length('substring') + 1);


SELECT dept_no, SUBSTR(dept_name, 1, 1),  dept_name
 FROM departments;
 
 select * from employees;
 

 SELECT emp_no,
				CONCAT(
								SUBSTR(first_name, 1 , 1), '.' ,SUBSTR(last_name, 1 , 1)) AS Initials 
				FROM employees;



 SELECT ee.emp_no, ee.first_name, ee.last_name, init.Initials
FROM 
 employees as ee
 LEFT JOIN (SELECT emp_no,
				CONCAT(
								SUBSTR(first_name, 1 , 1), '.' ,SUBSTR(last_name, 1 , 1)) AS Initials 
				FROM employees) as init 
                USING(emp_no);