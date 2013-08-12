DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewEvent_Attendance`$$
CREATE VIEW `viewEvent_Attendance` AS SELECT `id`, `event_id`, `user_id`, `attending`, `create_date` FROM `Event_Attendance`$$
DELIMITER ;
