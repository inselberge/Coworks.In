DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateMentor_Availability`$$
CREATE PROCEDURE `validateMentor_Availability`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Mentor_Availability` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getMentor_Availability`$$
CREATE PROCEDURE `getMentor_Availability`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `start_time`, `end_time`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Mentor_Availability` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateMentor_Availability`$$
CREATE PROCEDURE `updateMentor_Availability`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN START_TIME_VALUE timestamp, IN END_TIME_VALUE timestamp, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Mentor_Availability` 
	SET `user_id` = USER_ID_VALUE, `start_time` = START_TIME_VALUE, `end_time` = END_TIME_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertMentor_Availability`$$
CREATE PROCEDURE `insertMentor_Availability`(IN USER_ID_VALUE int(10) unsigned, IN START_TIME_VALUE timestamp, IN END_TIME_VALUE timestamp, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Mentor_Availability` (`user_id`, `start_time`, `end_time`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, START_TIME_VALUE, END_TIME_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

