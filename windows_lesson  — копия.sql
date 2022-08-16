# Window function 

SELECT * FROM employees.employees;

# CTE - common table expression 
WITH testCTE(full_name)
AS 
	( 
    SELECT CONCAT(first_name, ' ' ,last_name)  FROM employees.employees
)

SELECT * FROM employees.employees;


WITH testMaleCTE(id, first_name, last_name, gender, type)
AS 
	( 
    SELECT emp_no, first_name, last_name, gender, 'Male'
    FROM employees.employees
    WHERE gender = 'M' AND emp_no BETWEEN 10050 AND 10060
)

SELECT * FROM employees.employees;


WITH testFemaleCTE(id, first_name, last_name, gender, type)
AS (
	SELECT emp_no, first_name, last_name, gender, 'Female'
    FROM employees.employees
    WHERE gender = 'F' AND emp_no < 10050
)

SELECT * FROM employees.employees;

SELECT  * FROM testMaleCTE;


SELECT * FROM employees.employees;

select *  from testMaleCTE, testFemaleCTE;



SELECT * FROM  employees.salaries;


WITH avg_maleCTE(avg_male)
AS (
SELECT AVG(salary)
    FROM employees.salaries
	WHERE emp_no IN ( SELECT emp_no FROM employees.employees WHERE gender = 'M')
    ),
avg_femaleCTE(avg_female)
AS (
	SELECT AVG(salary)
    FROM employees.salaries
	WHERE emp_no IN ( SELECT emp_no FROM employees.employees WHERE gender = 'F')
)

SELECT avg_male - ( SELECT * FROM avg_femaleCTE) 
FROM avg_maleCTE;


# Task 2: Вивезти максимальну ЗП по співробітниках в кого id меньше 10050,  і мінімальну зп в  діапазоні 10051 та 10099 
# *Добавити колонку type - де буде значення min/max
WITH max_value_in_idCTE(max_value, type)
AS (
	SELECT MAX(salary), 'max value'
    FROM employees.salaries
	WHERE emp_no  < 10050
    ),
min_value_CTE(min_value, type)
AS (
	SELECT MIN(salary), 'min value'
    FROM employees.salaries
	WHERE emp_no BETWEEN 10051 AND 10099
    )


SELECT *
FROM max_value_in_idCTE
UNION 
SELECT *
FROM min_value_CTE;


# Рекурсия 
WITH RECURSIVE testRecursive(n, value)
AS (
		SELECT 1,1 
        UNION
        SELECT n +1, value * (n + 1)
        FROM testRecursive
        LIMIT 20
)


SELECT * FROM testRecursive;

USE employees;

CREATE DATABASE  test_create_db;

CREATE DATABASE IF NOT EXISTS test_create_db;

SHOW DATABASES;

/*
START TRANSACTION;

DROP DATABASE IF  EXISTS	test_create_db;

DROP DATABASE test_create_db;

SHOW DATABASES;

ROLLBACK;
*/

select * from employees.salaries
where emp_no = 10001;

SHOW DATABASES;

USE test_create_db;

