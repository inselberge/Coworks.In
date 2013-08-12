DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser`$$
CREATE VIEW `viewUser` AS SELECT `id`, `first_name`, `last_name`, `fullName`, `email`, `password`, `birthday`, `status`, `create_date` FROM `User`$$
DELIMITER ;
