DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateUser_Company`$$
CREATE PROCEDURE `validateUser_Company`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Company` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getUser_Company`$$
CREATE PROCEDURE `getUser_Company`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `company_id`, `user_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Company` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateUser_Company`$$
CREATE PROCEDURE `updateUser_Company`(IN ID_VALUE int(10) unsigned, IN COMPANY_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Company` 
	SET `company_id` = COMPANY_ID_VALUE, `user_id` = USER_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Company` WHERE `id` = COMPANY_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertUser_Company`$$
CREATE PROCEDURE `insertUser_Company`(IN COMPANY_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Company` (`company_id`, `user_id`, `status`, `create_date`) 
	VALUES (COMPANY_ID_VALUE, USER_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

