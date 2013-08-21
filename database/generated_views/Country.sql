DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewCountry`$$
CREATE VIEW `viewCountry` AS SELECT `id`, `name`, `status` FROM `Country`$$
DELIMITER ;
