DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateLink`$$
CREATE PROCEDURE `validateLink`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `Link` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getLink`$$
CREATE PROCEDURE `getLink`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `user_id`, `url`, `clicks`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Link` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateLink`$$
CREATE PROCEDURE `updateLink`(IN ID_VALUE bigint(20) unsigned, IN USER_ID_VALUE int(10) unsigned, IN URL_VALUE varchar(128), IN CLICKS_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Link` 
	SET `user_id` = USER_ID_VALUE, `url` = URL_VALUE, `clicks` = CLICKS_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertLink`$$
CREATE PROCEDURE `insertLink`(IN USER_ID_VALUE int(10) unsigned, IN URL_VALUE varchar(128), IN CLICKS_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `Link` (`user_id`, `url`, `clicks`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, URL_VALUE, CLICKS_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

