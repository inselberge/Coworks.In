DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateJob`$$
CREATE PROCEDURE `validateJob`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Job` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getJob`$$
CREATE PROCEDURE `getJob`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `title`, `description`, `pay`, `compound`, `status`, `start_date`, `end_date`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Job` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateJob`$$
CREATE PROCEDURE `updateJob`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN PAY_VALUE float(8,2) unsigned, IN COMPOUND_VALUE enum('hour','day','week','month','year','flat'), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN START_DATE_VALUE timestamp, IN END_DATE_VALUE timestamp, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Job` 
	SET `user_id` = USER_ID_VALUE, `title` = TITLE_VALUE, `description` = DESCRIPTION_VALUE, `pay` = PAY_VALUE, `compound` = COMPOUND_VALUE, `status` = STATUS_VALUE, `start_date` = START_DATE_VALUE, `end_date` = END_DATE_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertJob`$$
CREATE PROCEDURE `insertJob`(IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN PAY_VALUE float(8,2) unsigned, IN COMPOUND_VALUE enum('hour','day','week','month','year','flat'), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN START_DATE_VALUE timestamp, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Job` (`user_id`, `title`, `description`, `pay`, `compound`, `status`, `start_date`, `create_date`) 
	VALUES (USER_ID_VALUE, TITLE_VALUE, DESCRIPTION_VALUE, PAY_VALUE, COMPOUND_VALUE, STATUS_VALUE, START_DATE_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

