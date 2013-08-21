DELIMITER $$
DROP PROCEDURE IF EXISTS `updateCustomerAcquisitionCost`$$
CREATE PROCEDURE `updateCustomerAcquisitionCost`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED)
BEGIN
	SELECT DATE_FORMAT(CURDATE(),'%Y-%m') INTO @date_key;
	-- current month
	SELECT id into @id FROM Customer_Acquisition_Cost WHERE DATE_FORMAT(create_date,'%Y-%m')=@date_key AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	
	IF @id > 0 THEN
		SELECT total_new_signups INTO @total_new_signups FROM Signup WHERE DATE_FORMAT(create_date,'%Y-%m')=@date_key AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		
		SELECT paid_signups INTO @paid_signups FROM Signup WHERE DATE_FORMAT(create_date,'%Y-%m')=@date_key AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		
		SELECT new_customers INTO @new_customers FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=@date_key AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		
		SELECT average_revenue_per_account INTO @arpa FROM Monthly_Recurring_Revenue WHERE DATE_FORMAT(create_date,'%Y-%m')=@date_key AND coworking_space_id=COWORKING_SPACE_ID_VALUE;		

		SELECT average_revenue_per_new_account INTO @arpa_new FROM Monthly_Recurring_Revenue WHERE DATE_FORMAT(create_date,'%Y-%m')=@date_key AND coworking_space_id=COWORKING_SPACE_ID_VALUE;

		SELECT AVG(churn_rate) INTO @avg_churn FROM Paying_Customers WHERE coworking_space_id=COWORKING_SPACE_ID_VALUE;

		-- current month
		UPDATE Customer_Acquisition_Cost
		SET 
			spend_per_signup_blended=marketing_spend/@total_new_signups,
			spend_per_signup_paid=marketing_spend/@paid_signups,
			sales_spend_per_new_paying_customer=sales_spend/@new_customers,
			total_customer_acquisition_cost_blended=(marketing_spend+sales_spend)/@new_customers,
			total_customer_acquisition_cost_paid=(marketing_spend+sales_spend*(@paid_signups/@total_new_signups))/(@new_customers*(@paid_signups/@total_new_signups)),
			time_to_recover_cac_in_months=total_customer_acquisition_cost_paid/@arpa_new,
			customer_lifetime_value=(1/@avg_churn)*@arpa,
			customer_lifetime_value_acquisition_cost_multiple=customer_lifetime_value/total_customer_acquisition_cost_paid
		WHERE id=@id;
	ELSE 
		INSERT INTO Customer_Acquisition_Cost (coworking_space_id,create_date)
			VALUES (COWORKING_SPACE_ID, NOW());
	END IF;
END$$


DROP PROCEDURE IF EXISTS `addCustomerAcquisitionCostMarketingSpend`$$
CREATE PROCEDURE `addCustomerAcquisitionCostMarketingSpend`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,NEW_SPEND DOUBLE UNSIGNED)
BEGIN	
	SELECT id into @id FROM Customer_Acquisition_Cost WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	IF @id > 0 THEN
		UPDATE Customer_Acquisition_Cost
		SET
			marketing_spend=marketing_spend+NEW_SPEND
		WHERE id=@id;
		CALL `updateCustomerAcquisitionCost`(COWORKING_SPACE_ID_VALUE); 
	ELSE
		CALL `updateCustomerAcquisitionCost`(COWORKING_SPACE_ID_VALUE); 
		CALL `addCustomerAcquisitionCostMarketingSpend`(COWORKING_SPACE_ID_VALUE,NEW_SPEND);
	END IF;	
END$$

DROP PROCEDURE IF EXISTS `addCustomerAcquisitionCostSalesSpend`$$
CREATE PROCEDURE `addCustomerAcquisitionCostSalesSpend`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,NEW_SPEND DOUBLE UNSIGNED)
BEGIN	
	SELECT id into @id FROM Customer_Acquisition_Cost WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	IF @id > 0 THEN
		UPDATE Customer_Acquisition_Cost
		SET
			sales_spend=sales_spend+NEW_SPEND
		WHERE id=@id;
		CALL `updateCustomerAcquisitionCost`(COWORKING_SPACE_ID_VALUE); 
	ELSE
		CALL `updateCustomerAcquisitionCost`(COWORKING_SPACE_ID_VALUE); 
		CALL `addCustomerAcquisitionCostSalesSpend`(COWORKING_SPACE_ID_VALUE,NEW_SPEND);
	END IF;	
END$$