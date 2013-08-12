DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewQuestion_Tags`$$
CREATE VIEW `viewQuestion_Tags` AS SELECT `id`, `question_id`, `tag_id`, `status`, `create_date` FROM `Question_Tags`$$
DELIMITER ;
