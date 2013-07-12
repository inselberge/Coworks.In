DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateReferral`$$
CREATE PROCEDURE `validateReferral`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `Referral` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getReferral`$$
CREATE PROCEDURE `getReferral`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `user_id`, `event_id`, `key`, `clicks`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Referral` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateReferral`$$
CREATE PROCEDURE `updateReferral`(IN ID_VALUE bigint(20) unsigned, IN USER_ID_VALUE int(10) unsigned, IN EVENT_ID_VALUE int(10) unsigned, IN KEY_VALUE varchar(64), IN CLICKS_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Referral` 
	SET `user_id` = USER_ID_VALUE, `event_id` = EVENT_ID_VALUE, `key` = KEY_VALUE, `clicks` = CLICKS_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Event` WHERE `id` = EVENT_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertReferral`$$
CREATE PROCEDURE `insertReferral`(IN USER_ID_VALUE int(10) unsigned, IN EVENT_ID_VALUE int(10) unsigned, IN KEY_VALUE varchar(64), IN CLICKS_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `Referral` (`user_id`, `event_id`, `key`, `clicks`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, EVENT_ID_VALUE, KEY_VALUE, CLICKS_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

