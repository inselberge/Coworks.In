DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Bio`$$
CREATE VIEW `viewUser_Bio` AS SELECT `id`, `user_id`, `description`, `status`, `create_date` FROM `User_Bio`$$
DELIMITER ;
