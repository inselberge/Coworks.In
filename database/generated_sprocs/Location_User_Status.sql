DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateLocation_User_Status`$$
CREATE PROCEDURE `validateLocation_User_Status`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Location_User_Status` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getLocation_User_Status`$$
CREATE PROCEDURE `getLocation_User_Status`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `location_id`, `user_id`, `check_in`, `check_out`, `time_on_location`, `method` 
	FROM `Location_User_Status` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateLocation_User_Status`$$
CREATE PROCEDURE `updateLocation_User_Status`(IN ID_VALUE int(10) unsigned, IN LOCATION_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN CHECK_IN_VALUE timestamp, IN CHECK_OUT_VALUE timestamp, IN TIME_ON_LOCATION_VALUE time, IN METHOD_VALUE enum('key card','biometrics','login'))
BEGIN
	UPDATE `Location_User_Status` 
	SET `location_id` = LOCATION_ID_VALUE, `user_id` = USER_ID_VALUE, `check_in` = CHECK_IN_VALUE, `check_out` = CHECK_OUT_VALUE, `time_on_location` = TIME_ON_LOCATION_VALUE, `method` = METHOD_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Location` WHERE `id` = LOCATION_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertLocation_User_Status`$$
CREATE PROCEDURE `insertLocation_User_Status`(IN LOCATION_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN CHECK_IN_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Location_User_Status` (`location_id`, `user_id`, `check_in`) 
	VALUES (LOCATION_ID_VALUE, USER_ID_VALUE, CHECK_IN_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

