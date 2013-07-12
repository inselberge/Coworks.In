DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateConference_Room`$$
CREATE PROCEDURE `validateConference_Room`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Conference_Room` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getConference_Room`$$
CREATE PROCEDURE `getConference_Room`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `location_id`, `name`, `floor`, `max_capacity`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Conference_Room` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateConference_Room`$$
CREATE PROCEDURE `updateConference_Room`(IN ID_VALUE int(10) unsigned, IN LOCATION_ID_VALUE int(10) unsigned, IN NAME_VALUE varchar(128), IN FLOOR_VALUE tinyint(3), IN MAX_CAPACITY_VALUE tinyint(3), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Conference_Room` 
	SET `location_id` = LOCATION_ID_VALUE, `name` = NAME_VALUE, `floor` = FLOOR_VALUE, `max_capacity` = MAX_CAPACITY_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Location` WHERE `id` = LOCATION_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertConference_Room`$$
CREATE PROCEDURE `insertConference_Room`(IN LOCATION_ID_VALUE int(10) unsigned, IN NAME_VALUE varchar(128), IN FLOOR_VALUE tinyint(3), IN MAX_CAPACITY_VALUE tinyint(3), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Conference_Room` (`location_id`, `name`, `floor`, `max_capacity`, `status`, `create_date`) 
	VALUES (LOCATION_ID_VALUE, NAME_VALUE, FLOOR_VALUE, MAX_CAPACITY_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

