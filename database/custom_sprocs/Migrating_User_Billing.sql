DELIMITER $$
DROP PROCEDURE IF EXISTS `geekdom_members`.`migrateUserBilling`$$
CREATE PROCEDURE `geekdom_members`.`migrateUserBilling`()
BEGIN

-- Migrate Non-state Members
INSERT INTO geekdom_members.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '1', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM geekdom_members.`User`
)
AND gpmp.`membership_type_id` =7;

-- Migrate Students
INSERT INTO geekdom_members.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '2', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM geekdom_members.`User`
)
AND gpmp.`membership_type_id` =3;

-- Migrate Rackspace Members
INSERT INTO geekdom_members.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '3', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM geekdom_members.`User`
)
AND gpmp.`membership_type_id` =9;

-- Migrate Community Members
INSERT INTO geekdom_members.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '4', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM geekdom_members.`User`
)
AND gpmp.`membership_type_id` =1;

-- Migrate Old Startup Price
INSERT INTO geekdom_members.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '5', 'retired', gpau.`date_joined` , '2012-12-31 23:59:59' , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM geekdom_members.`User`
)
AND gpmp.`membership_type_id` =5;

-- Old Business Price
INSERT INTO geekdom_members.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '6', 'retired', gpau.`date_joined` , '2012-12-31 23:59:59' , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM geekdom_members.`User`
)
AND gpmp.`membership_type_id` =4;

-- Old Dedicated Desk
INSERT INTO geekdom_members.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '7', 'retired', gpau.`date_joined` , '2012-12-31 23:59:59' , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM geekdom_members.`User`
)
AND gpmp.`membership_type_id` =2;

-- New Startup Pricing For New Members
INSERT INTO geekdom_members.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '8', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM geekdom_members.`User`
)
AND gpmp.`membership_type_id` =5
AND DATE(gpau.`date_joined`) > DATE("2013-01-01");

-- New Startup Pricing For Existing Members
INSERT INTO geekdom_members.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '8', 'enabled', DATE("2013-01-01") , NOW() , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM geekdom_members.`User`
)
AND gpmp.`membership_type_id` =5
AND DATE(gpau.`date_joined`) < DATE("2013-01-01");

-- New Business Desk Pricing for New Members
INSERT INTO geekdom_members.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '9', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM geekdom_members.`User`
)
AND gpmp.`membership_type_id` =4
AND DATE(gpau.`date_joined`) > DATE("2013-01-01");

-- New Business Desk Pricing for Existing Members
INSERT INTO geekdom_members.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '9', 'enabled', DATE("2013-01-01") , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM geekdom_members.`User`
)
AND gpmp.`membership_type_id` =4
AND DATE(gpau.`date_joined`) < DATE("2013-01-01");

-- Migrate Staff Pricing
INSERT INTO geekdom_members.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '10', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM geekdom_members.`User`
)
AND gpmp.`membership_type_id` =8;

-- Migrate Techstars
INSERT INTO geekdom_members.`User_Billing`
(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '11', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM geekdom_members.`User`
)
AND gpmp.`membership_type_id` =10;

-- Migrate Geekdom Fund
INSERT INTO geekdom_members.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '12', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM geekdom_members.`User`
)
AND gpmp.`membership_type_id` =11;
END $$
