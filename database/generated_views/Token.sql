DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewToken`$$
CREATE VIEW `viewToken` AS SELECT `id`, `title`, `expire_length`, `authenticate_url`, `validate_url`, `status`, `create_date` FROM `Token`$$
DELIMITER ;
