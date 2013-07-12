DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateUser_Tags`$$
CREATE PROCEDURE `validateUser_Tags`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getUser_Tags`$$
CREATE PROCEDURE `getUser_Tags`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `user_id`, `tags_id`, `status`, `create_date`, `modify_date` 
	FROM `User_Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateUser_Tags`$$
CREATE PROCEDURE `updateUser_Tags`(IN ID_VALUE bigint(20) unsigned, IN USER_ID_VALUE int(10) unsigned, IN TAGS_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp)
BEGIN
	UPDATE `User_Tags` 
	SET `user_id` = USER_ID_VALUE, `tags_id` = TAGS_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Tags` WHERE `id` = TAGS_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertUser_Tags`$$
CREATE PROCEDURE `insertUser_Tags`(IN USER_ID_VALUE int(10) unsigned, IN TAGS_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `User_Tags` (`user_id`, `tags_id`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, TAGS_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

