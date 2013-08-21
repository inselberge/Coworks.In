DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewBilling_Plan`$$
CREATE VIEW `viewBilling_Plan` AS SELECT `id`, `title`, `description`, `price`, `compounds`, `status`, `create_date` FROM `Billing_Plan`$$
DELIMITER ;
