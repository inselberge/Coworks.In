DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateUser_Image`$$
CREATE PROCEDURE `validateUser_Image`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Image` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getUser_Image`$$
CREATE PROCEDURE `getUser_Image`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `user_id`, `image`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Image` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateUser_Image`$$
CREATE PROCEDURE `updateUser_Image`(IN ID_VALUE bigint(20) unsigned, IN USER_ID_VALUE int(10) unsigned, IN IMAGE_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Image` 
	SET `user_id` = USER_ID_VALUE, `image` = IMAGE_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertUser_Image`$$
CREATE PROCEDURE `insertUser_Image`(IN USER_ID_VALUE int(10) unsigned, IN IMAGE_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `User_Image` (`user_id`, `image`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, IMAGE_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

