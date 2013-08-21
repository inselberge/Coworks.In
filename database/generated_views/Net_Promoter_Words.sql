DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewNet_Promoter_Words`$$
CREATE VIEW `viewNet_Promoter_Words` AS SELECT `id`, `net_promoter_score_id`, `word`, `count` FROM `Net_Promoter_Words`$$
DELIMITER ;
