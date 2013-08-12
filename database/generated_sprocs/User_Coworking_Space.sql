DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateUser_Coworking_Space`$$
CREATE PROCEDURE `validateUser_Coworking_Space`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Coworking_Space` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getUser_Coworking_Space`$$
CREATE PROCEDURE `getUser_Coworking_Space`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `coworking_space_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Coworking_Space` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateUser_Coworking_Space`$$
CREATE PROCEDURE `updateUser_Coworking_Space`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Coworking_Space` 
	SET `user_id` = USER_ID_VALUE, `coworking_space_id` = COWORKING_SPACE_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Coworking_Space` WHERE `id` = COWORKING_SPACE_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertUser_Coworking_Space`$$
CREATE PROCEDURE `insertUser_Coworking_Space`(IN USER_ID_VALUE int(10) unsigned, IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Coworking_Space` (`user_id`, `coworking_space_id`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, COWORKING_SPACE_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

