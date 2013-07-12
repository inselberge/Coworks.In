DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateQuestion`$$
CREATE PROCEDURE `validateQuestion`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Question` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getQuestion`$$
CREATE PROCEDURE `getQuestion`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `title`, `description`, `status`, `thread`, `answer_id`, `views`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Question` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateQuestion`$$
CREATE PROCEDURE `updateQuestion`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN THREAD_VALUE int(10) unsigned, IN ANSWER_ID_VALUE int(10) unsigned, IN VIEWS_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Question` 
	SET `user_id` = USER_ID_VALUE, `title` = TITLE_VALUE, `description` = DESCRIPTION_VALUE, `status` = STATUS_VALUE, `thread` = THREAD_VALUE, `answer_id` = ANSWER_ID_VALUE, `views` = VIEWS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Question` WHERE `id` = THREAD_VALUE)
		 AND (SELECT 1 FROM `Response` WHERE `id` = ANSWER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertQuestion`$$
CREATE PROCEDURE `insertQuestion`(IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Question` (`user_id`, `title`, `description`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, TITLE_VALUE, DESCRIPTION_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

