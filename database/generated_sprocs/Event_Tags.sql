DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateEvent_Tags`$$
CREATE PROCEDURE `validateEvent_Tags`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `Event_Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getEvent_Tags`$$
CREATE PROCEDURE `getEvent_Tags`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `event_id`, `tag_id`, `create_date` 
	FROM `Event_Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateEvent_Tags`$$
CREATE PROCEDURE `updateEvent_Tags`(IN ID_VALUE bigint(20) unsigned, IN EVENT_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp)
BEGIN
	UPDATE `Event_Tags` 
	SET `event_id` = EVENT_ID_VALUE, `tag_id` = TAG_ID_VALUE, `create_date` = CREATE_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Event` WHERE `id` = EVENT_ID_VALUE)
		 AND (SELECT 1 FROM `Tags` WHERE `id` = TAG_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertEvent_Tags`$$
CREATE PROCEDURE `insertEvent_Tags`(IN EVENT_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `Event_Tags` (`event_id`, `tag_id`, `create_date`) 
	VALUES (EVENT_ID_VALUE, TAG_ID_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

