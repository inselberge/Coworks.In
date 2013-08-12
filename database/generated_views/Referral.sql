DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewReferral`$$
CREATE VIEW `viewReferral` AS SELECT `id`, `user_id`, `event_id`, `key`, `clicks`, `status`, `create_date` FROM `Referral`$$
DELIMITER ;
