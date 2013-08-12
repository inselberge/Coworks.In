DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewPaying_Customers`$$
CREATE VIEW `viewPaying_Customers` AS SELECT `id`, `coworking_space_id`, `start_of_month_customers`, `new_customers`, `conversion_rate`, `lost_customers`, `churn_rate`, `net_new_customers`, `end_of_month_customers`, `growth_customers`, `create_date`, `modify_date` FROM `Paying_Customers`$$
DELIMITER ;
