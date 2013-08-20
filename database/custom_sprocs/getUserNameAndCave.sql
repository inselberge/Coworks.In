DELIMITER $$
DROP PROCEDURE IF EXISTS `getUserNameAndCave`$$
CREATE PROCEDURE `getUserNameAndCave`(IN USER_ID_VALUE INT(10) UNSIGNED)
BEGIN
SELECT u.`fullName`, uc.`status` FROM User u
	LEFT JOIN User_Cave uc ON uc.`user_id`=u.`id`
	WHERE u.id=USER_ID_VALUE;
END$$

