DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewEvent`$$
CREATE VIEW `viewEvent` AS SELECT `id`, `user_id`, `title`, `description`, `start_time`, `end_time`, `url`, `status`, `create_date` FROM `Event`$$
DELIMITER ;
