DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateOffice`$$
CREATE PROCEDURE `validateOffice`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Office` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getOffice`$$
CREATE PROCEDURE `getOffice`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `location_id`, `name`, `floor`, `max_capacity`, `current_capacity`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Office` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateOffice`$$
CREATE PROCEDURE `updateOffice`(IN ID_VALUE int(10) unsigned, IN LOCATION_ID_VALUE int(10) unsigned, IN NAME_VALUE varchar(128), IN FLOOR_VALUE tinyint(3), IN MAX_CAPACITY_VALUE tinyint(3) unsigned, IN CURRENT_CAPACITY_VALUE tinyint(3) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Office` 
	SET `location_id` = LOCATION_ID_VALUE, `name` = NAME_VALUE, `floor` = FLOOR_VALUE, `max_capacity` = MAX_CAPACITY_VALUE, `current_capacity` = CURRENT_CAPACITY_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Location` WHERE `id` = LOCATION_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertOffice`$$
CREATE PROCEDURE `insertOffice`(IN LOCATION_ID_VALUE int(10) unsigned, IN NAME_VALUE varchar(128), IN FLOOR_VALUE tinyint(3), IN MAX_CAPACITY_VALUE tinyint(3) unsigned, IN CURRENT_CAPACITY_VALUE tinyint(3) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Office` (`location_id`, `name`, `floor`, `max_capacity`, `current_capacity`, `status`, `create_date`) 
	VALUES (LOCATION_ID_VALUE, NAME_VALUE, FLOOR_VALUE, MAX_CAPACITY_VALUE, CURRENT_CAPACITY_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

