DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewGeo_Names`$$
CREATE VIEW `viewGeo_Names` AS SELECT `id`, `country code`, `status` FROM `Geo_Names`$$
DELIMITER ;
