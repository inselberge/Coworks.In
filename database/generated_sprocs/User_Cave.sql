DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateUser_Cave`$$
CREATE PROCEDURE `validateUser_Cave`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Cave` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getUser_Cave`$$
CREATE PROCEDURE `getUser_Cave`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `flag_count`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Cave` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateUser_Cave`$$
CREATE PROCEDURE `updateUser_Cave`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN FLAG_COUNT_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Cave` 
	SET `user_id` = USER_ID_VALUE, `flag_count` = FLAG_COUNT_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertUser_Cave`$$
CREATE PROCEDURE `insertUser_Cave`(IN USER_ID_VALUE int(10) unsigned, IN FLAG_COUNT_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Cave` (`user_id`, `flag_count`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, FLAG_COUNT_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

