DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewCompany_Tags`$$
CREATE VIEW `viewCompany_Tags` AS SELECT `id`, `company_id`, `tag_id`, `status`, `create_date` FROM `Company_Tags`$$
DELIMITER ;
