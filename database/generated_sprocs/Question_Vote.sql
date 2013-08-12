DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateQuestion_Vote`$$
CREATE PROCEDURE `validateQuestion_Vote`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Question_Vote` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getQuestion_Vote`$$
CREATE PROCEDURE `getQuestion_Vote`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `question_id`, `user_id`, `vote`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Question_Vote` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateQuestion_Vote`$$
CREATE PROCEDURE `updateQuestion_Vote`(IN ID_VALUE int(10) unsigned, IN QUESTION_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN VOTE_VALUE tinyint(3), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Question_Vote` 
	SET `question_id` = QUESTION_ID_VALUE, `user_id` = USER_ID_VALUE, `vote` = VOTE_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Question` WHERE `id` = QUESTION_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertQuestion_Vote`$$
CREATE PROCEDURE `insertQuestion_Vote`(IN QUESTION_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN VOTE_VALUE tinyint(3), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Question_Vote` (`question_id`, `user_id`, `vote`, `create_date`) 
	VALUES (QUESTION_ID_VALUE, USER_ID_VALUE, VOTE_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

