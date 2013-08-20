DELIMITER $$
DROP PROCEDURE IF EXISTS `updateSignups`$$
CREATE PROCEDURE `updateSignups`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED)
BEGIN
	-- current month
	SELECT id into @id FROM Signup WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	-- previous month
	SELECT id into @prev_id FROM Signup WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;

	IF @id > 0 THEN
		IF @prev_id > 0 THEN
			-- current month, with a previous month
			UPDATE Signup 
				SET growth_of_visitors=(current_visitors/last_month_visitors)-1,
					total_new_signups=(referral_signups+paid_signups+walk_in_signups),
					growth_of_signups=(total_new_signups/last_month_signups)-1,
					conversion_rate=(total_new_signups/current_visitors),
					referral_conversion_rate=(referral_signups/total_referrals),
					end_of_month_signups=start_of_month_signups+total_new_signups
			WHERE id=@id;
		ELSE 
			-- current month with no previous month
			UPDATE Signup 
				SET 
					total_new_signups=(referral_signups+paid_signups+walk_in_signups),					
					conversion_rate=(total_new_signups/current_visitors),
					referral_conversion_rate=(referral_signups/total_referrals),
					end_of_month_signups=start_of_month_signups+total_new_signups
			WHERE id=@id;
		END IF;
	ELSE
		-- need to create a new record
		IF @prev_id > 0 THEN
			-- just a new month setup
			INSERT INTO Signup 
				(coworking_space_id,last_month_visitors, start_of_month_signups, last_month_signups, create_date)
				SELECT coworking_space_id,last_month_visitors, start_of_month_signups, last_month_signups, NOW() FROM Signups WHERE id=@prev_id;
		ELSE
			-- first setup ever
			INSERT INTO Signup (coworking_space_id,create_date) VALUES (COWORKING_SPACE_ID_VALUE,NOW());
		END IF;
	END IF;
END$$
SELECT * FROM Signup;