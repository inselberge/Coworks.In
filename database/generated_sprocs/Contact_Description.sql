DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateContact_Description`$$
CREATE PROCEDURE `validateContact_Description`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Contact_Description` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getContact_Description`$$
CREATE PROCEDURE `getContact_Description`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `title`, `description`, `status`, `create_date`, `thread`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Contact_Description` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateContact_Description`$$
CREATE PROCEDURE `updateContact_Description`(IN ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN THREAD_VALUE int(10) unsigned, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Contact_Description` 
	SET `title` = TITLE_VALUE, `description` = DESCRIPTION_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `thread` = THREAD_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertContact_Description`$$
CREATE PROCEDURE `insertContact_Description`(IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Contact_Description` (`title`, `description`, `status`, `create_date`) 
	VALUES (TITLE_VALUE, DESCRIPTION_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

