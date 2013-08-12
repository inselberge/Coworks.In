DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateCompany_Tags`$$
CREATE PROCEDURE `validateCompany_Tags`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Company_Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getCompany_Tags`$$
CREATE PROCEDURE `getCompany_Tags`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `company_id`, `tag_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Company_Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateCompany_Tags`$$
CREATE PROCEDURE `updateCompany_Tags`(IN ID_VALUE int(10) unsigned, IN COMPANY_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Company_Tags` 
	SET `company_id` = COMPANY_ID_VALUE, `tag_id` = TAG_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Company` WHERE `id` = COMPANY_ID_VALUE)
		 AND (SELECT 1 FROM `Tags` WHERE `id` = TAG_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertCompany_Tags`$$
CREATE PROCEDURE `insertCompany_Tags`(IN COMPANY_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Company_Tags` (`company_id`, `tag_id`, `status`, `create_date`) 
	VALUES (COMPANY_ID_VALUE, TAG_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

