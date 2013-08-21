INSERT INTO geekdom_members.`User` (`id`,`fullName`,`email`,`server_id`,`create_date`,`status` ) 
SELECT id,CONCAT(first_name,' ', last_name) as fullName, email, LOWER(CONCAT(first_name,'.', last_name)) as server_id, date_joined as create_date, 'enabled' FROM
geekdom_production.auth_user gau WHERE is_active=1 AND id NOT IN (1, 173, 219, 222, 225, 226, 545, 39, 40, 51, 103,151, 160,164, 275, 458, 536, 703, 754, 769, 770, 798, 799, 809, 818, 865, 892) AND id in (SELECT id from geekdom_production.auth_user WHERE email in (select distinct email from geekdom_production.auth_user WHERE email!='') );

INSERT INTO geekdom_members.`User` (`id`,`fullName`,`email`,`server_id`,`create_date`,`status` ) 
SELECT id,CONCAT(first_name,' ', last_name) as fullName, gau.email, LOWER(CONCAT(first_name,'.', last_name)) as server_id, date_joined as create_date, 'retired' FROM
geekdom_production.auth_user gau WHERE is_active=0 AND id NOT IN (1, 173, 219, 222, 225, 226, 545, 39, 40, 51, 103,151, 160,164, 275, 458, 536, 703, 754, 769, 770, 798, 799, 809, 818, 865, 892) AND id in (SELECT id from geekdom_production.auth_user WHERE email in (select distinct email from geekdom_production.auth_user WHERE email!=''));

SELECT distinct gab.id, gau.id, gab.first_name,gab.last_name,gab.email,gau.email,gab.is_active,gau.is_active FROM geekdom_production.auth_user gab
INNER JOIN geekdom_production.auth_user gau 
	WHERE gau.email=gab.email AND gau.id!=gab.id AND (gau.last_name=gab.last_name OR gau.first_name=gab.first_name) AND gab.is_active=1 ORDER BY gab.email,gab.id,gab.last_name ;

DELETE FROM geekdom_members.`User` WHERE id<1000;

SELECT count(1) FROM geekdom_members.`User`;
select * from geekdom_production.`auth_user` WHERE id IN (1, 173, 219, 222, 225, 226, 545, 39, 40, 51, 103,151, 160,164, 275, 458, 536, 703, 754, 769, 770, 798, 799, 809, 818, 865, 892);
890-863
SELECT * FROM geekdom_production.auth_user WHERE email LIKE " %";

-- users with no email address
SELECT id, concat(first_name,' ',last_name) as fullName from geekdom_production.auth_user WHERE email='' ;
(1, 173, 219, 222, 225, 226, 545)
-- Problem users
(39, 40, 51, 103,151, 160,164, 275, 458, 536, 703, 754, 769, 770, 798, 799, 809, 818, 865, 892);

-- Duplicate users that are both active
select * FROM geekdom_production.auth_user WHERE id IN (458,798,769,770);
-- Duplicate users that are active and their counter part is not
select * FROM geekdom_production.auth_user WHERE id IN (40, 458, 536, 703, 754, 809, 865, 892)
-- Inactive duplicate users with active counter parts
DELETE FROM geekdom_production.auth_user WHERE id IN (160, 275,151,164, 51, 799, 103);