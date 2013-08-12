DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewResponse_Vote`$$
CREATE VIEW `viewResponse_Vote` AS SELECT `id`, `response_id`, `user_id`, `vote`, `create_date` FROM `Response_Vote`$$
DELIMITER ;
