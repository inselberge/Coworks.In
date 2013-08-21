DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewCompany_Location`$$
CREATE VIEW `viewCompany_Location` AS SELECT `id`, `company_id`, `location_id`, `status`, `create_date` FROM `Company_Location`$$
DELIMITER ;
