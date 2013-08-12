DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewEvent_Tags`$$
CREATE VIEW `viewEvent_Tags` AS SELECT `id`, `event_id`, `tag_id`, `create_date` FROM `Event_Tags`$$
DELIMITER ;
