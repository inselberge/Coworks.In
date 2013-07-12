DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateCompany_Location`$$
CREATE PROCEDURE `validateCompany_Location`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Company_Location` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getCompany_Location`$$
CREATE PROCEDURE `getCompany_Location`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `company_id`, `location_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Company_Location` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateCompany_Location`$$
CREATE PROCEDURE `updateCompany_Location`(IN ID_VALUE int(10) unsigned, IN COMPANY_ID_VALUE int(10) unsigned, IN LOCATION_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Company_Location` 
	SET `company_id` = COMPANY_ID_VALUE, `location_id` = LOCATION_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Company` WHERE `id` = COMPANY_ID_VALUE)
		 AND (SELECT 1 FROM `Location` WHERE `id` = LOCATION_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertCompany_Location`$$
CREATE PROCEDURE `insertCompany_Location`(IN COMPANY_ID_VALUE int(10) unsigned, IN LOCATION_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Company_Location` (`company_id`, `location_id`, `status`, `create_date`) 
	VALUES (COMPANY_ID_VALUE, LOCATION_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

