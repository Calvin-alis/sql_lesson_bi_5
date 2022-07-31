SELECT DAYOFMONTH('9999-12-31');


SELECT DAYOFMONTH('2002-06-20'), month('2022-07-27'); # поменять местами месяц и день ;


SELECT DATE_ADD('2022-07-28', INTERVAL 5 DAY);


SELECT  DAYNAME('1996-02-06');

SELECT DATE_SUB('2022-07-28 20:50:01', INTERVAL -65 MINUTE);

SELECT DATE_ADD('2016-06-01', INTERVAL -1 DAY);

SELECT DATE_SUB('2022/07/28', INTERVAL 7850000000 second);

# статичні дані від до 2037
# Перевод у дні 
SELECT TO_DAYS('2022-06-01 23:34:25'); # може не враховувати високосні роки

SELECT ROUND((TO_DAYS('2024-06-01 23:34:25') -  TO_DAYS('9999-06-01 23:34:25')) / 365, 2);


# Slide 4 - AddTime
SELECT ADDTIME('2017-12-31 23:59:59.59999' , '1:1:1.00002');

SELECT ADDTIME('21:14:56', '200000000:04:0001');


SELECT TO_DAYS('2019-06-01 23:59.59'), TO_DAYS('2019-06-01 00:00.00'); # не має важливість години *тільки дні


# Slide 5 - TimeZone(TZ) - конвертує часові пояси

SELECT @@GLOBAL.time_zone, @@SESSION.time_zone; # глобальна зона так зона сессії 

# Задати свій тайм зон 
#SET time_zone = '+3:00'; # наш час +3
#SET global = '-6:00';


SELECT CONVERT_TZ('2014-01-01 02:00:00', '+00:00' ,'+06:00') AS 'Tokio';



# Task 1: От нашого часу змінити зону та вивести її


SELECT CONVERT_TZ(concat(curdate(), ' ',current_time()) , '+00:00' ,'+06:00');


SELECT CONVERT_TZ(now(), '+00:00', '+06:00')  AS 'Time in Tokio', 
				CONVERT_TZ(now(), '+00:00', '-04:00')  AS 'Time in New-York',
                CONVERT_TZ(now(), '+00:00', '+01:00')  AS 'Time in London' ;


# Slide 6 - Now 

SELECT NOW();

SELECT NOW() + 0; 

SELECT NOW(), current_timestamp(), current_timestamp;

SELECT CURDATE(), current_date(), current_date;

SELECT CURDATE() + 0; # numeric contex 


# Task 1: Відобразити значення поточної дати -1 рік

SELECT YEAR(CURDATE()) , month(NOW()), day(NOW());

SELECT DATE_SUB(curdate(), INTERVAL 1 YEAR);

SELECT DATE_ADD(NOW(), INTERVAL -1 YEAR) AS 'YEAR - 1';


# Task 2: Вивести всіх(порядковий номер) співробітників  і їх зп, кто працює на поточний момент


SELECT * from employees.salaries;

SELECT emp_no, salary
FROM employees.salaries
WHERE curdate() BETWEEN  from_date AND  to_date;

/* Перевірка 
Поточна дата 					2022-07-28
Дата початку періода 		2020-01-01
Дата закінчення періоду	2023-01-01
*/

# Task 3: Кто працює на поточну дату 01-01-1990

# 1 - var
SELECT *
FROM 	employees.salaries
WHERE from_date <= '1990-01-01' AND to_date >= '1990-01-01';

# 2 - var
SELECT * 
FROM employees.salaries
WHERE '1990-01-01' BETWEEN from_date AND to_date;



# Рахує різницю між датами
SELECT TIMESTAMPDIFF(day, NOW(), '2022-08-15');
SELECT TIMESTAMPDIFF(month, NOW(), '2022-09-15');
SELECT TIMESTAMPDIFF(year, NOW(), '2023-09-15');


# Curtime - системний час

SELECT CURTIME();

SELECT CURRENT_TIME(), CURTIME(), CURRENT_TIME;

SELECT CURTIME() + 0; # змінити на числовий тип


# Slide 8 - Date_format 
SELECT DATE_FORMAT(NOW(), ' %W %M %y '), now(); 

SELECT DATE_FORMAT(convert_tz(CURTIME(), '+00:00', '+05:00'), '%h:%i:%s') AS 'Time now h small',
				 DATE_FORMAT(convert_tz(CURTIME(), '+00:00', '+05:00'), '%H:%i:%s') AS 'Time now H big';   # test h - 

SELECT DATE_FORMAT(NOW(), '%D-%y -%a %d:%m:%b %j'); 

SELECT DATE_FORMAT(NOW(), '%H %k %I % %r %T %s %w'); 

SELECT DATE_FORMAT(convert_tz(CURTIME(), '+00:00', '+05:00'), '%r  %w');


