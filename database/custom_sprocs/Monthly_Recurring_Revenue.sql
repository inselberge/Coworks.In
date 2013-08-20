DELIMITER $$
DROP PROCEDURE IF EXISTS `updateMonthlyRecurringRevenue`$$
CREATE PROCEDURE `updateMonthlyRecurringRevenue`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED)
BEGIN
	-- current month
	SELECT id into @id FROM Monthly_Recurring_Revenue WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;

	IF @id > 0 THEN

		SELECT end_of_month_customers INTO @end_customers FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		SELECT new_customers INTO @new_customers FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;

		-- current month
		UPDATE Monthly_Recurring_Revenue
		SET 
			churn_rate=lost_recurring_revenue_from_contraction/start_of_month_recurring_revenue,
			total_new_recurring_revenue=new_recurring_revenue_from_new_customers+new_recurring_revenue_from_expansion,
			net_new_recurring_revenue=(total_new_recurring_revenue-lost_recurring_revenue_from_contraction),
			churn_rate=lost_recurring_revenue_from_contraction/start_of_month_recurring_revenue,
			end_of_month_recurring_revenue=start_of_month_recurring_revenue+net_new_recurring_revenue,
			month_over_month_growth= (end_of_month_recurring_revenue/start_of_month_recurring_revenue)-1,
			average_revenue_per_account=end_of_month_recurring_revenue/@end_customers,
			average_revenue_per_new_account=new_recurring_revenue_from_new_customers/@new_customers
		WHERE id=@id;
	ELSE 
		SELECT id into @prev_id FROM Monthly_Recurring_Revenue WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		IF @prev_id > 0 THEN
			-- new month for an existing customer
			INSERT INTO Monthly_Recurring_Revenue (coworking_space_id, start_of_month_recurring_revenue, end_of_month_recurring_revenue, create_date)
				SELECT COWORKING_SPACE_ID, 
						end_of_month_recurring_revenue,
						end_of_month_recurring_revenue,
						NOW() 
				FROM Monthly_Recurring_Revenue
				WHERE id=@prev_id;
		ELSE
			-- first month ever
			INSERT INTO Monthly_Recurring_Revenue (coworking_space_id,create_date)
				VALUES (COWORKING_SPACE_ID, NOW());
		END IF;
	END IF;
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS `addMonthlyRecurringRevenueNew`$$
CREATE PROCEDURE `addMonthlyRecurringRevenueNew`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,NEW_REVENUE DOUBLE UNSIGNED)
BEGIN
	SELECT id into @id FROM Monthly_Recurring_Revenue WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	IF @id > 0 THEN
		UPDATE Monthly_Recurring_Revenue
		SET
			new_recurring_revenue_from_new_customers=new_recurring_revenue_from_new_customers+NEW_REVENUE
		WHERE id=@id;
		CALL `updateMonthlyRecurringRevenue`(COWORKING_SPACE_ID_VALUE); 
	ELSE
		CALL `updateMonthlyRecurringRevenue`(COWORKING_SPACE_ID_VALUE); 
		CALL `addMonthlyRecurringRevenueNew`(COWORKING_SPACE_ID_VALUE,NEW_REVENUE);
	END IF;	
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS `addMonthlyRecurringRevenueExpansion`$$
CREATE PROCEDURE `addMonthlyRecurringRevenueExpansion`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,NEW_REVENUE DOUBLE UNSIGNED)
BEGIN
	SELECT id into @id FROM Monthly_Recurring_Revenue WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	IF @id > 0 THEN
		UPDATE Monthly_Recurring_Revenue
		SET
			new_recurring_revenue_from_expansion=new_recurring_revenue_from_expansion+NEW_REVENUE
		WHERE id=@id;
		CALL `updateMonthlyRecurringRevenue`(COWORKING_SPACE_ID_VALUE); 
	ELSE
		CALL `updateMonthlyRecurringRevenue`(COWORKING_SPACE_ID_VALUE); 
		CALL `addMonthlyRecurringRevenueExpansion`(COWORKING_SPACE_ID_VALUE,NEW_REVENUE);
	END IF;
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS `addMonthlyRecurringRevenueContraction`$$
CREATE PROCEDURE `addMonthlyRecurringRevenueContraction`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,LOST_REVENUE DOUBLE UNSIGNED)
BEGIN
	SELECT id into @id FROM Monthly_Recurring_Revenue WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	IF @id > 0 THEN
		UPDATE Monthly_Recurring_Revenue
		SET
			lost_recurring_revenue_from_contraction=lost_recurring_revenue_from_contraction+LOST_REVENUE
		WHERE id=@id;
		CALL `updateMonthlyRecurringRevenue`(COWORKING_SPACE_ID_VALUE); 
	ELSE
		CALL `updateMonthlyRecurringRevenue`(COWORKING_SPACE_ID_VALUE); 
		CALL `addMonthlyRecurringRevenueContraction`(COWORKING_SPACE_ID_VALUE,LOST_REVENUE);
	END IF;
END$$
