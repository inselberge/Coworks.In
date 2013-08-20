DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateSession`$$
CREATE PROCEDURE `validateSession`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `Session` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getSession`$$
CREATE PROCEDURE `getSession`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `coworking_space_id`, `session_id`, `ip`, `page_views`, `is_member`, `user_id`, `create_date`, `modify_date` 
	FROM `Session` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateSession`$$
CREATE PROCEDURE `updateSession`(IN ID_VALUE bigint(20) unsigned, IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN SESSION_ID_VALUE varchar(128), IN IP_VALUE varchar(15), IN PAGE_VIEWS_VALUE int(10) unsigned, IN IS_MEMBER_VALUE tinyint(1) unsigned, IN USER_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp)
BEGIN
	UPDATE `Session` 
	SET `coworking_space_id` = COWORKING_SPACE_ID_VALUE, `session_id` = SESSION_ID_VALUE, `ip` = IP_VALUE, `page_views` = PAGE_VIEWS_VALUE, `is_member` = IS_MEMBER_VALUE, `user_id` = USER_ID_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertSession`$$
CREATE PROCEDURE `insertSession`(IN SESSION_ID_VALUE varchar(128), IN IP_VALUE varchar(15), IN PAGE_VIEWS_VALUE int(10) unsigned, IN IS_MEMBER_VALUE tinyint(1) unsigned, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `Session` (`session_id`, `ip`, `page_views`, `is_member`, `create_date`) 
	VALUES (SESSION_ID_VALUE, IP_VALUE, PAGE_VIEWS_VALUE, IS_MEMBER_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

