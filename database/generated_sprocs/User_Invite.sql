DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateUser_Invite`$$
CREATE PROCEDURE `validateUser_Invite`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Invite` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getUser_Invite`$$
CREATE PROCEDURE `getUser_Invite`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `email`, `key`, `status`, `create_date`, `expire_date` 
	FROM `User_Invite` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateUser_Invite`$$
CREATE PROCEDURE `updateUser_Invite`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN EMAIL_VALUE varchar(128), IN KEY_VALUE varchar(64), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN EXPIRE_DATE_VALUE timestamp)
BEGIN
	UPDATE `User_Invite` 
	SET `user_id` = USER_ID_VALUE, `email` = EMAIL_VALUE, `key` = KEY_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `expire_date` = EXPIRE_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertUser_Invite`$$
CREATE PROCEDURE `insertUser_Invite`(IN USER_ID_VALUE int(10) unsigned, IN EMAIL_VALUE varchar(128), IN KEY_VALUE varchar(64), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN EXPIRE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Invite` (`user_id`, `email`, `key`, `status`, `create_date`, `expire_date`) 
	VALUES (USER_ID_VALUE, EMAIL_VALUE, KEY_VALUE, STATUS_VALUE, CREATE_DATE_VALUE, EXPIRE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

