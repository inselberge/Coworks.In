DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Address`$$
CREATE VIEW `viewUser_Address` AS SELECT `id`, `user_id`, `address`, `city`, `state`, `zip`, `status`, `create_date` FROM `User_Address`$$
DELIMITER ;
