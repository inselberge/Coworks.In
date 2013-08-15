DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateNet_Promoter_Words`$$
CREATE PROCEDURE `validateNet_Promoter_Words`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Net_Promoter_Words` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getNet_Promoter_Words`$$
CREATE PROCEDURE `getNet_Promoter_Words`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `net_promoter_score_id`, `word`, `count` 
	FROM `Net_Promoter_Words` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateNet_Promoter_Words`$$
CREATE PROCEDURE `updateNet_Promoter_Words`(IN ID_VALUE int(10) unsigned, IN NET_PROMOTER_SCORE_ID_VALUE int(10) unsigned, IN WORD_VALUE varchar(128), IN COUNT_VALUE int(10) unsigned)
BEGIN
	UPDATE `Net_Promoter_Words` 
	SET `net_promoter_score_id` = NET_PROMOTER_SCORE_ID_VALUE, `word` = WORD_VALUE, `count` = COUNT_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Net_Promoter_Score` WHERE `id` = NET_PROMOTER_SCORE_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertNet_Promoter_Words`$$
CREATE PROCEDURE `insertNet_Promoter_Words`(IN NET_PROMOTER_SCORE_ID_VALUE int(10) unsigned, IN WORD_VALUE varchar(128), IN COUNT_VALUE int(10) unsigned, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Net_Promoter_Words` (`net_promoter_score_id`, `word`, `count`) 
	VALUES (NET_PROMOTER_SCORE_ID_VALUE, WORD_VALUE, COUNT_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

