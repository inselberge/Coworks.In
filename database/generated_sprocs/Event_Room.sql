DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateEvent_Room`$$
CREATE PROCEDURE `validateEvent_Room`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Event_Room` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getEvent_Room`$$
CREATE PROCEDURE `getEvent_Room`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `event_id`, `conference_room_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Event_Room` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateEvent_Room`$$
CREATE PROCEDURE `updateEvent_Room`(IN ID_VALUE int(10) unsigned, IN EVENT_ID_VALUE int(10) unsigned, IN CONFERENCE_ROOM_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Event_Room` 
	SET `event_id` = EVENT_ID_VALUE, `conference_room_id` = CONFERENCE_ROOM_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Event` WHERE `id` = EVENT_ID_VALUE)
		 AND (SELECT 1 FROM `Conference_Room` WHERE `id` = CONFERENCE_ROOM_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertEvent_Room`$$
CREATE PROCEDURE `insertEvent_Room`(IN EVENT_ID_VALUE int(10) unsigned, IN CONFERENCE_ROOM_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Event_Room` (`event_id`, `conference_room_id`, `status`, `create_date`) 
	VALUES (EVENT_ID_VALUE, CONFERENCE_ROOM_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

