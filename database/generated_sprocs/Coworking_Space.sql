DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateCoworking_Space`$$
CREATE PROCEDURE `validateCoworking_Space`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Coworking_Space` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getCoworking_Space`$$
CREATE PROCEDURE `getCoworking_Space`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `name`, `description`, `url`, `user_url_stub`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Coworking_Space` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateCoworking_Space`$$
CREATE PROCEDURE `updateCoworking_Space`(IN ID_VALUE int(10) unsigned, IN NAME_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN URL_VALUE varchar(128), IN USER_URL_STUB_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Coworking_Space` 
	SET `name` = NAME_VALUE, `description` = DESCRIPTION_VALUE, `url` = URL_VALUE, `user_url_stub` = USER_URL_STUB_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertCoworking_Space`$$
CREATE PROCEDURE `insertCoworking_Space`(IN NAME_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN URL_VALUE varchar(128), IN USER_URL_STUB_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Coworking_Space` (`name`, `description`, `url`, `user_url_stub`, `status`, `create_date`) 
	VALUES (NAME_VALUE, DESCRIPTION_VALUE, URL_VALUE, USER_URL_STUB_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

