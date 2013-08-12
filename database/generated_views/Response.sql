DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewResponse`$$
CREATE VIEW `viewResponse` AS SELECT `id`, `question_id`, `user_id`, `title`, `response`, `status`, `create_date` FROM `Response`$$
DELIMITER ;
