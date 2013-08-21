DELIMITER $$
DROP PROCEDURE IF EXISTS `updatePassword`$$
CREATE PROCEDURE `updatePassword`(IN EMAIL_VALUE VARCHAR(128), IN PASSWORD_VALUE VARCHAR(128))
BEGIN
	SELECT id INTO @id FROM User WHERE email=EMAIL_VALUE;
	IF @id > 0
		THEN
		UPDATE User 
			SET password=PASSWORD_VALUE, 
				modify_date=NOW(),
				modify_user=@id,
				modify_reason='forgot password'
			WHERE
			id=@id;
	END IF;
END$$