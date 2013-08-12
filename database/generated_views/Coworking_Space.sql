DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewCoworking_Space`$$
CREATE VIEW `viewCoworking_Space` AS SELECT `id`, `name`, `description`, `url`, `user_url_stub`, `status`, `create_date` FROM `Coworking_Space`$$
DELIMITER ;
