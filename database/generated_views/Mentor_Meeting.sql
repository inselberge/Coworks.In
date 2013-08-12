DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewMentor_Meeting`$$
CREATE VIEW `viewMentor_Meeting` AS SELECT `id`, `mentor_availability_id`, `user_id`, `status`, `create_date` FROM `Mentor_Meeting`$$
DELIMITER ;
