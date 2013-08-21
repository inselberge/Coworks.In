DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateEvent_Visibility`$$
CREATE PROCEDURE `validateEvent_Visibility`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Event_Visibility` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getEvent_Visibility`$$
CREATE PROCEDURE `getEvent_Visibility`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `event_id`, `thread`, `visibility`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Event_Visibility` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateEvent_Visibility`$$
CREATE PROCEDURE `updateEvent_Visibility`(IN ID_VALUE int(10) unsigned, IN EVENT_ID_VALUE int(10) unsigned, IN THREAD_VALUE int(10) unsigned, IN VISIBILITY_VALUE enum('public','protected','private','exclusive'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Event_Visibility` 
	SET `event_id` = EVENT_ID_VALUE, `thread` = THREAD_VALUE, `visibility` = VISIBILITY_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Event` WHERE `id` = EVENT_ID_VALUE)
		 AND (SELECT 1 FROM `Event` WHERE `id` = THREAD_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertEvent_Visibility`$$
CREATE PROCEDURE `insertEvent_Visibility`(IN EVENT_ID_VALUE int(10) unsigned, IN VISIBILITY_VALUE enum('public','protected','private','exclusive'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Event_Visibility` (`event_id`, `visibility`, `create_date`) 
	VALUES (EVENT_ID_VALUE, VISIBILITY_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

