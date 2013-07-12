DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateQuestion_Tags`$$
CREATE PROCEDURE `validateQuestion_Tags`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Question_Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getQuestion_Tags`$$
CREATE PROCEDURE `getQuestion_Tags`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `question_id`, `tag_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Question_Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateQuestion_Tags`$$
CREATE PROCEDURE `updateQuestion_Tags`(IN ID_VALUE int(10) unsigned, IN QUESTION_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Question_Tags` 
	SET `question_id` = QUESTION_ID_VALUE, `tag_id` = TAG_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Question` WHERE `id` = QUESTION_ID_VALUE)
		 AND (SELECT 1 FROM `Tags` WHERE `id` = TAG_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertQuestion_Tags`$$
CREATE PROCEDURE `insertQuestion_Tags`(IN QUESTION_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Question_Tags` (`question_id`, `tag_id`, `status`, `create_date`) 
	VALUES (QUESTION_ID_VALUE, TAG_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

