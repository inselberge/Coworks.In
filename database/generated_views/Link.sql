DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewLink`$$
CREATE VIEW `viewLink` AS SELECT `id`, `user_id`, `url`, `clicks`, `status`, `create_date` FROM `Link`$$
DELIMITER ;
