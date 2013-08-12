DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateGeo_Names`$$
CREATE PROCEDURE `validateGeo_Names`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Geo_Names` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getGeo_Names`$$
CREATE PROCEDURE `getGeo_Names`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `country code`, `postal_code`, `place_name`, `state_name`, `state_code`, `county_name`, `county_code`, `community_name`, `community_code`, `latitude`, `longitude`, `accuracy`, `status`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Geo_Names` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateGeo_Names`$$
CREATE PROCEDURE `updateGeo_Names`(IN ID_VALUE int(10) unsigned, IN COUNTRY CODE_VALUE char(2), IN POSTAL_CODE_VALUE varchar(20), IN PLACE_NAME_VALUE varchar(180), IN STATE_NAME_VALUE varchar(100), IN STATE_CODE_VALUE varchar(20), IN COUNTY_NAME_VALUE varchar(100), IN COUNTY_CODE_VALUE varchar(20), IN COMMUNITY_NAME_VALUE varchar(100), IN COMMUNITY_CODE_VALUE varchar(20), IN LATITUDE_VALUE float(6,4), IN LONGITUDE_VALUE float(6,4), IN ACCURACY_VALUE tinyint(3) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(100))
BEGIN
	UPDATE `Geo_Names` 
	SET `country code` = COUNTRY CODE_VALUE, `postal_code` = POSTAL_CODE_VALUE, `place_name` = PLACE_NAME_VALUE, `state_name` = STATE_NAME_VALUE, `state_code` = STATE_CODE_VALUE, `county_name` = COUNTY_NAME_VALUE, `county_code` = COUNTY_CODE_VALUE, `community_name` = COMMUNITY_NAME_VALUE, `community_code` = COMMUNITY_CODE_VALUE, `latitude` = LATITUDE_VALUE, `longitude` = LONGITUDE_VALUE, `accuracy` = ACCURACY_VALUE, `status` = STATUS_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertGeo_Names`$$
CREATE PROCEDURE `insertGeo_Names`(IN COUNTRY CODE_VALUE char(2), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Geo_Names` (`country code`, `status`) 
	VALUES (COUNTRY CODE_VALUE, STATUS_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

