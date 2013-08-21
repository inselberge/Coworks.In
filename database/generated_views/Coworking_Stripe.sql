DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewCoworking_Stripe`$$
CREATE VIEW `viewCoworking_Stripe` AS SELECT `id`, `coworking_id`, `live`, `type`, `key`, `status`, `create_date` FROM `Coworking_Stripe`$$
DELIMITER ;
