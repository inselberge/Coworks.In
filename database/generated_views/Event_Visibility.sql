DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewEvent_Visibility`$$
CREATE VIEW `viewEvent_Visibility` AS SELECT `id`, `event_id`, `visibility`, `create_date` FROM `Event_Visibility`$$
DELIMITER ;
