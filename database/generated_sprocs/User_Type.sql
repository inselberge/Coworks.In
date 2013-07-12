DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateUser_Type`$$
CREATE PROCEDURE `validateUser_Type`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Type` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getUser_Type`$$
CREATE PROCEDURE `getUser_Type`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `type`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Type` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateUser_Type`$$
CREATE PROCEDURE `updateUser_Type`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN TYPE_VALUE enum('prospect','community','desk','mentor','operations_management','business_management','administrator'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Type` 
	SET `user_id` = USER_ID_VALUE, `type` = TYPE_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertUser_Type`$$
CREATE PROCEDURE `insertUser_Type`(IN USER_ID_VALUE int(10) unsigned, IN TYPE_VALUE enum('prospect','community','desk','mentor','operations_management','business_management','administrator'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Type` (`user_id`, `type`, `create_date`) 
	VALUES (USER_ID_VALUE, TYPE_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

