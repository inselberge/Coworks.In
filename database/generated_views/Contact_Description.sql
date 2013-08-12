DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewContact_Description`$$
CREATE VIEW `viewContact_Description` AS SELECT `id`, `title`, `description`, `status`, `create_date` FROM `Contact_Description`$$
DELIMITER ;