CREATE TABLE IF NOT EXISTS tasks (
	task_id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	start_date DATE,
	due_date DATE,
	status TINYINT NOT NULL,
	priority TINYINT NOT NULL,
	description TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS emplo_test LIKE employees.employees;

DESCRIBE tasks;

DESCRIBE emplo_test;

SELECT * FROM emplo_test;


DROP TABLE IF EXISTS checklists;


CREATE TABLE IF NOT EXISTS checklists (
					todo_id 		  INT 							 AUTO_INCREMENT,
					task_id 		  INT,
					todo 			  VARCHAR(255) 			NOT NULL,
					is_completed BOOLEAN 					NOT NULL 					DEFAULT FALSE,
                    #,FOREIGN KEY (task_id) REFERENCES tasks (task_id) ON UPDATE RESTRICT ON DELETE CASCADE )
                    
					PRIMARY KEY (todo_id , task_id));
                    

DESCRIBE checklists;

INSERT INTO checklists(task_id, todo)
VALUES(109, 'task 1');

INSERT INTO checklists(task_id, todo)
VALUES(109, 'task 1');

select * from checklists;

INSERT INTO checklists(task_id, todo, is_completed)
VALUES(987, 'wsx', -127); 

 
select * 
 from checklists;

DROP TABLE IF EXISTS checklists;


CREATE TABLE IF NOT EXISTS checklists2 (
					todo_id 			INT 			AUTO_INCREMENT,
					task_id 			INT,
					todo			 VARCHAR(255)			 NOT NULL,
					is_completed BOOLEAN NOT NULL DEFAULT FALSE,
					PRIMARY KEY (todo_id , task_id), 
                    FOREIGN KEY (task_id) REFERENCES tasks (task_id)
					ON UPDATE RESTRICT ON DELETE CASCADE );

select * 
 from checklists2;
 
 SHOW TABLES;

RENAME TABLE checklists TO employees;

SHOW TABLES;

RENAME TABLE employees.departments_dup TO test_create_db.departments_dup;



SHOW TABLES;


CREATE TABLE posts (
			id 				INT 										AUTO_INCREMENT 				PRIMARY KEY,
			title 				VARCHAR(255) 					NOT NULL,
			excerpt 		VARCHAR(400),
			content 		TEXT,
			created_at	DATETIME,
			updated_at 	DATETIME
);

select * from posts;


ALTER TABLE posts
DROP COLUMN excerpt;

select * from posts;

DESC posts;

SHOW TABLES;

select * from tasks;


ALTER TABLE tasks
ADD COLUMN  hardware VARCHAR(255) AFTER status ; 

select * from tasks;

ALTER TABLE tasks
ADD COLUMN  hardware_group INT NOT NULL; 

ALTER TABLE tasks
ADD COLUMN  id_last INT NOT NULL ; 

SELECT * FROM tasks;

SHOW TABLES;

SELECT * FROM departments_dup;

# TRUNCATE tasks;

TRUNCATE departments_dup;


SELECT * FROM  departments_dup;


SELECT  COUNT(emp_no) FROM  employees.emplo_dup2;


START TRANSACTION;

TRUNCATE TABLE employees.emplo_dup2;

ROLLBACK;


SELECT  COUNT(emp_no) FROM  employees.emplo_dup2;

DESC tasks;

# id, task_id, title, end_date, status, priority, hardware_group, id_last
INSERT INTO tasks(id, status,  priority, title ,start_date, due_date, hardware_group)
VALUES  (1, 0, 0, 'Learn NOT NULL constraint', '2017-02-01','2017-02-02', 10),
				(2,  1, 1, 'Check and update NOT NULL constraint to your database', '2017-02-01',NULL, 11);

DESC tasks;
INSERT INTO tasks(id ,task_id, title, status, priority, hardware_group, id_last)
VALUES  (1, 0,  'Learn NOT NULL constraint', 1, 10, 5, 8),
				(2,  2,  'Check and update NOT NULL constraint to your database', 2, 11, 7,1);
                
SELECT * FROM tasks;

UPDATE tasks
SET
	due_date =  current_date()  + 7
WHERE
	due_date IS NULL;


INSERT INTO tasks(id ,task_id, title, status, priority, hardware_group, id_last, start_date, title )
VALUES  (17, 19,  'Learn NOT NULL constraintc ', 1, 10, 5, 8, '1998-05-05' , 'some text'),
				(20,  21,  'Check and update NOT NUc LL constraint to your database', 2, 11, 7,1, '2001-08-01', 'some text 1');

SELECT * FROM  tasks;

DESC tasks; 

INSERT INTO tasks(id, title, end_date, status, priority, hardware_group, id_last)
Values (17,  'Some title',  NOW(), 7, 1, 4, 9);


INSERT INTO tasks(id, title, end_date, status, priority, hardware_group, id_last )
Values (17,  'Some title',  NOW(), 7, 1, 4, 9);

SELECT * FROM  tasks;

delete from tasks 
where task_id > 4;

SELECT * FROM  tasks;

DESC tasks; 

UPDATE tasks
SET
	due_date =  start_date  + 7
WHERE
	due_date IS NULL;

SELECT * FROM  tasks;

ALTER TABLE tasks
CHANGE COLUMN
	due_date
	end_date DATE NOT NULL;

ALTER TABLE tasks
MODIFY COLUMN
	end_date 
    DATE ;
    
DESCRIBE tasks;
SELECT * FROM tasks;

CREATE TABLE users (
	user_id 					INT 								AUTO_INCREMENT 							PRIMARY KEY,
	username 				VARCHAR(40),
	password 				VARCHAR(255),
	email 						VARCHAR(255) );
    
SHOW TABLES;
    
CREATE TABLE roles(
	role_id INT AUTO_INCREMENT,
	role_name VARCHAR(50),
	PRIMARY KEY(role_id)
);

CREATE TABLE user_roles(
	user_id INT,
	role_id INT,
	PRIMARY KEY(user_id, role_id),
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	FOREIGN KEY(role_id) REFERENCES roles(role_id)
);

CREATE TABLE pk_demos(
	id INT,
	title VARCHAR(255) NOT NULL
);

ALTER TABLE pk_demos
ADD PRIMARY KEY(id);

DESC pk_demos;


CREATE DATABASE fk_demo;

USE fk_demo;

# Restrict  
CREATE TABLE categories (
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL
)  ENGINE = INNODB;

CREATE TABLE products (
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    categoryId INT,
    CONSTRAINT fk_category FOREIGN KEY (categoryId) REFERENCES categories(categoryId) # RESRTICT
)  ENGINE = INNODB;

DESC categories;

DESC products;

INSERT INTO categories(categoryName)
VALUES('Smartphone'), ('Smartwatch');

SELECT * FROM categories;

INSERT INTO products(productName, categoryId) VALUES('iPhone',1);

SELECT * FROM products;

INSERT INTO products(productName, categoryId)
						VALUES('Macbook',			5);

# Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`fk_demo`.`products`, CONSTRAINT `fk_category` 
#FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryId`))

INSERT INTO products(productName, categoryId)
						VALUES('iPad',					2);

SELECT * FROM products;

UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;


DROP TABLE products;

CREATE TABLE products (
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    categoryId INT NOT NULL,
    CONSTRAINT fk_category FOREIGN KEY (categoryId)
        REFERENCES categories (categoryId)
        ON UPDATE CASCADE ON DELETE CASCADE
)  ENGINE = INNODB;

desc products;

INSERT INTO products(productName, categoryId)
VALUES
	('iPhone', 1),
	('Galaxy Note',1),
	('Apple Watch',2),
	('Samsung Galaxy Watch',2);

select * from products;


UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;

SELECT * FROM categories;

SELECT * FROM products;


DELETE FROM categories
WHERE categoryId = 2;

SELECT * FROM categories;

SELECT * FROM products;


# Slide 25
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;

SHOW TABLES;

CREATE TABLE categories (
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE products (
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    categoryId INT,
    CONSTRAINT fk_category FOREIGN KEY (categoryId)
        REFERENCES categories (categoryId)
        ON UPDATE SET NULL ON DELETE SET NULL
)  ENGINE=INNODB;


# Slide 26
INSERT INTO categories(categoryName)
VALUES
('Smartphone'),
('Smartwatch');

INSERT INTO products(productName, categoryId)
VALUES
('iPhone', 1),
('Galaxy Note',1),
('Apple Watch',2),
('Samsung Galary Watch',2);

SELECT * FROM categories;

SELECT * FROM  products;

UPDATE categories 
SET 
    categoryId = 100
WHERE
    categoryId = 1;
    

SELECT * FROM products;
    
SELECT * FROM categories;

DELETE FROM categories
WHERE categoryId = 2;

SELECT * FROM products;

SET foreign_key_checks = 0;

SET foreign_key_checks = 1;

SELECT * FROM products;

CREATE TABLE parts (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10 , 2 ) 	NOT NULL			 CHECK (cost >= 0 AND cost < 100), # [ )
    price DECIMAL(10 , 2 ) 	NOT NULL 			CHECK (price >= 0)
);


INSERT INTO parts(part_no, description,cost,price)
VALUES('A-001','Cooler', 101, 0);

DESC parts;
SELECT * FROM parts;

DROP TABLE parts;

CREATE TABLE parts (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10 , 2 ) NOT NULL 			CHECK (cost >= 0),
    price DECIMAL(10 , 2 ) NOT NULL 			CHECK (price >= 0),
    CONSTRAINT parts_chk_price_gt_cost 	CHECK (price >= cost)
);

SELECT * FROM parts;

INSERT INTO parts(part_no, description,cost,price)
VALUES('A-002','Cooler',-1,200);

SELECT * FROM parts;


