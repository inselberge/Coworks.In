DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewOffice`$$
CREATE VIEW `viewOffice` AS SELECT `id`, `location_id`, `name`, `floor`, `max_capacity`, `current_capacity`, `status`, `create_date` FROM `Office`$$
DELIMITER ;
