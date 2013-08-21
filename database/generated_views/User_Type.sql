DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Type`$$
CREATE VIEW `viewUser_Type` AS SELECT `id`, `user_id`, `type`, `create_date` FROM `User_Type`$$
DELIMITER ;
