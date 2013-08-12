DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateLocation`$$
CREATE PROCEDURE `validateLocation`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Location` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getLocation`$$
CREATE PROCEDURE `getLocation`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `coworking_space_id`, `address1`, `address2`, `city`, `state`, `zip`, `country`, `longitude`, `latitude`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Location` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateLocation`$$
CREATE PROCEDURE `updateLocation`(IN ID_VALUE int(10) unsigned, IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN ADDRESS1_VALUE varchar(128), IN ADDRESS2_VALUE varchar(128), IN CITY_VALUE varchar(128), IN STATE_VALUE char(2), IN ZIP_VALUE varchar(5), IN COUNTRY_VALUE varchar(128), IN LONGITUDE_VALUE float(16,14) unsigned zerofill, IN LATITUDE_VALUE float(16,14) unsigned zerofill, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Location` 
	SET `coworking_space_id` = COWORKING_SPACE_ID_VALUE, `address1` = ADDRESS1_VALUE, `address2` = ADDRESS2_VALUE, `city` = CITY_VALUE, `state` = STATE_VALUE, `zip` = ZIP_VALUE, `country` = COUNTRY_VALUE, `longitude` = LONGITUDE_VALUE, `latitude` = LATITUDE_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Coworking_Space` WHERE `id` = COWORKING_SPACE_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertLocation`$$
CREATE PROCEDURE `insertLocation`(IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN ADDRESS1_VALUE varchar(128), IN CITY_VALUE varchar(128), IN STATE_VALUE char(2), IN ZIP_VALUE varchar(5), IN COUNTRY_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Location` (`coworking_space_id`, `address1`, `city`, `state`, `zip`, `country`, `status`, `create_date`) 
	VALUES (COWORKING_SPACE_ID_VALUE, ADDRESS1_VALUE, CITY_VALUE, STATE_VALUE, ZIP_VALUE, COUNTRY_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

