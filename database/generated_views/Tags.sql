DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewTags`$$
CREATE VIEW `viewTags` AS SELECT `id`, `tag`, `status`, `create_date` FROM `Tags`$$
DELIMITER ;
