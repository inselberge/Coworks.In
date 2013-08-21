DELIMITER $$
DROP PROCEDURE IF EXISTS `getPassword`$$
CREATE PROCEDURE `getPassword`(IN EMAIL_VALUE VARCHAR(128))
BEGIN
	SELECT `id`,`password` FROM User WHERE email=EMAIL_VALUE;
END$$

CALL getPassword('texmorgan@gmail.com');