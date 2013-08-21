DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewCircle_Tags`$$
CREATE VIEW `viewCircle_Tags` AS SELECT `id`, `circle_id`, `tag_id`, `status`, `create_date` FROM `Circle_Tags`$$
DELIMITER ;
