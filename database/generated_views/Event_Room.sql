DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewEvent_Room`$$
CREATE VIEW `viewEvent_Room` AS SELECT `id`, `event_id`, `conference_room_id`, `status`, `create_date` FROM `Event_Room`$$
DELIMITER ;
