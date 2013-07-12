DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateResponse`$$
CREATE PROCEDURE `validateResponse`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Response` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getResponse`$$
CREATE PROCEDURE `getResponse`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `question_id`, `user_id`, `title`, `response`, `status`, `thread`, `flag`, `last_flagged`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Response` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateResponse`$$
CREATE PROCEDURE `updateResponse`(IN ID_VALUE int(10) unsigned, IN QUESTION_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN RESPONSE_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN THREAD_VALUE int(10) unsigned, IN FLAG_VALUE tinyint(3) unsigned, IN LAST_FLAGGED_VALUE timestamp, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Response` 
	SET `question_id` = QUESTION_ID_VALUE, `user_id` = USER_ID_VALUE, `title` = TITLE_VALUE, `response` = RESPONSE_VALUE, `status` = STATUS_VALUE, `thread` = THREAD_VALUE, `flag` = FLAG_VALUE, `last_flagged` = LAST_FLAGGED_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Question` WHERE `id` = QUESTION_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Response` WHERE `id` = THREAD_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertResponse`$$
CREATE PROCEDURE `insertResponse`(IN QUESTION_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN RESPONSE_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Response` (`question_id`, `user_id`, `title`, `response`, `status`, `create_date`) 
	VALUES (QUESTION_ID_VALUE, USER_ID_VALUE, TITLE_VALUE, RESPONSE_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

