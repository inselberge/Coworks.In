DELIMITER $$
DROP PROCEDURE IF EXISTS `unlockUser`$$
CREATE PROCEDURE `unlockUser`(IN EMAIL_VALUE VARCHAR(128))
BEGIN
	SELECT id INTO @id FROM Users WHERE email=EMAIL_VALUE;
	SELECT 1 INTO @login_locked FROM Users WHERE email=EMAIL_VALUE AND modify_user=1 AND status='disabled';	
	IF @login_locked > 0 THEN
		UPDATE User SET status='enabled',modify_date=NOW(),modify_user=1,modify_reason='Unlocking account' WHERE id=@id;			
	END IF;	
END$$
DELIMITER ;