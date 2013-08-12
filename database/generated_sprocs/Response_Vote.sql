DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateResponse_Vote`$$
CREATE PROCEDURE `validateResponse_Vote`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Response_Vote` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getResponse_Vote`$$
CREATE PROCEDURE `getResponse_Vote`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `response_id`, `user_id`, `vote`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Response_Vote` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateResponse_Vote`$$
CREATE PROCEDURE `updateResponse_Vote`(IN ID_VALUE int(10) unsigned, IN RESPONSE_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN VOTE_VALUE tinyint(3), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Response_Vote` 
	SET `response_id` = RESPONSE_ID_VALUE, `user_id` = USER_ID_VALUE, `vote` = VOTE_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Response` WHERE `id` = RESPONSE_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertResponse_Vote`$$
CREATE PROCEDURE `insertResponse_Vote`(IN RESPONSE_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN VOTE_VALUE tinyint(3), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Response_Vote` (`response_id`, `user_id`, `vote`, `create_date`) 
	VALUES (RESPONSE_ID_VALUE, USER_ID_VALUE, VOTE_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

