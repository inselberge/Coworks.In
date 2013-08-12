DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Office`$$
CREATE VIEW `viewUser_Office` AS SELECT `id`, `user_id`, `office_id`, `status`, `create_date` FROM `User_Office`$$
DELIMITER ;
