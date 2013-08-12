DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewQuestion`$$
CREATE VIEW `viewQuestion` AS SELECT `id`, `user_id`, `title`, `description`, `status`, `create_date` FROM `Question`$$
DELIMITER ;
