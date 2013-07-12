DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateUser_Time`$$
CREATE PROCEDURE `validateUser_Time`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Time` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getUser_Time`$$
CREATE PROCEDURE `getUser_Time`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `giving_user_id`, `taking_user_id`, `help_id`, `start_time`, `end_time`, `total_time` 
	FROM `User_Time` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateUser_Time`$$
CREATE PROCEDURE `updateUser_Time`(IN ID_VALUE int(10) unsigned, IN GIVING_USER_ID_VALUE int(10) unsigned, IN TAKING_USER_ID_VALUE int(10) unsigned, IN HELP_ID_VALUE int(10) unsigned, IN START_TIME_VALUE timestamp, IN END_TIME_VALUE timestamp, IN TOTAL_TIME_VALUE time)
BEGIN
	UPDATE `User_Time` 
	SET `giving_user_id` = GIVING_USER_ID_VALUE, `taking_user_id` = TAKING_USER_ID_VALUE, `help_id` = HELP_ID_VALUE, `start_time` = START_TIME_VALUE, `end_time` = END_TIME_VALUE, `total_time` = TOTAL_TIME_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = GIVING_USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = TAKING_USER_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertUser_Time`$$
CREATE PROCEDURE `insertUser_Time`(IN GIVING_USER_ID_VALUE int(10) unsigned, IN TAKING_USER_ID_VALUE int(10) unsigned, IN START_TIME_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Time` (`giving_user_id`, `taking_user_id`, `start_time`) 
	VALUES (GIVING_USER_ID_VALUE, TAKING_USER_ID_VALUE, START_TIME_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

