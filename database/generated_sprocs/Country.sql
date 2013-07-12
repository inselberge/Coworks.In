DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateCountry`$$
CREATE PROCEDURE `validateCountry`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Country` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getCountry`$$
CREATE PROCEDURE `getCountry`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `name`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Country` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateCountry`$$
CREATE PROCEDURE `updateCountry`(IN ID_VALUE int(10) unsigned, IN NAME_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Country` 
	SET `name` = NAME_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertCountry`$$
CREATE PROCEDURE `insertCountry`(IN NAME_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Country` (`name`, `status`) 
	VALUES (NAME_VALUE, STATUS_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

