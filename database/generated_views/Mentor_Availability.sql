DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewMentor_Availability`$$
CREATE VIEW `viewMentor_Availability` AS SELECT `id`, `user_id`, `start_time`, `end_time`, `status`, `create_date` FROM `Mentor_Availability`$$
DELIMITER ;
