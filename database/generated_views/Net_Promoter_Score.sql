DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewNet_Promoter_Score`$$
CREATE VIEW `viewNet_Promoter_Score` AS SELECT `id`, `coworking_space_id`, `quantitative_question`, `quantitative_max`, `qualitative_question`, `views`, `incompletes`, `completes`, `status` FROM `Net_Promoter_Score`$$
DELIMITER ;
