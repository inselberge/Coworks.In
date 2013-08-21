-- Nine Charts
-- Visitors & Signups (Line Double Y)
-- 	1. Visitors
	SELECT `current_visitors` as `visitors`, DATE_FORMAT(create_date,"%Y-%m") as `date` 
		FROM Signup
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");
-- 	2. Total New Signups
	SELECT total_new_signups, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Signup
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");
-- 	3. Visitors-to-Signups
	SELECT conversion_rate, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Signup
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");
--  4. Referral Conversion Rate
	SELECT referral_conversion_rate, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Signup
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");

-- 2. Signups & Paying Customers (Line Double Y)
-- 	1. Total new signups (see above)
	
-- 	2. New Customers
	SELECT new_customers, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Paying_Customers
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");
	
-- 	3. Conversion Rate
	SELECT conversion_rate, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Paying_Customers
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");

-- 	4. Churn Rate
	SELECT churn_rate, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Paying_Customers
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");

-- 3. Month over Month Growth Rate (Line)
-- 	1. M/M Growth Visitors
	SELECT growth_visitors, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Signup
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");

-- 	2. M/M Growth Signups
	SELECT growth_signups, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Signup
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");

-- 	3. M/M Growth Customers
	SELECT growth_customers, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Paying_Customers
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");

-- 	4. M/M Growth MRR
	SELECT month_over_month_growth, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Monthly_Recurring_Revenue
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");

-- 4. New MRR (Line)
-- 	1. Total New MRR v. Date
	SELECT total_new_recurring_revenue, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Monthly_Recurring_Revenue
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");

-- 	2. Lost MRR v. Date
	SELECT lost_recurring_revenue_from_contraction, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Monthly_Recurring_Revenue
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");
-- 	3. Net New MRR v. Date
	SELECT net_new_recurring_revenue, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Monthly_Recurring_Revenue
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");

-- 5. MRR (stacked bar)
-- 	1. Beginning MRR v. Date
	SELECT start_of_month_recurring_revenue, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Monthly_Recurring_Revenue
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");
-- 	2. Lost MRR v. Date
	SELECT lost_recurring_revenue_from_contraction, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Monthly_Recurring_Revenue
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");
-- 	3. New MRR from Expansion v. Date
	SELECT new_recurring_revenue_from_expansion, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Monthly_Recurring_Revenue
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");
-- 	4. New MRR from New Customers v. Date
	SELECT new_recurring_revenue_from_new_customers, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Monthly_Recurring_Revenue
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");
-- 6. ARPA (Line)
-- 	1. Paid
	SELECT average_revenue_per_account, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Monthly_Recurring_Revenue
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");
-- 	2. New
	SELECT average_revenue_per_new_account, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Monthly_Recurring_Revenue
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");
-- 7. CAC (Line)
-- 	1. Blended v. Date
	SELECT total_customer_acquisition_cost_blended, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Customer_Acquisition_Cost
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");
-- 	2. Paid v. Date
	SELECT total_customer_acquisition_cost_paid, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Customer_Acquisition_Cost
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");
-- 8. Cash (Bar)
-- 	1. Cash v. Date
	SELECT end_of_month_cash, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Cash
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");
-- 9. Runaway (Line)
-- 	1. Runaway v. Date
	SELECT runaway, DATE_FORMAT(create_date,"%Y-%m") as `date`
		FROM Cash
		WHERE coworking_space_id=COWORKING_SPACE_ID
		GROUP BY DATE_FORMAT(create_date,"%Y-%m");

