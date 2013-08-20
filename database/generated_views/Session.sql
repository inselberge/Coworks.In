DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewSession`$$
CREATE VIEW `viewSession` AS SELECT `id`, `session_id`, `ip`, `page_views`, `is_member`, `create_date` FROM `Session`$$
DELIMITER ;
