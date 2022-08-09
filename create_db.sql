

#use test_task;
SHOW DATABASES;

USE test_task;

/*
CREATE TABLE facebook_ad_data (
id  INT UNSIGNED NOT NULL AUTO_INCREMENT,
ad_id VARCHAR(25) NOT NULL,
date DATE, 
country_code VARCHAR(10),
impressions INTEGER,
clicks INTEGER,
spend FLOAT,
 PRIMARY KEY(id)
);
*/
/*
CREATE TABLE facebook_ad_data (
id  INT UNSIGNED NOT NULL AUTO_INCREMENT,
ad_id VARCHAR(25) NOT NULL,
date DATE, 
country_code VARCHAR(10),
impressions INTEGER,
clicks INTEGER,
spend FLOAT,
 PRIMARY KEY(id)
);
*/
INSERT INTO facebook_ad_data(ad_id , country_code, impressions, clicks, spend) VALUES (15 , 'USA', 1209, 100, 43.02);
INSERT INTO facebook_ad_data(ad_id ,date,  country_code, impressions, clicks, spend) VALUES (15 , curdate(),'USA', 1209, 100, 43.02);
select * from facebook_ad_data;