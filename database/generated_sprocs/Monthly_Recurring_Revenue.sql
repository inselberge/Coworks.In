DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateMonthly_Recurring_Revenue`$$
CREATE PROCEDURE `validateMonthly_Recurring_Revenue`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Monthly_Recurring_Revenue` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getMonthly_Recurring_Revenue`$$
CREATE PROCEDURE `getMonthly_Recurring_Revenue`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `coworking_space_id`, `start_of_month_recurring_revenue`, `new_recurring_revenue_from_new_customers`, `new_recurring_revenue_from_expansion`, `total_new_recurring_revenue`, `lost_recurring_revenue_from_contraction`, `churn_rate`, `net_new_recurring_revenue`, `end_of_month_recurring_revenue`, `month_over_month_growth`, `average_revenue_per_account`, `average_revenue_per_new_account`, `create_date`, `modify_date` 
	FROM `Monthly_Recurring_Revenue` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateMonthly_Recurring_Revenue`$$
CREATE PROCEDURE `updateMonthly_Recurring_Revenue`(IN ID_VALUE int(10) unsigned, IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN START_OF_MONTH_RECURRING_REVENUE_VALUE double unsigned, IN NEW_RECURRING_REVENUE_FROM_NEW_CUSTOMERS_VALUE double unsigned, IN NEW_RECURRING_REVENUE_FROM_EXPANSION_VALUE double unsigned, IN TOTAL_NEW_RECURRING_REVENUE_VALUE double unsigned, IN LOST_RECURRING_REVENUE_FROM_CONTRACTION_VALUE double unsigned, IN CHURN_RATE_VALUE float, IN NET_NEW_RECURRING_REVENUE_VALUE double, IN END_OF_MONTH_RECURRING_REVENUE_VALUE double unsigned, IN MONTH_OVER_MONTH_GROWTH_VALUE float, IN AVERAGE_REVENUE_PER_ACCOUNT_VALUE double unsigned, IN AVERAGE_REVENUE_PER_NEW_ACCOUNT_VALUE double unsigned, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp)
BEGIN
	UPDATE `Monthly_Recurring_Revenue` 
	SET `coworking_space_id` = COWORKING_SPACE_ID_VALUE, `start_of_month_recurring_revenue` = START_OF_MONTH_RECURRING_REVENUE_VALUE, `new_recurring_revenue_from_new_customers` = NEW_RECURRING_REVENUE_FROM_NEW_CUSTOMERS_VALUE, `new_recurring_revenue_from_expansion` = NEW_RECURRING_REVENUE_FROM_EXPANSION_VALUE, `total_new_recurring_revenue` = TOTAL_NEW_RECURRING_REVENUE_VALUE, `lost_recurring_revenue_from_contraction` = LOST_RECURRING_REVENUE_FROM_CONTRACTION_VALUE, `churn_rate` = CHURN_RATE_VALUE, `net_new_recurring_revenue` = NET_NEW_RECURRING_REVENUE_VALUE, `end_of_month_recurring_revenue` = END_OF_MONTH_RECURRING_REVENUE_VALUE, `month_over_month_growth` = MONTH_OVER_MONTH_GROWTH_VALUE, `average_revenue_per_account` = AVERAGE_REVENUE_PER_ACCOUNT_VALUE, `average_revenue_per_new_account` = AVERAGE_REVENUE_PER_NEW_ACCOUNT_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Coworking_Space` WHERE `id` = COWORKING_SPACE_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertMonthly_Recurring_Revenue`$$
CREATE PROCEDURE `insertMonthly_Recurring_Revenue`(IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN START_OF_MONTH_RECURRING_REVENUE_VALUE double unsigned, IN NEW_RECURRING_REVENUE_FROM_NEW_CUSTOMERS_VALUE double unsigned, IN NEW_RECURRING_REVENUE_FROM_EXPANSION_VALUE double unsigned, IN TOTAL_NEW_RECURRING_REVENUE_VALUE double unsigned, IN LOST_RECURRING_REVENUE_FROM_CONTRACTION_VALUE double unsigned, IN CHURN_RATE_VALUE float, IN NET_NEW_RECURRING_REVENUE_VALUE double, IN END_OF_MONTH_RECURRING_REVENUE_VALUE double unsigned, IN MONTH_OVER_MONTH_GROWTH_VALUE float, IN AVERAGE_REVENUE_PER_ACCOUNT_VALUE double unsigned, IN AVERAGE_REVENUE_PER_NEW_ACCOUNT_VALUE double unsigned, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Monthly_Recurring_Revenue` (`coworking_space_id`, `start_of_month_recurring_revenue`, `new_recurring_revenue_from_new_customers`, `new_recurring_revenue_from_expansion`, `total_new_recurring_revenue`, `lost_recurring_revenue_from_contraction`, `churn_rate`, `net_new_recurring_revenue`, `end_of_month_recurring_revenue`, `month_over_month_growth`, `average_revenue_per_account`, `average_revenue_per_new_account`, `create_date`, `modify_date`) 
	VALUES (COWORKING_SPACE_ID_VALUE, START_OF_MONTH_RECURRING_REVENUE_VALUE, NEW_RECURRING_REVENUE_FROM_NEW_CUSTOMERS_VALUE, NEW_RECURRING_REVENUE_FROM_EXPANSION_VALUE, TOTAL_NEW_RECURRING_REVENUE_VALUE, LOST_RECURRING_REVENUE_FROM_CONTRACTION_VALUE, CHURN_RATE_VALUE, NET_NEW_RECURRING_REVENUE_VALUE, END_OF_MONTH_RECURRING_REVENUE_VALUE, MONTH_OVER_MONTH_GROWTH_VALUE, AVERAGE_REVENUE_PER_ACCOUNT_VALUE, AVERAGE_REVENUE_PER_NEW_ACCOUNT_VALUE, CREATE_DATE_VALUE, MODIFY_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

