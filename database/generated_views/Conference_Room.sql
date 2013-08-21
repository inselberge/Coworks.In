DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewConference_Room`$$
CREATE VIEW `viewConference_Room` AS SELECT `id`, `location_id`, `name`, `floor`, `max_capacity`, `status`, `create_date` FROM `Conference_Room`$$
DELIMITER ;
