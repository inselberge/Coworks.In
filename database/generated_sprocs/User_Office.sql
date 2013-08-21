DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateUser_Office`$$
CREATE PROCEDURE `validateUser_Office`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Office` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getUser_Office`$$
CREATE PROCEDURE `getUser_Office`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `office_id`, `status`, `create_date`, `modify_date`, `modfiy_user`, `modify_reason` 
	FROM `User_Office` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateUser_Office`$$
CREATE PROCEDURE `updateUser_Office`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN OFFICE_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODFIY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Office` 
	SET `user_id` = USER_ID_VALUE, `office_id` = OFFICE_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modfiy_user` = MODFIY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Office` WHERE `id` = OFFICE_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODFIY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertUser_Office`$$
CREATE PROCEDURE `insertUser_Office`(IN USER_ID_VALUE int(10) unsigned, IN OFFICE_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Office` (`user_id`, `office_id`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, OFFICE_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

