DELIMITER $$
DROP PROCEDURE IF EXISTS `updatePayingCustomers`$$
CREATE PROCEDURE `updatePayingCustomers`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED)
BEGIN
	-- current month
	SELECT id into @id FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	-- last month signups
	SELECT total_new_signups INTO @last_month_signups FROM Signup WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE; 
	IF @id > 0 THEN		
		-- current month
		UPDATE Paying_Customers
		SET 
			conversion_rate=new_customers/@last_month_signups,
			churn_rate=lost_customers/start_of_month_customers,
			net_new_customers=new_customers-lost_customers,
			end_of_month_customers=start_of_month_customers+net_new_customers,
			growth_customers=(end_of_month_customers/start_of_month_customers)-1
		WHERE id=@id;
	ELSE 
		SELECT id into @prev_id FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		IF @prev_id > 0 THEN
			-- new month for an existing customer
			INSERT INTO Paying_Customers (coworking_space_id,start_of_month_customers,end_of_month_customers,create_date)
				SELECT COWORKING_SPACE_ID_VALUE, end_of_month_customers, end_of_month_customers, NOW() 
				FROM Paying_Customers
				WHERE id=@prev_id;
		ELSE
			-- first month ever
			INSERT INTO Paying_Customers (coworking_space_id,create_date)
				VALUES (COWORKING_SPACE_ID, NOW());
		END IF;
	END IF;
END$$

DROP PROCEDURE IF EXISTS `updateNewPayingCustomers`$$
CREATE PROCEDURE `updateNewPayingCustomers`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,IN NEW_CUSTOMERS_VALUE INT(10) UNSIGNED)
BEGIN
	-- current month
	SELECT id into @id FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	-- last month signups
	SELECT total_new_signups INTO @last_month_signups FROM Signup WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE; 

	IF @id > 0 THEN
		-- current month
		UPDATE Paying_Customers
		SET 
			new_customers=NEW_CUSTOMERS_VALUE,
			conversion_rate=NEW_CUSTOMERS_VALUE/@last_month_signups,
			churn_rate=lost_customers/start_of_month_customers,
			net_new_customers=NEW_CUSTOMERS_VALUE-lost_customers,
			end_of_month_customers=start_of_month_customers+net_new_customers,
			growth_customers=(end_of_month_customers/start_of_month_customers)-1
		WHERE id=@id;
	ELSE 
		SELECT id into @prev_id FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		IF @prev_id > 0 THEN
			-- new month for an existing customer
			INSERT INTO Paying_Customers (coworking_space_id,start_of_month_customers, end_of_month_customers,create_date)
				SELECT COWORKING_SPACE_ID_VALUE, end_of_month_customers, end_of_month_customers, NOW()
				FROM Paying_Customers
				WHERE id=@prev_id;
		ELSE
			-- first month ever
			INSERT INTO Paying_Customers (coworking_space_id,create_date)
				VALUES (COWORKING_SPACE_ID_VALUE,NOW());
		END IF;
	END IF;
END$$

DROP PROCEDURE IF EXISTS `updateLostPayingCustomers`$$
CREATE PROCEDURE `updateLostPayingCustomers`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,IN LOST_CUSTOMERS_VALUE INT(10) UNSIGNED)
BEGIN
	
	SELECT id into @id FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	-- last month signups
	SELECT total_new_signups INTO @last_month_signups FROM Signup WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE; 

	IF @id > 0 THEN
		-- current month
		UPDATE Paying_Customers
		SET 
			lost_customers=LOST_CUSTOMERS_VALUE,
			churn_rate=LOST_CUSTOMERS_VALUE/start_of_month_customers,
			net_new_customers=new_customers-LOST_CUSTOMERS_VALUE,
			end_of_month_customers=start_of_month_customers+net_new_customers,
			growth_customers=(end_of_month_customers/start_of_month_customers)-1
		WHERE id=@id;
	ELSE 
		SELECT id into @prev_id FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		IF @prev_id > 0 THEN
			-- new month for an existing customer
			INSERT INTO Paying_Customers (coworking_space_id, start_of_month_customers,end_of_month_customers,create_date)
				SELECT COWORKING_SPACE_ID_VALUE, end_of_month_customers, end_of_month_customers, NOW()
				FROM PayingCustomers
				WHERE id=@prev_id;
		ELSE
			-- first month ever
			INSERT INTO Paying_Customers (coworking_space_id,create_date)
				VALUES (COWORKING_SPACE_ID_VALUE,NOW());
		END IF;
	END IF;
END$$