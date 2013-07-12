DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateCoworking_Space_Billing_Plan`$$
CREATE PROCEDURE `validateCoworking_Space_Billing_Plan`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Coworking_Space_Billing_Plan` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getCoworking_Space_Billing_Plan`$$
CREATE PROCEDURE `getCoworking_Space_Billing_Plan`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `coworking_space_id`, `billing_plan_id`, `stripe_status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Coworking_Space_Billing_Plan` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateCoworking_Space_Billing_Plan`$$
CREATE PROCEDURE `updateCoworking_Space_Billing_Plan`(IN ID_VALUE int(10) unsigned, IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN BILLING_PLAN_ID_VALUE int(10) unsigned, IN STRIPE_STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Coworking_Space_Billing_Plan` 
	SET `coworking_space_id` = COWORKING_SPACE_ID_VALUE, `billing_plan_id` = BILLING_PLAN_ID_VALUE, `stripe_status` = STRIPE_STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Coworking_Space` WHERE `id` = COWORKING_SPACE_ID_VALUE)
		 AND (SELECT 1 FROM `Billing_Plan` WHERE `id` = BILLING_PLAN_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertCoworking_Space_Billing_Plan`$$
CREATE PROCEDURE `insertCoworking_Space_Billing_Plan`(IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN BILLING_PLAN_ID_VALUE int(10) unsigned, IN STRIPE_STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Coworking_Space_Billing_Plan` (`coworking_space_id`, `billing_plan_id`, `stripe_status`, `create_date`) 
	VALUES (COWORKING_SPACE_ID_VALUE, BILLING_PLAN_ID_VALUE, STRIPE_STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

