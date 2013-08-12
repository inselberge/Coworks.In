DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateUser_Stripe`$$
CREATE PROCEDURE `validateUser_Stripe`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Stripe` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getUser_Stripe`$$
CREATE PROCEDURE `getUser_Stripe`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `stripe_token`, `last_checked`, `is_active`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Stripe` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateUser_Stripe`$$
CREATE PROCEDURE `updateUser_Stripe`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN STRIPE_TOKEN_VALUE varchar(64), IN LAST_CHECKED_VALUE timestamp, IN IS_ACTIVE_VALUE tinyint(1) unsigned, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Stripe` 
	SET `user_id` = USER_ID_VALUE, `stripe_token` = STRIPE_TOKEN_VALUE, `last_checked` = LAST_CHECKED_VALUE, `is_active` = IS_ACTIVE_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertUser_Stripe`$$
CREATE PROCEDURE `insertUser_Stripe`(IN USER_ID_VALUE int(10) unsigned, IN STRIPE_TOKEN_VALUE varchar(64), IN LAST_CHECKED_VALUE timestamp, IN IS_ACTIVE_VALUE tinyint(1) unsigned, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Stripe` (`user_id`, `stripe_token`, `last_checked`, `is_active`, `create_date`) 
	VALUES (USER_ID_VALUE, STRIPE_TOKEN_VALUE, LAST_CHECKED_VALUE, IS_ACTIVE_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

