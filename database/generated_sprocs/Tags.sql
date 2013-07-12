DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateTags`$$
CREATE PROCEDURE `validateTags`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getTags`$$
CREATE PROCEDURE `getTags`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `tag`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateTags`$$
CREATE PROCEDURE `updateTags`(IN ID_VALUE int(10) unsigned, IN TAG_VALUE varchar(64), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Tags` 
	SET `tag` = TAG_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertTags`$$
CREATE PROCEDURE `insertTags`(IN TAG_VALUE varchar(64), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Tags` (`tag`, `status`, `create_date`) 
	VALUES (TAG_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

