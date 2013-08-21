DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewLocation`$$
CREATE VIEW `viewLocation` AS SELECT `id`, `coworking_space_id`, `address1`, `city`, `state`, `zip`, `country`, `status`, `create_date` FROM `Location`$$
DELIMITER ;
