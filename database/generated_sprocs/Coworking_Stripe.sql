DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateCoworking_Stripe`$$
CREATE PROCEDURE `validateCoworking_Stripe`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Coworking_Stripe` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getCoworking_Stripe`$$
CREATE PROCEDURE `getCoworking_Stripe`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `coworking_id`, `live`, `type`, `key`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Coworking_Stripe` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateCoworking_Stripe`$$
CREATE PROCEDURE `updateCoworking_Stripe`(IN ID_VALUE int(10) unsigned, IN COWORKING_ID_VALUE int(10) unsigned, IN LIVE_VALUE enum('test','live'), IN TYPE_VALUE enum('public','private'), IN KEY_VALUE varchar(64), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Coworking_Stripe` 
	SET `coworking_id` = COWORKING_ID_VALUE, `live` = LIVE_VALUE, `type` = TYPE_VALUE, `key` = KEY_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Coworking_Space` WHERE `id` = COWORKING_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertCoworking_Stripe`$$
CREATE PROCEDURE `insertCoworking_Stripe`(IN COWORKING_ID_VALUE int(10) unsigned, IN LIVE_VALUE enum('test','live'), IN TYPE_VALUE enum('public','private'), IN KEY_VALUE varchar(64), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Coworking_Stripe` (`coworking_id`, `live`, `type`, `key`, `status`, `create_date`) 
	VALUES (COWORKING_ID_VALUE, LIVE_VALUE, TYPE_VALUE, KEY_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

