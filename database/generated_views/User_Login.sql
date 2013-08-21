DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Login`$$
CREATE VIEW `viewUser_Login` AS SELECT `id`, `user_id`, `ip`, `failure`, `create_date` FROM `User_Login`$$
DELIMITER ;
