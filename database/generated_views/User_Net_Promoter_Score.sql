DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Net_Promoter_Score`$$
CREATE VIEW `viewUser_Net_Promoter_Score` AS SELECT `id`, `user_id`, `net_promoter_score_id`, `quantitative_score`, `qualitative_response`, `create_date` FROM `User_Net_Promoter_Score`$$
DELIMITER ;
