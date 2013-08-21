DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateUser_Net_Promoter_Score`$$
CREATE PROCEDURE `validateUser_Net_Promoter_Score`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Net_Promoter_Score` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getUser_Net_Promoter_Score`$$
CREATE PROCEDURE `getUser_Net_Promoter_Score`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `user_id`, `net_promoter_score_id`, `quantitative_score`, `qualitative_response`, `create_date` 
	FROM `User_Net_Promoter_Score` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateUser_Net_Promoter_Score`$$
CREATE PROCEDURE `updateUser_Net_Promoter_Score`(IN ID_VALUE bigint(20) unsigned, IN USER_ID_VALUE int(10) unsigned, IN NET_PROMOTER_SCORE_ID_VALUE int(10) unsigned, IN QUANTITATIVE_SCORE_VALUE tinyint(4), IN QUALITATIVE_RESPONSE_VALUE text, IN CREATE_DATE_VALUE timestamp)
BEGIN
	UPDATE `User_Net_Promoter_Score` 
	SET `user_id` = USER_ID_VALUE, `net_promoter_score_id` = NET_PROMOTER_SCORE_ID_VALUE, `quantitative_score` = QUANTITATIVE_SCORE_VALUE, `qualitative_response` = QUALITATIVE_RESPONSE_VALUE, `create_date` = CREATE_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Net_Promoter_Score` WHERE `id` = NET_PROMOTER_SCORE_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertUser_Net_Promoter_Score`$$
CREATE PROCEDURE `insertUser_Net_Promoter_Score`(IN USER_ID_VALUE int(10) unsigned, IN NET_PROMOTER_SCORE_ID_VALUE int(10) unsigned, IN QUANTITATIVE_SCORE_VALUE tinyint(4), IN QUALITATIVE_RESPONSE_VALUE text, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `User_Net_Promoter_Score` (`user_id`, `net_promoter_score_id`, `quantitative_score`, `qualitative_response`, `create_date`) 
	VALUES (USER_ID_VALUE, NET_PROMOTER_SCORE_ID_VALUE, QUANTITATIVE_SCORE_VALUE, QUALITATIVE_RESPONSE_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

