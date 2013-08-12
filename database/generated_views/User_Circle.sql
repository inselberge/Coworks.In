DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Circle`$$
CREATE VIEW `viewUser_Circle` AS SELECT `id`, `circle_id`, `user_id`, `member_type`, `status`, `create_date` FROM `User_Circle`$$
DELIMITER ;
