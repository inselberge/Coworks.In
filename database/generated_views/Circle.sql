DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewCircle`$$
CREATE VIEW `viewCircle` AS SELECT `id`, `user_id`, `title`, `description`, `status`, `create_date` FROM `Circle`$$
DELIMITER ;
