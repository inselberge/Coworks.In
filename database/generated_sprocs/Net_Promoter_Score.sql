DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateNet_Promoter_Score`$$
CREATE PROCEDURE `validateNet_Promoter_Score`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Net_Promoter_Score` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getNet_Promoter_Score`$$
CREATE PROCEDURE `getNet_Promoter_Score`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `coworking_space_id`, `quantitative_question`, `quantitative_max`, `qualitative_question`, `views`, `incompletes`, `completes`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Net_Promoter_Score` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateNet_Promoter_Score`$$
CREATE PROCEDURE `updateNet_Promoter_Score`(IN ID_VALUE int(10) unsigned, IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN QUANTITATIVE_QUESTION_VALUE text, IN QUANTITATIVE_MAX_VALUE tinyint(4), IN QUALITATIVE_QUESTION_VALUE text, IN VIEWS_VALUE int(10) unsigned, IN INCOMPLETES_VALUE int(10) unsigned, IN COMPLETES_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Net_Promoter_Score` 
	SET `coworking_space_id` = COWORKING_SPACE_ID_VALUE, `quantitative_question` = QUANTITATIVE_QUESTION_VALUE, `quantitative_max` = QUANTITATIVE_MAX_VALUE, `qualitative_question` = QUALITATIVE_QUESTION_VALUE, `views` = VIEWS_VALUE, `incompletes` = INCOMPLETES_VALUE, `completes` = COMPLETES_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Coworking_Space` WHERE `id` = COWORKING_SPACE_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertNet_Promoter_Score`$$
CREATE PROCEDURE `insertNet_Promoter_Score`(IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN QUANTITATIVE_QUESTION_VALUE text, IN QUANTITATIVE_MAX_VALUE tinyint(4), IN QUALITATIVE_QUESTION_VALUE text, IN VIEWS_VALUE int(10) unsigned, IN INCOMPLETES_VALUE int(10) unsigned, IN COMPLETES_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Net_Promoter_Score` (`coworking_space_id`, `quantitative_question`, `quantitative_max`, `qualitative_question`, `views`, `incompletes`, `completes`, `status`) 
	VALUES (COWORKING_SPACE_ID_VALUE, QUANTITATIVE_QUESTION_VALUE, QUANTITATIVE_MAX_VALUE, QUALITATIVE_QUESTION_VALUE, VIEWS_VALUE, INCOMPLETES_VALUE, COMPLETES_VALUE, STATUS_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

