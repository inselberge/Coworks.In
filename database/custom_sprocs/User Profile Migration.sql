-- all information
SELECT * FROM geekdom_production.manager_userprofile;
-- mug shot
INSERT INTO geekdom_members.User_Image (user_id,image,status,create_date)
	select user_id, mugshot,'enabled',NOW() FROM geekdom_production.manager_userprofile WHERE mugshot!='' AND user_id IN(select id FROM geekdom_members.User);

INSERT INTO geekdom_members.User_Contact(user_id,contact_description_id,contact_value,status,create_date)
SELECT user_id, 1, email, 'enabled',
SELECT count(1) FROM geekdom_members.User_Contact WHERE contact_description_id=1;
-- phone number
INSERT INTO geekdom_members.User_Contact(`user_id`, `contact_description_id`, `contact_value`, `status`, `create_date`)
select user_id, 2, phone_number, 'enabled',NOW() FROM geekdom_production.manager_userprofile WHERE phone_number!='' AND user_id IN(select id FROM geekdom_members.User);
select * FROM geekdom_members.User_Contact;

-- company name
select user_id, company_name FROM geekdom_production.manager_userprofile WHERE company_name!='';
-- migrate
INSERT INTO geekdom_members.Company (`title`,`status`, `create_date`)
SELECT distinct company_name,'enabled', NOW() FROM geekdom_production.manager_userprofile WHERE company_name!='';

-- distinct companies
select distinct company_name FROM geekdom_production.manager_userprofile WHERE company_name!='';

-- address

SELECT user_id, address, city, state, zipcode FROM geekdom_production.manager_userprofile WHERE address!='' AND city!='' AND state!='' AND zipcode!='' AND user_id IN (select id FROM geekdom_members.User);

-- office
SELECT user_id, office_num FROM geekdom_production.manager_userprofile WHERE office_num !='';

-- distinct offices
SELECT distinct office_num FROM geekdom_production.manager_userprofile WHERE office_num !='' AND office_num NOT LIKE "%-%" AND office_num NOT LIKE "%.%";

-- skills
SELECT user_id, skills FROM geekdom_production.manager_userprofile WHERE skills !='';

-- membership 

-- Twitter

INSERT INTO geekdom_members.User_Contact(user_id,contact_description_id,contact_value, status, create_date)
SELECT user_id, 7, twitter,'enabled',NOW() FROM geekdom_production.manager_userprofile WHERE twitter !='' AND user_id IN (select id FROM geekdom_members.User);

-- Facebook
INSERT INTO geekdom_members.User_Contact(user_id,contact_description_id,contact_value, status, create_date)
SELECT user_id, 8, facebook,'enabled',NOW() FROM geekdom_production.manager_userprofile WHERE facebook !='' AND user_id IN (select id FROM geekdom_members.User);
SELECT count(1) FROM geekdom_members.User_Contact WHERE contact_description_id=8;

-- GChat
INSERT INTO geekdom_members.User_Contact(user_id,contact_description_id,contact_value, status, create_date)
SELECT user_id, 23, gchat, 'enabled', NOW() FROM geekdom_production.manager_userprofile WHERE gchat !='' AND user_id IN (select id FROM geekdom_members.User);
SELECT count(1) FROM geekdom_members.User_Contact WHERE contact_description_id=23;

-- Linked In
INSERT INTO geekdom_members.User_Contact(user_id,contact_description_id,contact_value, status, create_date)
SELECT user_id, 10, linkedin, 'enabled',NOW() FROM geekdom_production.manager_userprofile WHERE linkedin !='' AND user_id IN (select id FROM geekdom_members.User);
SELECT count(1) FROM geekdom_members.User_Contact WHERE contact_description_id=10;
-- Website
INSERT INTO geekdom_members.User_Contact(user_id,contact_description_id,contact_value, status, create_date)
SELECT user_id, 11, website, 'enabled',NOW() FROM geekdom_production.manager_userprofile WHERE website !='' AND user_id IN (select id FROM geekdom_members.User);
SELECT count(1) FROM geekdom_members.User_Contact WHERE contact_description_id=11;
-- Bio
INSERT INTO geekdom_members.User_Bio (user_id, description, status, create_date)
SELECT user_id, bio, 'enabled',NOW() FROM geekdom_production.manager_userprofile WHERE bio !='' AND user_id IN (select id FROM geekdom_members.User);
SELECT count(1) FROM geekdom_members.User_Bio;

-- Custom Membership Price
SELECT user_id, custom_membership_price FROM geekdom_production.manager_userprofile WHERE custom_membership_price!='';

-- Flomio
INSERT INTO geekdom_members.User_Contact(user_id,contact_description_id,contact_value, status, create_date)
SELECT user_id, 22, flomio_tag_uuid,'enabled',NOW() FROM geekdom_production.manager_userprofile WHERE flomio_tag_uuid!='' AND user_id IN (select id FROM geekdom_members.User);
SELECT count(1) FROM geekdom_members.User_Contact WHERE contact_description_id=22;