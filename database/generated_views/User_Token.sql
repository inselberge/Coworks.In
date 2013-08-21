DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Token`$$
CREATE VIEW `viewUser_Token` AS SELECT `id`, `user_id`, `token_id`, `token`, `status`, `create_date` FROM `User_Token`$$
DELIMITER ;
