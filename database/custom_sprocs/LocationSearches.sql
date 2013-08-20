DELIMITER $$
DROP PROCEDURE IF EXISTS `searchCoworkingSpace`$$
CREATE PROCEDURE `searchCoworkingSpace`(IN NAME_VALUE VARCHAR(128))
BEGIN
	SELECT id, name FROM Coworking_Space WHERE status='enabled' AND NAME LIKE "%NAME_VALUE%";
END $$

DROP PROCEDURE IF EXISTS `searchLocations`$$
CREATE PROCEDURE `searchLocations`(IN COWORKING_ID_VALUE INT(10) UNSIGNED)
BEGIN
	SELECT id, address1,address2,city, state, zip, country 
		FROM Location 
		WHERE coworking_space_id=COWORKING_ID_VALUE AND status='enabled';
END$$

DROP PROCEDURE IF EXISTS `searchCountry`$$
CREATE PROCEDURE `searchCountry`(IN NAME_VALUE VARCHAR(128))
BEGIN
	SELECT id, name FROM Country WHERE status='enabled' AND name LIKE "%NAME_VALUE%";
END$$