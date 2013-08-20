DELIMITER $$
DROP PROCEDURE IF EXISTS `updateCash`$$
CREATE PROCEDURE `updateCash`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED)
BEGIN
	-- current month
	SELECT id into @id FROM Cash WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	IF @id > 0 THEN
		-- current month
		UPDATE Cash
		SET 
			net_cash_burn=outgoing_cash-incoming_cash,
			end_of_month_cash=start_of_month_cash-net_cash_burn,
			runaway=end_of_month_cash/net_cash_burn
		WHERE id=@id;
	ELSE 
		SELECT id into @prev_id FROM Cash WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		IF @prev_id > 0 THEN
			-- new month for an existing customer
			INSERT INTO Cash (coworking_space_id, start_of_month_cash, incoming_cash, outgoing_cash, net_cash_burn,end_of_month_cash,runaway,create_date)
				SELECT COWORKING_SPACE_ID, 
						end_of_month_cash,
						incoming_cash,
						outgoing_cash,
						net_cash_burn,
						end_of_month_cash,
						runaway,
						NOW() 
				FROM Cash
				WHERE id=@prev_id;
		ELSE
			-- first month ever
			INSERT INTO Cash (coworking_space_id,create_date)
				VALUES (COWORKING_SPACE_ID, NOW());
		END IF;
	END IF;
END$$

DROP PROCEDURE IF EXISTS `updateIncomingCash`$$
CREATE PROCEDURE `updateIncomingCash`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,IN CASH_IN DOUBLE UNSIGNED)
BEGIN
	-- current month
	SELECT id into @id FROM Cash WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	IF @id > 0 THEN
		-- current month
		UPDATE Cash
		SET incoming_cash=CASH_IN,
			net_cash_burn=outgoing_cash-CASH_IN,
			end_of_month_cash=start_of_month_cash-net_cash_burn,
			runaway=end_of_month_cash/net_cash_burn,
			modify_date=NOW()
		WHERE id=@id;
	ELSE 
		SELECT id into @prev_id FROM Cash WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		IF @prev_id > 0 THEN
			-- new month for an existing customer
			INSERT INTO Cash (coworking_space_id, start_of_month_cash, incoming_cash,net_cash_burn,end_of_month_cash,runaway,create_date)
				SELECT COWORKING_SPACE_ID, 
						end_of_month_cash,
						CASH_IN,
						CASH_IN-outgoing_cash,
						end_of_month_cash-(CASH_IN-outgoing_cash),
						(end_of_month_cash-(CASH_IN-outgoing_cash))/(CASH_IN-outgoing_cash),
						NOW() 
				FROM Cash
				WHERE id=@prev_id;
		ELSE
			-- first month ever
			INSERT INTO Cash (coworking_space_id,incoming_cash,net_cash_burn,end_of_month_cash,runaway,create_date)
				VALUES (COWORKING_SPACE_ID, CASH_IN,CASH_IN,CASH_IN,1,NOW());
		END IF;
	END IF;
END$$

DROP PROCEDURE IF EXISTS `updateOutgoingCash`$$
CREATE PROCEDURE `updateOutgoingCash`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,IN CASH_OUT DOUBLE UNSIGNED)
BEGIN
	
	SELECT id into @id FROM Cash WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;

	IF @id > 0 THEN
		-- current month
		UPDATE Cash
		SET outgoing_cash=CASH_OUT,
			net_cash_burn=CASH_OUT-incoming_cash,
			end_of_month_cash=start_of_month_cash-net_cash_burn,
			runaway=end_of_month_cash/net_cash_burn
		WHERE id=@id;
	ELSE 
		SELECT id into @prev_id FROM Cash WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		IF @prev_id > 0 THEN
			-- new month for an existing customer
			INSERT INTO Cash (coworking_space_id, start_of_month_cash, outgoing_cash,net_cash_burn,end_of_month_cash,runaway,create_date)
				SELECT COWORKING_SPACE_ID, 
						end_of_month_cash,
						CASH_OUT,
						incoming_cash-CASH_OUT,
						end_of_month_cash-(incoming_cash-CASH_OUT),
						(end_of_month_cash-(incoming_cash-CASH_OUT))/(incoming_cash-CASH_OUT),
						NOW() 
				FROM Cash
				WHERE id=@prev_id;
		ELSE
			-- first month ever
			INSERT INTO Cash (coworking_space_id,outgoing_cash,net_cash_burn,end_of_month_cash,runaway,create_date)
				VALUES (COWORKING_SPACE_ID, CASH_OUT,-CASH_OUT,-CASH_OUT,-1,NOW());
		END IF;
	END IF;
END$$