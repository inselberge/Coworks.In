DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Billing`$$
CREATE VIEW `viewUser_Billing` AS SELECT `id`, `user_id`, `coworking_space_billing_plan_id`, `status`, `create_date` FROM `User_Billing`$$
DELIMITER ;
