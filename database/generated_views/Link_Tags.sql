DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewLink_Tags`$$
CREATE VIEW `viewLink_Tags` AS SELECT `id`, `link_id`, `tag_id`, `create_date` FROM `Link_Tags`$$
DELIMITER ;
