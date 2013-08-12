DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Invite`$$
CREATE VIEW `viewUser_Invite` AS SELECT `id`, `user_id`, `email`, `key`, `status`, `create_date`, `expire_date` FROM `User_Invite`$$
DELIMITER ;
