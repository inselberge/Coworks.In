DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Coworking_Space`$$
CREATE VIEW `viewUser_Coworking_Space` AS SELECT `id`, `user_id`, `coworking_space_id`, `status`, `create_date` FROM `User_Coworking_Space`$$
DELIMITER ;
