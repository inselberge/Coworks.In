DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewLocation_User_Status`$$
CREATE VIEW `viewLocation_User_Status` AS SELECT `id`, `location_id`, `user_id`, `check_in` FROM `Location_User_Status`$$
DELIMITER ;
