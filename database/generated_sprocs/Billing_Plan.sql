DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateBilling_Plan`$$
CREATE PROCEDURE `validateBilling_Plan`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Billing_Plan` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getBilling_Plan`$$
CREATE PROCEDURE `getBilling_Plan`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `title`, `description`, `price`, `compounds`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Billing_Plan` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateBilling_Plan`$$
CREATE PROCEDURE `updateBilling_Plan`(IN ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN PRICE_VALUE float(8,2) unsigned, IN COMPOUNDS_VALUE smallint(5) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Billing_Plan` 
	SET `title` = TITLE_VALUE, `description` = DESCRIPTION_VALUE, `price` = PRICE_VALUE, `compounds` = COMPOUNDS_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertBilling_Plan`$$
CREATE PROCEDURE `insertBilling_Plan`(IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN PRICE_VALUE float(8,2) unsigned, IN COMPOUNDS_VALUE smallint(5) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Billing_Plan` (`title`, `description`, `price`, `compounds`, `status`, `create_date`) 
	VALUES (TITLE_VALUE, DESCRIPTION_VALUE, PRICE_VALUE, COMPOUNDS_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

