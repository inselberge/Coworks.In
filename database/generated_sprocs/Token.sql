DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateToken`$$
CREATE PROCEDURE `validateToken`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Token` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getToken`$$
CREATE PROCEDURE `getToken`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `title`, `expire_length`, `authenticate_url`, `validate_url`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Token` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateToken`$$
CREATE PROCEDURE `updateToken`(IN ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN EXPIRE_LENGTH_VALUE int(10) unsigned, IN AUTHENTICATE_URL_VALUE tinytext, IN VALIDATE_URL_VALUE tinytext, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Token` 
	SET `title` = TITLE_VALUE, `expire_length` = EXPIRE_LENGTH_VALUE, `authenticate_url` = AUTHENTICATE_URL_VALUE, `validate_url` = VALIDATE_URL_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertToken`$$
CREATE PROCEDURE `insertToken`(IN TITLE_VALUE varchar(128), IN EXPIRE_LENGTH_VALUE int(10) unsigned, IN AUTHENTICATE_URL_VALUE tinytext, IN VALIDATE_URL_VALUE tinytext, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Token` (`title`, `expire_length`, `authenticate_url`, `validate_url`, `status`, `create_date`) 
	VALUES (TITLE_VALUE, EXPIRE_LENGTH_VALUE, AUTHENTICATE_URL_VALUE, VALIDATE_URL_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

