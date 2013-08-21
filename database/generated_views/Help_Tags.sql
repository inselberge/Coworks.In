DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewHelp_Tags`$$
CREATE VIEW `viewHelp_Tags` AS SELECT `id`, `help_id`, `tag_id`, `create_date` FROM `Help_Tags`$$
DELIMITER ;
