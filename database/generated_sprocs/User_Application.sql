DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateUser_Application`$$
CREATE PROCEDURE `validateUser_Application`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Application` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getUser_Application`$$
CREATE PROCEDURE `getUser_Application`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `languages`, `skills`, `started_business`, `work_habit`, `other`, `interests`, `special`, `convicted_felon`, `computer_fraud_or_theft`, `promo_code`, `create_date` 
	FROM `User_Application` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateUser_Application`$$
CREATE PROCEDURE `updateUser_Application`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN LANGUAGES_VALUE text, IN SKILLS_VALUE text, IN STARTED_BUSINESS_VALUE tinyint(1) unsigned, IN WORK_HABIT_VALUE tinyint(1) unsigned, IN OTHER_VALUE varchar(100), IN INTERESTS_VALUE text, IN SPECIAL_VALUE text, IN CONVICTED_FELON_VALUE tinyint(1) unsigned, IN COMPUTER_FRAUD_OR_THEFT_VALUE tinyint(1) unsigned, IN PROMO_CODE_VALUE varchar(45), IN CREATE_DATE_VALUE timestamp)
BEGIN
	UPDATE `User_Application` 
	SET `user_id` = USER_ID_VALUE, `languages` = LANGUAGES_VALUE, `skills` = SKILLS_VALUE, `started_business` = STARTED_BUSINESS_VALUE, `work_habit` = WORK_HABIT_VALUE, `other` = OTHER_VALUE, `interests` = INTERESTS_VALUE, `special` = SPECIAL_VALUE, `convicted_felon` = CONVICTED_FELON_VALUE, `computer_fraud_or_theft` = COMPUTER_FRAUD_OR_THEFT_VALUE, `promo_code` = PROMO_CODE_VALUE, `create_date` = CREATE_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertUser_Application`$$
CREATE PROCEDURE `insertUser_Application`(IN USER_ID_VALUE int(10) unsigned, IN LANGUAGES_VALUE text, IN SKILLS_VALUE text, IN STARTED_BUSINESS_VALUE tinyint(1) unsigned, IN WORK_HABIT_VALUE tinyint(1) unsigned, IN INTERESTS_VALUE text, IN SPECIAL_VALUE text, IN CONVICTED_FELON_VALUE tinyint(1) unsigned, IN COMPUTER_FRAUD_OR_THEFT_VALUE tinyint(1) unsigned, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Application` (`user_id`, `languages`, `skills`, `started_business`, `work_habit`, `interests`, `special`, `convicted_felon`, `computer_fraud_or_theft`, `create_date`) 
	VALUES (USER_ID_VALUE, LANGUAGES_VALUE, SKILLS_VALUE, STARTED_BUSINESS_VALUE, WORK_HABIT_VALUE, INTERESTS_VALUE, SPECIAL_VALUE, CONVICTED_FELON_VALUE, COMPUTER_FRAUD_OR_THEFT_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

