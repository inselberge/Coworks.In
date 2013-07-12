DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateEvent_Attendance`$$
CREATE PROCEDURE `validateEvent_Attendance`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Event_Attendance` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getEvent_Attendance`$$
CREATE PROCEDURE `getEvent_Attendance`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `event_id`, `user_id`, `attending`, `checked_in`, `create_date`, `modif_date`, `modify_user`, `modify_reason` 
	FROM `Event_Attendance` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateEvent_Attendance`$$
CREATE PROCEDURE `updateEvent_Attendance`(IN ID_VALUE int(10) unsigned, IN EVENT_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN ATTENDING_VALUE enum('yes','no','maybe','lead'), IN CHECKED_IN_VALUE tinyint(1) unsigned, IN CREATE_DATE_VALUE timestamp, IN MODIF_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Event_Attendance` 
	SET `event_id` = EVENT_ID_VALUE, `user_id` = USER_ID_VALUE, `attending` = ATTENDING_VALUE, `checked_in` = CHECKED_IN_VALUE, `create_date` = CREATE_DATE_VALUE, `modif_date` = MODIF_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Event` WHERE `id` = EVENT_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertEvent_Attendance`$$
CREATE PROCEDURE `insertEvent_Attendance`(IN EVENT_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN ATTENDING_VALUE enum('yes','no','maybe','lead'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Event_Attendance` (`event_id`, `user_id`, `attending`, `create_date`) 
	VALUES (EVENT_ID_VALUE, USER_ID_VALUE, ATTENDING_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

