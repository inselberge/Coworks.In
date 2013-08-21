DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Cave`$$
CREATE VIEW `viewUser_Cave` AS SELECT `id`, `user_id`, `flag_count`, `status`, `create_date` FROM `User_Cave`$$
DELIMITER ;
