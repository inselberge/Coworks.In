DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateMentor_Meeting`$$
CREATE PROCEDURE `validateMentor_Meeting`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Mentor_Meeting` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getMentor_Meeting`$$
CREATE PROCEDURE `getMentor_Meeting`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `mentor_availability_id`, `user_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Mentor_Meeting` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateMentor_Meeting`$$
CREATE PROCEDURE `updateMentor_Meeting`(IN ID_VALUE int(10) unsigned, IN MENTOR_AVAILABILITY_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Mentor_Meeting` 
	SET `mentor_availability_id` = MENTOR_AVAILABILITY_ID_VALUE, `user_id` = USER_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Mentor_Availability` WHERE `id` = MENTOR_AVAILABILITY_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertMentor_Meeting`$$
CREATE PROCEDURE `insertMentor_Meeting`(IN MENTOR_AVAILABILITY_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Mentor_Meeting` (`mentor_availability_id`, `user_id`, `status`, `create_date`) 
	VALUES (MENTOR_AVAILABILITY_ID_VALUE, USER_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

