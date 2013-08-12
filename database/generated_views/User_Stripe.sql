DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewUser_Stripe`$$
CREATE VIEW `viewUser_Stripe` AS SELECT `id`, `user_id`, `stripe_token`, `last_checked`, `is_active`, `create_date` FROM `User_Stripe`$$
DELIMITER ;
