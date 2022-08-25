USE employees;

DESCRIBE employees;


SHOW ENGINES;

/*
		MyISAM - 
        ISAM (англ. Indexed Sequential Access Method — индексно-последовательный метод доступа) — способ хранения данных для быстрого доступа к ним. 
        Способ был разработан компанией IBM для мейнфреймов в 1963 году, в настоящее время это основной способ представления данных почти во всех базах данных.
		В ISAM отдельно хранятся записи с данными и индексы (служебные данные), служащие для быстрого доступа к записям. 
        Данные хранятся последовательно (изначально ISAM использовался для хранения данных на ленточных накопителях, обеспечивающих только последовательные чтение/запись). 
			Второй набор данных — хеш-таблица — индексы, содержащие указатели, которые позволят извлечь определенные записи без поиска по всей базе данных. Это несколько отличается от индексов в современных поисковых базах данных, так как в них индексы хранятся прямо в записях. Ключевая особенность ISAM — индексы малы и поиск по ним быстр. 
		Изменение в записях не требует изменять все записи, требуется только перестроить индекс.
*/

/*
		MEMORY
        MEMORY механизм хранения (прежде известный как HEAP) составляет таблицы специального назначения с содержанием, которое сохранено в памяти. 
        Поскольку данные уязвимы для катастрофических отказов, аппаратные проблемы, или отключения электричества питания, 
        только используют эти таблицы в качестве временных рабочих областей или кэшей только для чтения для данных, которые вытягивают от других таблиц.
*/

/*
		CSV
        Work with csv files
*/

/*
		Add requests:
        More about engine - https://habr.com/ru/post/64851/
        ACID - https://habr.com/ru/post/555920/
        Псевдокод - https://techrocks.ru/2020/03/27/how-to-write-pseudocode/
*/

/*
		InnoDB - ACID model
*/

SELECT COUNT(*) FROM employees;


SELECT * from employees;

SELECT 
	COUNT(DISTINCT emp_no), COUNT(DISTINCT birth_date), COUNT(DISTINCT first_name),
	COUNT(DISTINCT last_name), COUNT(DISTINCT gender), COUNT(DISTINCT hire_date)
    FROM employees.employees;
    
    
SELECT emp_no, last_Name, first_Name
FROM employees
WHERE last_Name like 'Ranta';

CREATE INDEX last_Name ON employees(last_Name);

SELECT emp_no, last_Name, first_Name
FROM employees
WHERE last_Name like 'Ranta';


#SHOW FULL PROCESSLIST; 
#KILL 11;

#select 0.144 / 0.0017;

EXPLAIN SELECT emp_no, last_Name, first_Name
FROM employees
WHERE last_Name like 'Ranta';


EXPLAIN SELECT emp_no, last_Name, first_Name
FROM employees
WHERE LOWER(last_Name) like 'Ranta';


EXPLAIN SELECT emp_no, last_Name, first_Name
FROM employees IGNORE INDEX (last_name)
WHERE last_Name like 'Ranta';

CREATE INDEX last_Name_prefix ON employees(last_Name(8));


EXPLAIN SELECT *
FROM 	employees
INNER JOIN salaries;

SELECT  298936 * 1770864;


EXPLAIN SELECT *
FROM 	employees
INNER JOIN salaries USING(emp_no);

CREATE INDEX hireDateE ON employees(hire_date, first_name);

SELECT * FROM employees;

 explain SELECT *  FROM
employees 
WHERE YEAR(hire_date) = 1985;


EXPLAIN SELECT *  FROM
employees 
WHERE hire_date = '1985-01-01';

EXPLAIN SELECT *  FROM
employees 
WHERE hire_date BETWEEN '1985-01-01' AND '1999-01-01'; 


EXPLAIN SELECT *  FROM
employees.employees FORCE INDEX (hireDate)
WHERE hire_date BETWEEN '1985-01-01' AND '1999-01-01'; 


EXPLAIN SELECT *  FROM  
employees.employees IGNORE INDEX (hireDate)
WHERE hire_date BETWEEN '1985-01-01' AND '1999-01-01'; 


ALTER TABLE employees.employees 
ALTER INDEX last_Name INVISIBLE;


EXPLAIN SELECT emp_no, last_Name, first_Name
FROM employees IGNORE INDEX(last_name_prefix)
WHERE last_Name like 'Ranta';


# Видалення індексів 
DROP INDEX last_Name ON employees;

CREATE INDEX last_Name ON employees(last_Name);


DROP INDEX last_Name ON employees
ALGORITHM = INPLACE
LOCK = DEFAULT;


DROP INDEX last_Name ON employees
ALGORITHM = COPY
LOCK = DEFAULT;


DROP TABLE t;


CREATE TABLE t (
pk INT PRIMARY KEY,
c VARCHAR(10)
);

DESCRIBE t;
#DROP INDEX "PRIMARY" ON t;


SHOW INDEXES FROM employees;


/*
		B-Tree Index - Binary Search - log2N
*/

explain select first_name from employees;



show index from employees;

CREATE TABLE IF NOT EXISTS contacts (
	id 							INT 												AUTO_INCREMENT 			PRIMARY KEY,
	first_name 				VARCHAR(50) 							NOT NULL,
	last_name 				VARCHAR(50) 							NOT NULL,
	phone 						VARCHAR(15) 							NOT NULL,
	email 						VARCHAR(100) 							NOT NULL, 						UNIQUE KEY unique_email (email)
);

explain select * from contacts;


SHOW INDEXES FROM contacts;



INSERT INTO contacts(first_name,last_name,phone,email)
VALUES('John','Doe','(408)-999-9765','john.doe@mysqltutorial.org');


INSERT INTO contacts(first_name,last_name,phone,email)
VALUES('Johny','Doe','(408)-999-4321','a');


EXPLAIN 
SELECT *
FROM employees.employees
WHERE last_name LIKE 'Adam';

EXPLAIN 
SELECT *
FROM employees.employees
WHERE last_name LIKE '_dam'; # відключає індекс 


EXPLAIN 
SELECT *
FROM employees.employees
WHERE last_name  LIKE LOWER('Adam');


CREATE TABLE complex_talbe (
c1 	INT PRIMARY KEY,
c2	FLOAT,
c3 	INT,
c4  	INT,
INDEX complex_index (c2,c3,c4)
);

CREATE INDEX index_name
ON table_name(c2,c3,c4);


select * from employees;

