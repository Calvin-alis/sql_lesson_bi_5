# Import data from csv

#drop table sim;

select * from application;

SELECT * FROM sim_cards;

SELECT str_to_date('18.08.2022', '%d.%m.%Y');



UPDATE employees.sim_cards
SET 
CHANGE_DATE = str_to_date(CHANGE_DATE,  '%d.%m.%Y  %H:%i:%s');


select * from sim_cards;

RENAME TABLE sim_cards TO sim;

select * from sim;

ALTER TABLE sim
RENAME COLUMN  CHANGE_USER TO change_user;

select * from sim;


# Змінити назву всіх колонок на lower_case
# Змінити тип колонки change_date на DATA
