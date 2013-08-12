DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateHelp_Tags`$$
CREATE PROCEDURE `validateHelp_Tags`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `Help_Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getHelp_Tags`$$
CREATE PROCEDURE `getHelp_Tags`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `help_id`, `tag_id`, `create_date` 
	FROM `Help_Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateHelp_Tags`$$
CREATE PROCEDURE `updateHelp_Tags`(IN ID_VALUE bigint(20) unsigned, IN HELP_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp)
BEGIN
	UPDATE `Help_Tags` 
	SET `help_id` = HELP_ID_VALUE, `tag_id` = TAG_ID_VALUE, `create_date` = CREATE_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Help` WHERE `id` = HELP_ID_VALUE)
		 AND (SELECT 1 FROM `Tags` WHERE `id` = TAG_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertHelp_Tags`$$
CREATE PROCEDURE `insertHelp_Tags`(IN HELP_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `Help_Tags` (`help_id`, `tag_id`, `create_date`) 
	VALUES (HELP_ID_VALUE, TAG_ID_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

