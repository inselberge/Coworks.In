DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateUser_Login`$$
CREATE PROCEDURE `validateUser_Login`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Login` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getUser_Login`$$
CREATE PROCEDURE `getUser_Login`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `user_id`, `ip`, `failure`, `login_time`, `logout_time`, `time_online`, `create_date` 
	FROM `User_Login` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateUser_Login`$$
CREATE PROCEDURE `updateUser_Login`(IN ID_VALUE bigint(20) unsigned, IN USER_ID_VALUE int(10) unsigned, IN IP_VALUE varchar(15), IN FAILURE_VALUE tinyint(1) unsigned, IN LOGIN_TIME_VALUE timestamp, IN LOGOUT_TIME_VALUE timestamp, IN TIME_ONLINE_VALUE time, IN CREATE_DATE_VALUE timestamp)
BEGIN
	UPDATE `User_Login` 
	SET `user_id` = USER_ID_VALUE, `ip` = IP_VALUE, `failure` = FAILURE_VALUE, `login_time` = LOGIN_TIME_VALUE, `logout_time` = LOGOUT_TIME_VALUE, `time_online` = TIME_ONLINE_VALUE, `create_date` = CREATE_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertUser_Login`$$
CREATE PROCEDURE `insertUser_Login`(IN USER_ID_VALUE int(10) unsigned, IN IP_VALUE varchar(15), IN FAILURE_VALUE tinyint(1) unsigned, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `User_Login` (`user_id`, `ip`, `failure`, `create_date`) 
	VALUES (USER_ID_VALUE, IP_VALUE, FAILURE_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

