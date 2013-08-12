DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewSignup`$$
CREATE VIEW `viewSignup` AS SELECT `id`, `coworking_space_id`, `last_month_visitors`, `current_visitors`, `growth_of_visitors`, `start_of_month_signups`, `referral_signups`, `walk_in_signups`, `paid_signups`, `total_new_signups`, `last_month_signups`, `growth_of_signups`, `conversion_rate`, `total_referrals`, `referral_conversion_rate`, `end_of_month_signups`, `create_date`, `modify_date` FROM `Signup`$$
DELIMITER ;
