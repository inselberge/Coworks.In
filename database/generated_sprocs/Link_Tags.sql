DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateLink_Tags`$$
CREATE PROCEDURE `validateLink_Tags`(IN ID_VALUE int(20) unsigned)
BEGIN
	SELECT 1 
	FROM `Link_Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getLink_Tags`$$
CREATE PROCEDURE `getLink_Tags`(IN ID_VALUE int(20) unsigned)
BEGIN
	SELECT `id`, `link_id`, `tag_id`, `create_date` 
	FROM `Link_Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateLink_Tags`$$
CREATE PROCEDURE `updateLink_Tags`(IN ID_VALUE int(20) unsigned, IN LINK_ID_VALUE bigint(20) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp)
BEGIN
	UPDATE `Link_Tags` 
	SET `link_id` = LINK_ID_VALUE, `tag_id` = TAG_ID_VALUE, `create_date` = CREATE_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Link` WHERE `id` = LINK_ID_VALUE)
		 AND (SELECT 1 FROM `Tags` WHERE `id` = TAG_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertLink_Tags`$$
CREATE PROCEDURE `insertLink_Tags`(IN LINK_ID_VALUE bigint(20) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(20) unsigned)
BEGIN
	INSERT INTO `Link_Tags` (`link_id`, `tag_id`, `create_date`) 
	VALUES (LINK_ID_VALUE, TAG_ID_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

