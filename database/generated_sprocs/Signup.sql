DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateSignup`$$
CREATE PROCEDURE `validateSignup`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Signup` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getSignup`$$
CREATE PROCEDURE `getSignup`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `coworking_space_id`, `last_month_visitors`, `current_visitors`, `growth_of_visitors`, `start_of_month_signups`, `referral_signups`, `walk_in_signups`, `paid_signups`, `total_new_signups`, `last_month_signups`, `growth_of_signups`, `conversion_rate`, `total_referrals`, `referral_conversion_rate`, `end_of_month_signups`, `create_date`, `modify_date` 
	FROM `Signup` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateSignup`$$
CREATE PROCEDURE `updateSignup`(IN ID_VALUE int(10) unsigned, IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN LAST_MONTH_VISITORS_VALUE int(10) unsigned, IN CURRENT_VISITORS_VALUE int(10) unsigned, IN GROWTH_OF_VISITORS_VALUE double, IN START_OF_MONTH_SIGNUPS_VALUE int(10) unsigned, IN REFERRAL_SIGNUPS_VALUE int(10) unsigned, IN WALK_IN_SIGNUPS_VALUE int(10) unsigned, IN PAID_SIGNUPS_VALUE int(10) unsigned, IN TOTAL_NEW_SIGNUPS_VALUE int(10) unsigned, IN LAST_MONTH_SIGNUPS_VALUE int(10) unsigned, IN GROWTH_OF_SIGNUPS_VALUE double, IN CONVERSION_RATE_VALUE float unsigned, IN TOTAL_REFERRALS_VALUE int(10) unsigned, IN REFERRAL_CONVERSION_RATE_VALUE float unsigned, IN END_OF_MONTH_SIGNUPS_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp)
BEGIN
	UPDATE `Signup` 
	SET `coworking_space_id` = COWORKING_SPACE_ID_VALUE, `last_month_visitors` = LAST_MONTH_VISITORS_VALUE, `current_visitors` = CURRENT_VISITORS_VALUE, `growth_of_visitors` = GROWTH_OF_VISITORS_VALUE, `start_of_month_signups` = START_OF_MONTH_SIGNUPS_VALUE, `referral_signups` = REFERRAL_SIGNUPS_VALUE, `walk_in_signups` = WALK_IN_SIGNUPS_VALUE, `paid_signups` = PAID_SIGNUPS_VALUE, `total_new_signups` = TOTAL_NEW_SIGNUPS_VALUE, `last_month_signups` = LAST_MONTH_SIGNUPS_VALUE, `growth_of_signups` = GROWTH_OF_SIGNUPS_VALUE, `conversion_rate` = CONVERSION_RATE_VALUE, `total_referrals` = TOTAL_REFERRALS_VALUE, `referral_conversion_rate` = REFERRAL_CONVERSION_RATE_VALUE, `end_of_month_signups` = END_OF_MONTH_SIGNUPS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Coworking_Space` WHERE `id` = COWORKING_SPACE_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertSignup`$$
CREATE PROCEDURE `insertSignup`(IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN LAST_MONTH_VISITORS_VALUE int(10) unsigned, IN CURRENT_VISITORS_VALUE int(10) unsigned, IN GROWTH_OF_VISITORS_VALUE double, IN START_OF_MONTH_SIGNUPS_VALUE int(10) unsigned, IN REFERRAL_SIGNUPS_VALUE int(10) unsigned, IN WALK_IN_SIGNUPS_VALUE int(10) unsigned, IN PAID_SIGNUPS_VALUE int(10) unsigned, IN TOTAL_NEW_SIGNUPS_VALUE int(10) unsigned, IN LAST_MONTH_SIGNUPS_VALUE int(10) unsigned, IN GROWTH_OF_SIGNUPS_VALUE double, IN CONVERSION_RATE_VALUE float unsigned, IN TOTAL_REFERRALS_VALUE int(10) unsigned, IN REFERRAL_CONVERSION_RATE_VALUE float unsigned, IN END_OF_MONTH_SIGNUPS_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Signup` (`coworking_space_id`, `last_month_visitors`, `current_visitors`, `growth_of_visitors`, `start_of_month_signups`, `referral_signups`, `walk_in_signups`, `paid_signups`, `total_new_signups`, `last_month_signups`, `growth_of_signups`, `conversion_rate`, `total_referrals`, `referral_conversion_rate`, `end_of_month_signups`, `create_date`, `modify_date`) 
	VALUES (COWORKING_SPACE_ID_VALUE, LAST_MONTH_VISITORS_VALUE, CURRENT_VISITORS_VALUE, GROWTH_OF_VISITORS_VALUE, START_OF_MONTH_SIGNUPS_VALUE, REFERRAL_SIGNUPS_VALUE, WALK_IN_SIGNUPS_VALUE, PAID_SIGNUPS_VALUE, TOTAL_NEW_SIGNUPS_VALUE, LAST_MONTH_SIGNUPS_VALUE, GROWTH_OF_SIGNUPS_VALUE, CONVERSION_RATE_VALUE, TOTAL_REFERRALS_VALUE, REFERRAL_CONVERSION_RATE_VALUE, END_OF_MONTH_SIGNUPS_VALUE, CREATE_DATE_VALUE, MODIFY_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

