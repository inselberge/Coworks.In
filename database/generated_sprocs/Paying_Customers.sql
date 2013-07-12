DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validatePaying_Customers`$$
CREATE PROCEDURE `validatePaying_Customers`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Paying_Customers` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getPaying_Customers`$$
CREATE PROCEDURE `getPaying_Customers`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `coworking_space_id`, `start_of_month_customers`, `new_customers`, `conversion_rate`, `lost_customers`, `churn_rate`, `net_new_customers`, `end_of_month_customers`, `growth_customers`, `create_date`, `modify_date` 
	FROM `Paying_Customers` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updatePaying_Customers`$$
CREATE PROCEDURE `updatePaying_Customers`(IN ID_VALUE int(10) unsigned, IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN START_OF_MONTH_CUSTOMERS_VALUE int(10) unsigned, IN NEW_CUSTOMERS_VALUE int(10) unsigned, IN CONVERSION_RATE_VALUE float unsigned, IN LOST_CUSTOMERS_VALUE int(10) unsigned, IN CHURN_RATE_VALUE double, IN NET_NEW_CUSTOMERS_VALUE int(11), IN END_OF_MONTH_CUSTOMERS_VALUE int(10) unsigned, IN GROWTH_CUSTOMERS_VALUE double, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp)
BEGIN
	UPDATE `Paying_Customers` 
	SET `coworking_space_id` = COWORKING_SPACE_ID_VALUE, `start_of_month_customers` = START_OF_MONTH_CUSTOMERS_VALUE, `new_customers` = NEW_CUSTOMERS_VALUE, `conversion_rate` = CONVERSION_RATE_VALUE, `lost_customers` = LOST_CUSTOMERS_VALUE, `churn_rate` = CHURN_RATE_VALUE, `net_new_customers` = NET_NEW_CUSTOMERS_VALUE, `end_of_month_customers` = END_OF_MONTH_CUSTOMERS_VALUE, `growth_customers` = GROWTH_CUSTOMERS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Coworking_Space` WHERE `id` = COWORKING_SPACE_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertPaying_Customers`$$
CREATE PROCEDURE `insertPaying_Customers`(IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN START_OF_MONTH_CUSTOMERS_VALUE int(10) unsigned, IN NEW_CUSTOMERS_VALUE int(10) unsigned, IN CONVERSION_RATE_VALUE float unsigned, IN LOST_CUSTOMERS_VALUE int(10) unsigned, IN CHURN_RATE_VALUE double, IN NET_NEW_CUSTOMERS_VALUE int(11), IN END_OF_MONTH_CUSTOMERS_VALUE int(10) unsigned, IN GROWTH_CUSTOMERS_VALUE double, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Paying_Customers` (`coworking_space_id`, `start_of_month_customers`, `new_customers`, `conversion_rate`, `lost_customers`, `churn_rate`, `net_new_customers`, `end_of_month_customers`, `growth_customers`, `create_date`, `modify_date`) 
	VALUES (COWORKING_SPACE_ID_VALUE, START_OF_MONTH_CUSTOMERS_VALUE, NEW_CUSTOMERS_VALUE, CONVERSION_RATE_VALUE, LOST_CUSTOMERS_VALUE, CHURN_RATE_VALUE, NET_NEW_CUSTOMERS_VALUE, END_OF_MONTH_CUSTOMERS_VALUE, GROWTH_CUSTOMERS_VALUE, CREATE_DATE_VALUE, MODIFY_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

