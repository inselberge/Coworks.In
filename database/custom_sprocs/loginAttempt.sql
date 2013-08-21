DELIMITER $$
DROP PROCEDURE IF EXISTS `loginAttempt`$$
CREATE PROCEDURE `loginAttempt`(IN EMAIL_VALUE VARCHAR(128), IN PASSWORD_VALUE VARCHAR(128), IN IP_VALUE VARCHAR(15), OUT USER_ID_VALUE INT(10) UNSIGNED)
BEGIN
	SELECT id INTO @id FROM Users WHERE email=EMAIL_VALUE;
	SELECT 1 INTO @login_okay FROM Users WHERE email=EMAIL_VALUE AND password=PASSWORD_VALUE AND status='enabled';
	SELECT NOW() INTO @tmstmp;
	IF @login_okay > 0 THEN
		INSERT INTO User_Login (user_id,ip,failure,login_time,create_date) VALUES (@id,IP_VALUE,0,@tmstmp,@tmstmp);
		SELECT @id;
	ELSE 
		INSERT INTO User_Login (user_id,ip,failure,create_date) VALUES (@id,IP_VALUE,1,@tmstmp);
		SELECT count(1) INTO @failure_count FROM User_Login WHERE user_id=@id AND create_date=DATE(@tmstmp);
		IF @failure_count > 5 THEN
			UPDATE User SET status='disabled',modify_date=@tmstmp,modify_user=1,modify_reason='Excessive login failures' WHERE id=@id;			
		END IF;
	END IF;	
END$$
DELIMITER ;