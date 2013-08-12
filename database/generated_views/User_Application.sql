DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Application`$$
CREATE VIEW `viewUser_Application` AS SELECT `id`, `user_id`, `languages`, `skills`, `started_business`, `work_habit`, `interests`, `special`, `convicted_felon`, `computer_fraud_or_theft`, `create_date` FROM `User_Application`$$
DELIMITER ;
