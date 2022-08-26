
/*
		Homework 7
     Material:
				1. https://docs.microsoft.com/ru-ru/sql/relational-databases/partitions/partitioned-tables-and-indexes?view=sql-server-ver16
                2. https://habr.com/ru/post/464665/
                3. https://www.youtube.com/watch?v=KSo8l2H_fV8&t=444s
                4. https://www.youtube.com/watch?v=eE9ZZc_oqQk 
     
     -- Task 1
	SQLExercises–INDEX1.
	В схеме tempdb создать таблицу
    dept_empс делением по партициям по полю from_date.
    Для этого:•Избазы данных employeesтаблицы dept_emp →из Info-Table inspector-DDL 
    взять и скопировать код посозданиютой таблицы.•
    Убрать из DDL кода упоминаниепро KEY иCONSTRAINT.•
    Идобавить код длясекционирования по полю from_dateс 1985 года до 2002.Партиции по каждому году.
    
    HINT: CREATE TABLE... PARTITION BY RANGE (YEAR(from_date)) (PARTITION...)
					USE tempdb;
					CREATE TABLE dept_emp (emp_no int NOT NULL,dept_no char(4) NOT NULL,from_datec date NOT NULL,to_date date NOT NULL)
					PARTITION BY RANGE (year(from_datec)) 
					(PARTITION p0 VALUES LESS THAN (1985),
					PARTITION p1 VALUES LESS THAN (1986),
					PARTITION p2 VALUES LESS THAN (1987),
					PARTITION p3 VALUES LESS THAN (1988),
					PARTITION p4 VALUES LESS THAN (1989),
					PARTITION p5 VALUES LESS THAN (1990),
					PARTITION p6 VALUES LESS THAN (1991)
					,PARTITION p7 VALUES LESS THAN (1992),
					PARTITION p8 VALUES LESS THAN (1993),
					PARTITION p9 VALUES LESS THAN (1994),
					PARTITION p10 VALUES LESS THAN (1995),
					PARTITION p11 VALUES LESS THAN (1996),
					PARTITION p12 VALUES LESS THAN (1997),
					PARTITION p13 VALUES LESS THAN (1998),
					PARTITION p14 VALUES LESS THAN (1999),
					PARTITION p15 VALUES LESS THAN (2000),
					PARTITION p16 VALUES LESS THAN (2001),  
					 PARTITION p17 VALUES LESS THAN MAXVALUE);
					 
                     
		-- Task 5. Можно виконати через 
         1. Table Data Import Wizard - для Mac/Linux/Windows
         2. https://stackoverflow.com/questions/11429827/how-to-import-a-csv-file-into-mysql-workbench - не працює на Mac корректно 
         
*/


/*
			Homework 8
            
		Material: 
			1. https://www.w3schools.com/sql/sql_view.asp
            2. https://www.sqlservertutorial.net/sql-server-views/sql-server-create-view/
            3. https://www.youtube.com/watch?v=C0SiKftCYb8
            4. https://www.youtube.com/watch?v=tm5mKMaV9XE
            5. https://www.youtube.com/watch?v=B3RRgBx_foc
        
         6. На основе запроса из 5-го задания, создать вью employees_lang.
         CREATE VIEW  view_empl_lang AS
         SELECT emp_no,birth_date, first_name,last_name,gender,hire_date,lang_name
         FROM employees.employees
         LEFT JOIN tempdb.language USING(lang_no);

*/