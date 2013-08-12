DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Time`$$
CREATE VIEW `viewUser_Time` AS SELECT `id`, `giving_user_id`, `taking_user_id`, `start_time` FROM `User_Time`$$
DELIMITER ;
