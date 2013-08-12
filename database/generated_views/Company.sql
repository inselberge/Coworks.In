DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewCompany`$$
CREATE VIEW `viewCompany` AS SELECT `id`, `title`, `description`, `url`, `status`, `create_date` FROM `Company`$$
DELIMITER ;
