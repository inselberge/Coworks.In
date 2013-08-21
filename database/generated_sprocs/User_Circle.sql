DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateUser_Circle`$$
CREATE PROCEDURE `validateUser_Circle`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Circle` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getUser_Circle`$$
CREATE PROCEDURE `getUser_Circle`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `circle_id`, `user_id`, `member_type`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Circle` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateUser_Circle`$$
CREATE PROCEDURE `updateUser_Circle`(IN ID_VALUE int(10) unsigned, IN CIRCLE_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN MEMBER_TYPE_VALUE enum('basic','manager','owner'), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Circle` 
	SET `circle_id` = CIRCLE_ID_VALUE, `user_id` = USER_ID_VALUE, `member_type` = MEMBER_TYPE_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Circle` WHERE `id` = CIRCLE_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertUser_Circle`$$
CREATE PROCEDURE `insertUser_Circle`(IN CIRCLE_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN MEMBER_TYPE_VALUE enum('basic','manager','owner'), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Circle` (`circle_id`, `user_id`, `member_type`, `status`, `create_date`) 
	VALUES (CIRCLE_ID_VALUE, USER_ID_VALUE, MEMBER_TYPE_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

