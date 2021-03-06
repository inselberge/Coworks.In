DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateCompany`$$
CREATE PROCEDURE `validateCompany`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Company` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getCompany`$$
CREATE PROCEDURE `getCompany`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `title`, `description`, `url`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Company` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateCompany`$$
CREATE PROCEDURE `updateCompany`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN URL_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Company` 
	SET `user_id` = USER_ID_VALUE, `title` = TITLE_VALUE, `description` = DESCRIPTION_VALUE, `url` = URL_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertCompany`$$
CREATE PROCEDURE `insertCompany`(IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN URL_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Company` (`user_id`, `title`, `description`, `url`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, TITLE_VALUE, DESCRIPTION_VALUE, URL_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

