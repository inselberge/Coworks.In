DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateUser_Address`$$
CREATE PROCEDURE `validateUser_Address`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Address` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getUser_Address`$$
CREATE PROCEDURE `getUser_Address`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `address`, `address2`, `city`, `state`, `zip`, `longitude`, `latitude`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Address` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateUser_Address`$$
CREATE PROCEDURE `updateUser_Address`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN ADDRESS_VALUE varchar(128), IN ADDRESS2_VALUE varchar(128), IN CITY_VALUE varchar(128), IN STATE_VALUE char(2), IN ZIP_VALUE varchar(5), IN LONGITUDE_VALUE float(16,14), IN LATITUDE_VALUE float(16,14), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Address` 
	SET `user_id` = USER_ID_VALUE, `address` = ADDRESS_VALUE, `address2` = ADDRESS2_VALUE, `city` = CITY_VALUE, `state` = STATE_VALUE, `zip` = ZIP_VALUE, `longitude` = LONGITUDE_VALUE, `latitude` = LATITUDE_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertUser_Address`$$
CREATE PROCEDURE `insertUser_Address`(IN USER_ID_VALUE int(10) unsigned, IN ADDRESS_VALUE varchar(128), IN CITY_VALUE varchar(128), IN STATE_VALUE char(2), IN ZIP_VALUE varchar(5), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Address` (`user_id`, `address`, `city`, `state`, `zip`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, ADDRESS_VALUE, CITY_VALUE, STATE_VALUE, ZIP_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

