DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateUser_Token`$$
CREATE PROCEDURE `validateUser_Token`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Token` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getUser_Token`$$
CREATE PROCEDURE `getUser_Token`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `token_id`, `token`, `expires`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Token` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateUser_Token`$$
CREATE PROCEDURE `updateUser_Token`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN TOKEN_ID_VALUE int(10) unsigned, IN TOKEN_VALUE tinytext, IN EXPIRES_VALUE timestamp, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Token` 
	SET `user_id` = USER_ID_VALUE, `token_id` = TOKEN_ID_VALUE, `token` = TOKEN_VALUE, `expires` = EXPIRES_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Token` WHERE `id` = TOKEN_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertUser_Token`$$
CREATE PROCEDURE `insertUser_Token`(IN USER_ID_VALUE int(10) unsigned, IN TOKEN_ID_VALUE int(10) unsigned, IN TOKEN_VALUE tinytext, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Token` (`user_id`, `token_id`, `token`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, TOKEN_ID_VALUE, TOKEN_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

