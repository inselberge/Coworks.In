DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateUser_Contact`$$
CREATE PROCEDURE `validateUser_Contact`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Contact` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getUser_Contact`$$
CREATE PROCEDURE `getUser_Contact`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `contact_description_id`, `contact_value`, `status`, `thread`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Contact` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateUser_Contact`$$
CREATE PROCEDURE `updateUser_Contact`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN CONTACT_DESCRIPTION_ID_VALUE int(10) unsigned, IN CONTACT_VALUE_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN THREAD_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Contact` 
	SET `user_id` = USER_ID_VALUE, `contact_description_id` = CONTACT_DESCRIPTION_ID_VALUE, `contact_value` = CONTACT_VALUE_VALUE, `status` = STATUS_VALUE, `thread` = THREAD_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Contact_Description` WHERE `id` = CONTACT_DESCRIPTION_ID_VALUE)
		 AND (SELECT 1 FROM `User_Contact` WHERE `id` = THREAD_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertUser_Contact`$$
CREATE PROCEDURE `insertUser_Contact`(IN USER_ID_VALUE int(10) unsigned, IN CONTACT_DESCRIPTION_ID_VALUE int(10) unsigned, IN CONTACT_VALUE_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Contact` (`user_id`, `contact_description_id`, `contact_value`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, CONTACT_DESCRIPTION_ID_VALUE, CONTACT_VALUE_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

