DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Contact`$$
CREATE VIEW `viewUser_Contact` AS SELECT `id`, `user_id`, `contact_description_id`, `contact_value`, `status`, `create_date` FROM `User_Contact`$$
DELIMITER ;
