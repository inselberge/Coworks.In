DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Company`$$
CREATE VIEW `viewUser_Company` AS SELECT `id`, `company_id`, `user_id`, `status`, `create_date` FROM `User_Company`$$
DELIMITER ;
