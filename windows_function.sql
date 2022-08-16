# Windows function 

CREATE TABLE sales (
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14 , 2 ) NOT NULL,
    PRIMARY KEY (sales_employee , fiscal_year)
);


INSERT INTO sales(sales_employee,fiscal_year,sale)
VALUES
	('Bob',2016,100),
	('Bob',2017,150),
	('Bob',2018,200),
	('Alice',2016,150),
	('Alice',2017,100),
	('Alice',2018,200),
	('John',2016,200),
	('John',2017,150),
	('John',2018,250);

SELECT * FROM sales;


SELECT SUM(sale) AS 'Sum'
FROM sales;

SELECT sales_employee, SUM(sale)
FROM sales
GROUP BY sales_employee;

SELECT fiscal_year, SUM(sale)
FROM sales
GROUP BY fiscal_year;


SELECT
	fiscal_year, sales_employee, sale,
    SUM(sale) OVER (PARTITION BY fiscal_year) total_sales, # PARTITION BY  - аналог group by 
    SUM(sale) OVER () total_sales
FROM sales;


SELECT
	sales.fiscal_year, 
    sales.sales_employee, 
    sales.sale, 
    sel_f_y.sum_sale
FROM sales 
INNER JOIN ( 
		SELECT fiscal_year, SUM(sale) AS sum_sale 
        FROM 	sales
        GROUP BY fiscal_year) 
        AS sel_f_y ON (sales.fiscal_year = sel_f_y.fiscal_year);


# Slide 7 
SELECT ROW_NUMBER() OVER (ORDER BY emp_no), ee.*
FROM employees.employees AS ee;

SELECT ROW_NUMBER() OVER (PARTITION BY gender  ORDER BY gender, emp_no) AS 'Row number', ee.*
FROM employees.employees AS ee;

# Slide 10
CREATE TABLE scores (
    name VARCHAR(20) PRIMARY KEY,
    score INT NOT NULL
);

INSERT INTO
	scores(name, score)
	VALUES
				('Smith',81),
				('Jones',55),
				('Williams',55),
				('Taylor',62),
				('Brown',62),
				('Davies',84),
				('Evans',87),
				('Wilson',72),
				('Thomas',72),
				('Johnson',100);

SELECT name, score,
	ROW_NUMBER() OVER (ORDER BY score) row_num,
	CUME_DIST() OVER (ORDER BY score) cume_dist_val # range 0 to 1
FROM scores;


SELECT sales_employee, fiscal_year,
	DENSE_RANK() OVER (PARTITION BY fiscal_year
			ORDER BY sale DESC
	) AS sales_rank,
    RANK() OVER ( PARTITION BY fiscal_year ORDER BY sale ) AS 'Rank'
FROM sales;

/*
ID 		sale 			dense_rank					rank
1			1000			1-1								1-3
2			1000			1-1								1-3
3			1000			1-1								1-3
4			100				2-2									4
*/

CREATE TABLE overtime (
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    hours INT NOT NULL,
    PRIMARY KEY (employee_name , department)
);

INSERT INTO overtime(employee_name, department,hours)
VALUES
				('Diane Murphy','Accounting',37),
				('Mary Patterson','Accounting',74),
				('Jeff Firrelli','Accounting',40),
				('William Patterson','Finance',58),
				('Gerard Bondur','Finance',47),
				('Anthony Bow','Finance',66),
				('Leslie Jennings','IT',90),
				('Leslie Thompson','IT',88),
				('Julie Firrelli','Sales',81),
				('Steve Patterson','Sales',29),
				('Foon Yue Tseng','Sales',65),
				('George Vanauf','Marketing',89),
				('Loui Bondur','Marketing',49),
				('Gerard Hernandez','Marketing',66),
				('Pamela Castillo','SCM',96),
				('Larry Bott','SCM',100),
				('Barry Jones','SCM',65);

# Slide 15
SELECT * FROM overtime;

SELECT employee_name, hours,
FIRST_VALUE(employee_name) 
OVER (ORDER BY hours ASC) AS least_over_time
FROM overtime;


# Slide 16
SELECT employee_name, department, hours,
FIRST_VALUE(employee_name) 
		OVER (
				PARTITION BY department
				ORDER BY hours
				) least_over_time
FROM overtime;
