DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewQuestion_Vote`$$
CREATE VIEW `viewQuestion_Vote` AS SELECT `id`, `question_id`, `user_id`, `vote`, `create_date` FROM `Question_Vote`$$
DELIMITER ;
