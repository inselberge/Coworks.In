DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Tags`$$
CREATE VIEW `viewUser_Tags` AS SELECT `id`, `user_id`, `tags_id`, `status`, `create_date` FROM `User_Tags`$$
DELIMITER ;
