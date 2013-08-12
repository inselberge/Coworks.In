DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewJob`$$
CREATE VIEW `viewJob` AS SELECT `id`, `user_id`, `title`, `description`, `pay`, `compound`, `status`, `start_date`, `create_date` FROM `Job`$$
DELIMITER ;
