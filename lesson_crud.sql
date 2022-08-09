# Lesson Update, Insert, Delete - DML


# DML - Select, Insert, Update, delete
# DDL - Create, Alter, Drop 
# DCL - Grant, Revake
# TCL - Savepoint, Commit, Rollback 

/* CRUD 
	Create
    Read/Rewrite 
    Update
    Delete 
*/

/*
CREATE TABLE tasks(
	task_id INT AUTO_INCREMENT,
	title VARCHAR(255) NOT NULL, 
    start_date DATE,
    due_date DATE,
    priority TINYINT NOT NULL DEFAULT 3,
    description TEXT,
    PRIMARY KEY(task_id)
    );
*/

SELECT * FROM tasks;



# INSERT - добавить значение

INSERT INTO tasks VALUES ('Learn mysql INSERT', 1);

# Добавить данные в таблицу(перечислить колонки)  
INSERT INTO tasks(title, priority) 	VALUES ('Learn mysql INSERT', 1);

SELECT * FROM tasks;

INSERT INTO tasks(start_date, priority) 	VALUES (NOW(), 1); # будет ошибки из за NOT NULL

INSERT INTO tasks VALUES (5,'Learn mysql INSERT', CURRENT_DATE(),CURRENT_DATE(),1, 'test');

SELECT * FROM tasks;

INSERT INTO tasks VALUES 
								(6,'Learn mysql INSERT', CURRENT_DATE(),CURRENT_DATE(),1, 'test2'),
                                (7,'Learn mysql INSERT', CURRENT_DATE(),CURRENT_DATE(), 2, 'test3'),
                                (8,'Learn mysql INSERT', CURRENT_DATE(),CURRENT_DATE(), 4 ,'test4'),
                                (12,'Learn mysql INSERT', CURRENT_DATE(),CURRENT_DATE(), 5 , 'test5');


select * from tasks;


INSERT INTO tasks(title, start_date, due_date, description)  VALUES
								('Learn mysql INSERT', CURRENT_DATE(),CURRENT_DATE(),'test2');
					
                    
INSERT INTO tasks(title) VALUES ('Try default');


SELECT * FROM tasks;

/*
CREATE TABLE stats (
    c1 INT,
    c2 INT,
    c3 INT
);
*/

INSERT INTO stats(c1,c2,c3)
VALUES( 
					(SELECT MAX(salary) FROM employees.salaries),
                    (SELECT COUNT(emp_no) FROM employees.employees),
                    (SELECT MIN(salary) FROM employees.salaries) ) ;


SELECT * FROM stats;

/*
CREATE TABLE emplo_dup1 LIKE employees.employees;
*/

SELECT * FROM emplo_dup1;



INSERT INTO emplo_dup1
SELECT * FROM employees.employees WHERE emp_no < 10050;


SELECT * FROM emplo_dup1;


# WHERE 
SELECT * FROM emplo_dup1;

# 1 - дія 
select * from emplo_dup1 
WHERE emp_no = 10001;

# 2 - дія
UPDATE emplo_dup1 SET 
first_name  = 'new name', last_name = 'new last name' WHERE emp_no = 10001;

SELECT * FROM emplo_dup1;



UPDATE emplo_dup1 SET 
first_name  = 'You name',
last_name = 'New last name',
hire_date = CURRENT_DATE()
WHERE emp_no = 10001;

SELECT * FROM emplo_dup1;

/*
UPDATE emplo_dup1
INNER JOIN employees.titles USING(emp_no)
SET
first_name = title, 
last_name = title,
hire_date = from_date
WHERE NOW() BETWEEN from_date AND to_date AND lenght(title) < 10;
*/

# Best practice 
START TRANSACTION;

UPDATE emplo_dup1 SET 
first_name  = 'You name',
last_name = 'New last name',
hire_date = CURRENT_DATE();

SELECT * FROM emplo_dup1;

ROLLBACK; # COMMIT;

select * from emplo_dup1;

# Delete 

SELECT * FROM emplo_dup1;

DELETE 
FROM emplo_dup1
WHERE emp_no = 10001;

SELECT * FROM emplo_dup1;

DELETE 
FROM emplo_dup1
ORDER BY emp_no DESC
LIMIT 5;

SELECT * FROM emplo_dup1;


DELETE
FROM emplo_dup1
WHERE emp_no BETWEEN 10001 AND 10010
LIMIT 5; 

SELECT * FROM emplo_dup1;

CREATE TABLE emplo_dup2 LIKE employees.employees;

INSERT INTO emplo_dup2
SELECT * FROM employees.employees WHERE emp_no < 10050;

SELECT * FROM emplo_dup2;

SELECT * FROM employees.emplo_dup1 AS  d1
INNER JOIN employees.emplo_dup2 AS d2 USING(emp_no);


DELETE d1.*, d2.*
FROM employees.emplo_dup1 AS  d1
INNER JOIN employees.emplo_dup2 AS d2 USING(emp_no);

select * from emplo_dup1;

select * from emplo_dup2;

