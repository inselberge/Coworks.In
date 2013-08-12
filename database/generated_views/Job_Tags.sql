DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewJob_Tags`$$
CREATE VIEW `viewJob_Tags` AS SELECT `id`, `job_id`, `tag_id`, `create_date` FROM `Job_Tags`$$
DELIMITER ;
