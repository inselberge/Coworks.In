DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewCoworking_Space_Billing_Plan`$$
CREATE VIEW `viewCoworking_Space_Billing_Plan` AS SELECT `id`, `coworking_space_id`, `billing_plan_id`, `stripe_status`, `create_date` FROM `Coworking_Space_Billing_Plan`$$
DELIMITER ;
