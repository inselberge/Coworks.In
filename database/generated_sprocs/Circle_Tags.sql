DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateCircle_Tags`$$
CREATE PROCEDURE `validateCircle_Tags`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Circle_Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getCircle_Tags`$$
CREATE PROCEDURE `getCircle_Tags`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `circle_id`, `tag_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Circle_Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateCircle_Tags`$$
CREATE PROCEDURE `updateCircle_Tags`(IN ID_VALUE int(10) unsigned, IN CIRCLE_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Circle_Tags` 
	SET `circle_id` = CIRCLE_ID_VALUE, `tag_id` = TAG_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Circle` WHERE `id` = CIRCLE_ID_VALUE)
		 AND (SELECT 1 FROM `Tags` WHERE `id` = TAG_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertCircle_Tags`$$
CREATE PROCEDURE `insertCircle_Tags`(IN CIRCLE_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Circle_Tags` (`circle_id`, `tag_id`, `status`, `create_date`) 
	VALUES (CIRCLE_ID_VALUE, TAG_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

