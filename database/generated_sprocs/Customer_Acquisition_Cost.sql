DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateCustomer_Acquisition_Cost`$$
CREATE PROCEDURE `validateCustomer_Acquisition_Cost`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Customer_Acquisition_Cost` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getCustomer_Acquisition_Cost`$$
CREATE PROCEDURE `getCustomer_Acquisition_Cost`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `coworking_space_id`, `marketing_spend`, `spend_per_signup_blended`, `spend_per_signup_paid`, `sales_spend`, `sales_spend_per_new_paying_customer`, `total_customer_acquisition_cost_blended`, `total_customer_acquisition_cost_paid`, `time_to_recover_cac_in_months`, `customer_lifetime_value`, `customer_lifetime_value_acquisition_cost_multiple`, `create_date`, `modify_date` 
	FROM `Customer_Acquisition_Cost` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateCustomer_Acquisition_Cost`$$
CREATE PROCEDURE `updateCustomer_Acquisition_Cost`(IN ID_VALUE int(10) unsigned, IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN MARKETING_SPEND_VALUE double unsigned, IN SPEND_PER_SIGNUP_BLENDED_VALUE float unsigned, IN SPEND_PER_SIGNUP_PAID_VALUE float unsigned, IN SALES_SPEND_VALUE double unsigned, IN SALES_SPEND_PER_NEW_PAYING_CUSTOMER_VALUE float unsigned, IN TOTAL_CUSTOMER_ACQUISITION_COST_BLENDED_VALUE float unsigned, IN TOTAL_CUSTOMER_ACQUISITION_COST_PAID_VALUE float unsigned, IN TIME_TO_RECOVER_CAC_IN_MONTHS_VALUE float, IN CUSTOMER_LIFETIME_VALUE_VALUE float unsigned, IN CUSTOMER_LIFETIME_VALUE_ACQUISITION_COST_MULTIPLE_VALUE float unsigned, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp)
BEGIN
	UPDATE `Customer_Acquisition_Cost` 
	SET `coworking_space_id` = COWORKING_SPACE_ID_VALUE, `marketing_spend` = MARKETING_SPEND_VALUE, `spend_per_signup_blended` = SPEND_PER_SIGNUP_BLENDED_VALUE, `spend_per_signup_paid` = SPEND_PER_SIGNUP_PAID_VALUE, `sales_spend` = SALES_SPEND_VALUE, `sales_spend_per_new_paying_customer` = SALES_SPEND_PER_NEW_PAYING_CUSTOMER_VALUE, `total_customer_acquisition_cost_blended` = TOTAL_CUSTOMER_ACQUISITION_COST_BLENDED_VALUE, `total_customer_acquisition_cost_paid` = TOTAL_CUSTOMER_ACQUISITION_COST_PAID_VALUE, `time_to_recover_cac_in_months` = TIME_TO_RECOVER_CAC_IN_MONTHS_VALUE, `customer_lifetime_value` = CUSTOMER_LIFETIME_VALUE_VALUE, `customer_lifetime_value_acquisition_cost_multiple` = CUSTOMER_LIFETIME_VALUE_ACQUISITION_COST_MULTIPLE_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Coworking_Space` WHERE `id` = COWORKING_SPACE_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertCustomer_Acquisition_Cost`$$
CREATE PROCEDURE `insertCustomer_Acquisition_Cost`(IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN MARKETING_SPEND_VALUE double unsigned, IN SPEND_PER_SIGNUP_BLENDED_VALUE float unsigned, IN SPEND_PER_SIGNUP_PAID_VALUE float unsigned, IN SALES_SPEND_VALUE double unsigned, IN SALES_SPEND_PER_NEW_PAYING_CUSTOMER_VALUE float unsigned, IN TOTAL_CUSTOMER_ACQUISITION_COST_BLENDED_VALUE float unsigned, IN TOTAL_CUSTOMER_ACQUISITION_COST_PAID_VALUE float unsigned, IN TIME_TO_RECOVER_CAC_IN_MONTHS_VALUE float, IN CUSTOMER_LIFETIME_VALUE_VALUE float unsigned, IN CUSTOMER_LIFETIME_VALUE_ACQUISITION_COST_MULTIPLE_VALUE float unsigned, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Customer_Acquisition_Cost` (`coworking_space_id`, `marketing_spend`, `spend_per_signup_blended`, `spend_per_signup_paid`, `sales_spend`, `sales_spend_per_new_paying_customer`, `total_customer_acquisition_cost_blended`, `total_customer_acquisition_cost_paid`, `time_to_recover_cac_in_months`, `customer_lifetime_value`, `customer_lifetime_value_acquisition_cost_multiple`, `create_date`, `modify_date`) 
	VALUES (COWORKING_SPACE_ID_VALUE, MARKETING_SPEND_VALUE, SPEND_PER_SIGNUP_BLENDED_VALUE, SPEND_PER_SIGNUP_PAID_VALUE, SALES_SPEND_VALUE, SALES_SPEND_PER_NEW_PAYING_CUSTOMER_VALUE, TOTAL_CUSTOMER_ACQUISITION_COST_BLENDED_VALUE, TOTAL_CUSTOMER_ACQUISITION_COST_PAID_VALUE, TIME_TO_RECOVER_CAC_IN_MONTHS_VALUE, CUSTOMER_LIFETIME_VALUE_VALUE, CUSTOMER_LIFETIME_VALUE_ACQUISITION_COST_MULTIPLE_VALUE, CREATE_DATE_VALUE, MODIFY_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