SELECT DATE_FORMAT(NOW(), '%X %V'); 

SELECT DATE_FORMAT(NOW(), '%x %v');

SELECT DATE_FORMAT(NOW(), '%d%'); # щоб відобразити відсоток потрібно вписати їх два -Старі версії



# Task 1: Відобразити формат відносно поточної дати. Порядковий номер дня місяця, текстова назва місяця і двохзначне число рік
SELECT DATE_FORMAT(NOW(), '%D %M %y');

# Task 2: Відобразити формат відносно поточної дати з часом. Номер дня в році, номер тижня в році, текстова назва місяця скорочений формат
# OR current_timestamp();
SELECT DATE_FORMAT(CONCAT(CURDATE(), ' ', CURTIME()), '%j %V  %b %M');


# Task 3: Відобразити час am or pm 
SELECT DATE_FORMAT(CURRENT_TIMESTAMP(), '%I %i %p %M'),
				 DATE_FORMAT(DATE_ADD(NOW(), INTERVAL 38 hour ), '%I %i %p %M');
                 
                 

# Slide 13
SELECT DAYOFMONTH(NOW());

SELECT DAYOFWEEK(NOW()), WEEKDAY(NOW()); # 1 до 7  1 -  Sun  7  - Sat,  Weekday 0 - Mon  6 - Sun

SELECT DAYOFYEAR('2016-02-29');

# Slide 14
SELECT EXTRACT(YEAR FROM NOW());

SELECT EXTRACT(YEAR_MONTH FROM NOW());

SELECT EXTRACT(DAY_MINUTE FROM NOW()); # Повертае число

SELECT EXTRACT(MICROSECOND FROM '2013-01-12 10:30:00.000133');


SELECT emp_no, first_name, last_name, gender,  EXTRACT(YEAR FROM birth_date) as 'Year'
 FROM employees.employees;

# Slide 15 
SELECT FROM_DAYS(TO_DAYS(NOW())), TO_DAYS(NOW()) / 365;

SELECT FROM_DAYS(731869);

SELECT FROM_DAYS(366);


# Slide 17 
SELECT FROM_UNIXTIME(1447530881);

SELECT FROM_UNIXTIME(1447530881) + 0;

SELECT  from_unixtime(unix_timestamp(NOW())), 
				unix_timestamp(NOW()); # превращает в дату


# Slide 18
SELECT HOUR('20:06:03');
SELECT HOUR(NOW());

SELECT HOUR(NOW()), MINUTE(NOW());

SELECT LAST_DAY(NOW());

SELECT LAST_DAY('2016-02-00');

SELECT LAST_DAY('2016-02-01'), LAST_DAY('2017-02-01');

SELECT SUBDATE(NOW(), (day(NOW())-1)); # отримати перший день


# Slide 19
SELECT MAKETIME(12,12,30);

SELECT MAKETIME(10,35,17.123456);


# Slide 20
SELECT MONTH('2016-05-02');

SELECT MONTHNAME(NOW()),  MONTHNAME('2022-08-01');


# Slide 21 - Тільки роки і місяці  
SELECT FROM_UNIXTIME(200806);

SELECT from_unixtime(168706905);

SELECT PERIOD_ADD(200806, curdate() + 0);

SELECT PERIOD_ADD(200806,-5);

SELECT PERIOD_ADD(200806, 1);

SELECT PERIOD_DIFF(201806,201703);

SELECT PERIOD_DIFF(200806,201703);

# Slide 22
SELECT QUARTER('2018-12-11');

SELECT SECOND('11:18:59.10');

SELECT SECOND(NOW()), NOW();

# Slide 23
SELECT STR_TO_DATE('01,5,2013','%d,%m,%Y');

SELECT STR_TO_DATE('May 1, 2013','%M  %d,%Y');

SELECT STR_TO_DATE('a09:30:17','a%h:%i:%s');
SELECT STR_TO_DATE('ab09:30:17','ab%h:%i:%s');

SELECT STR_TO_DATE('09:30:17abcwefwefwef','%h:%i:%s');

SELECT STR_TO_DATE('abc','abc');

SELECT STR_TO_DATE('9','%m');

SELECT STR_TO_DATE('9','%s');


# Slide 24
SELECT TIME('2013-12-30  01:02:07');

SELECT TIME(NOW());

SELECT TIME('2023-12-31  01:02:03.000623');

# SELECT *,TIME(birth_date) FROM employees.employees;

# Slide 25 
SELECT WEEKDAY('2008-02-03 22:23:00');
SELECT WEEKDAY('2007-11-06');

SELECT WEEKOFYEAR('2008-12-31');

SELECT WEEK('2008-02-20');

SELECT WEEK('2008-02-20',0);

SELECT WEEK('2008-02-20',1);

SELECT WEEK('2016-12-31'); 

# Slide 26
SELECT UNIX_TIMESTAMP();
