DELIMITER $$
DROP PROCEDURE IF EXISTS `getHelpByEmail`$$
CREATE PROCEDURE `getHelpByEmail`(IN EMAIL_VALUE VARCHAR(128))
BEGIN
	SELECT h.id, title, estimated_time FROM Help as h
		JOIN User u ON h.user_id=u.id
		WHERE h.status='enabled'
			AND u.status='enabled'
			AND u.email=EMAIL_VALUE;
END$$
CALL getHelpByEmail('texmorgan@gmail.com');