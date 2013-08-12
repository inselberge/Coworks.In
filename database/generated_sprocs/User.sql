DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateUser`$$
CREATE PROCEDURE `validateUser`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getUser`$$
CREATE PROCEDURE `getUser`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `first_name`, `last_name`, `fullName`, `email`, `password`, `server_id`, `user_image_id`, `birthday`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateUser`$$
CREATE PROCEDURE `updateUser`(IN ID_VALUE int(10) unsigned, IN FIRST_NAME_VALUE varchar(64), IN LAST_NAME_VALUE varchar(64), IN FULLNAME_VALUE varchar(128), IN EMAIL_VALUE varchar(128), IN PASSWORD_VALUE varchar(128), IN SERVER_ID_VALUE varchar(128), IN USER_IMAGE_ID_VALUE bigint(20) unsigned, IN BIRTHDAY_VALUE date, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User` 
	SET `first_name` = FIRST_NAME_VALUE, `last_name` = LAST_NAME_VALUE, `fullName` = FULLNAME_VALUE, `email` = EMAIL_VALUE, `password` = PASSWORD_VALUE, `server_id` = SERVER_ID_VALUE, `user_image_id` = USER_IMAGE_ID_VALUE, `birthday` = BIRTHDAY_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertUser`$$
CREATE PROCEDURE `insertUser`(IN FIRST_NAME_VALUE varchar(64), IN LAST_NAME_VALUE varchar(64), IN FULLNAME_VALUE varchar(128), IN EMAIL_VALUE varchar(128), IN PASSWORD_VALUE varchar(128), IN BIRTHDAY_VALUE date, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User` (`first_name`, `last_name`, `fullName`, `email`, `password`, `birthday`, `status`, `create_date`) 
	VALUES (FIRST_NAME_VALUE, LAST_NAME_VALUE, FULLNAME_VALUE, EMAIL_VALUE, PASSWORD_VALUE, BIRTHDAY_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

