DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewCustomer_Acquisition_Cost`$$
CREATE VIEW `viewCustomer_Acquisition_Cost` AS SELECT `id`, `coworking_space_id`, `marketing_spend`, `spend_per_signup_blended`, `spend_per_signup_paid`, `sales_spend`, `sales_spend_per_new_paying_customer`, `total_customer_acquisition_cost_blended`, `total_customer_acquisition_cost_paid`, `time_to_recover_cac_in_months`, `customer_lifetime_value`, `customer_lifetime_value_acquisition_cost_multiple`, `create_date`, `modify_date` FROM `Customer_Acquisition_Cost`$$
DELIMITER ;
