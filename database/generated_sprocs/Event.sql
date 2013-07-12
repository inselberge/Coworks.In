DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateEvent`$$
CREATE PROCEDURE `validateEvent`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Event` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getEvent`$$
CREATE PROCEDURE `getEvent`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `title`, `description`, `start_time`, `end_time`, `url`, `status`, `create_date`, `thread`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Event` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateEvent`$$
CREATE PROCEDURE `updateEvent`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN START_TIME_VALUE timestamp, IN END_TIME_VALUE timestamp, IN URL_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN THREAD_VALUE int(10) unsigned, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Event` 
	SET `user_id` = USER_ID_VALUE, `title` = TITLE_VALUE, `description` = DESCRIPTION_VALUE, `start_time` = START_TIME_VALUE, `end_time` = END_TIME_VALUE, `url` = URL_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `thread` = THREAD_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Event` WHERE `id` = THREAD_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertEvent`$$
CREATE PROCEDURE `insertEvent`(IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN START_TIME_VALUE timestamp, IN END_TIME_VALUE timestamp, IN URL_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Event` (`user_id`, `title`, `description`, `start_time`, `end_time`, `url`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, TITLE_VALUE, DESCRIPTION_VALUE, START_TIME_VALUE, END_TIME_VALUE, URL_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

