DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Image`$$
CREATE VIEW `viewUser_Image` AS SELECT `id`, `user_id`, `image`, `status`, `create_date` FROM `User_Image`$$
DELIMITER ;
