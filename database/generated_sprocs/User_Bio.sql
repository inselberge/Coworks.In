DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateUser_Bio`$$
CREATE PROCEDURE `validateUser_Bio`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Bio` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getUser_Bio`$$
CREATE PROCEDURE `getUser_Bio`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `description`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Bio` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateUser_Bio`$$
CREATE PROCEDURE `updateUser_Bio`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN DESCRIPTION_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Bio` 
	SET `user_id` = USER_ID_VALUE, `description` = DESCRIPTION_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertUser_Bio`$$
CREATE PROCEDURE `insertUser_Bio`(IN USER_ID_VALUE int(10) unsigned, IN DESCRIPTION_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Bio` (`user_id`, `description`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, DESCRIPTION_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

