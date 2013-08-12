DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewHelp`$$
CREATE VIEW `viewHelp` AS SELECT `id`, `user_id`, `title`, `description`, `estimated_time`, `status`, `create_date` FROM `Help`$$
DELIMITER ;
