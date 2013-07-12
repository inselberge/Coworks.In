DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`validateCash`$$
CREATE PROCEDURE `validateCash`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Cash` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`getCash`$$
CREATE PROCEDURE `getCash`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `coworking_space_id`, `start_of_month_cash`, `incoming_cash`, `outgoing_cash`, `net_cash_burn`, `end_of_month_cash`, `runaway`, `create_date`, `modify_date` 
	FROM `Cash` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`updateCash`$$
CREATE PROCEDURE `updateCash`(IN ID_VALUE int(10) unsigned, IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN START_OF_MONTH_CASH_VALUE double unsigned, IN INCOMING_CASH_VALUE double unsigned, IN OUTGOING_CASH_VALUE double unsigned, IN NET_CASH_BURN_VALUE double, IN END_OF_MONTH_CASH_VALUE double unsigned, IN RUNAWAY_VALUE float, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp)
BEGIN
	UPDATE `Cash` 
	SET `coworking_space_id` = COWORKING_SPACE_ID_VALUE, `start_of_month_cash` = START_OF_MONTH_CASH_VALUE, `incoming_cash` = INCOMING_CASH_VALUE, `outgoing_cash` = OUTGOING_CASH_VALUE, `net_cash_burn` = NET_CASH_BURN_VALUE, `end_of_month_cash` = END_OF_MONTH_CASH_VALUE, `runaway` = RUNAWAY_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Coworking_Space` WHERE `id` = COWORKING_SPACE_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `coworks_in`.`insertCash`$$
CREATE PROCEDURE `insertCash`(IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN START_OF_MONTH_CASH_VALUE double unsigned, IN INCOMING_CASH_VALUE double unsigned, IN OUTGOING_CASH_VALUE double unsigned, IN NET_CASH_BURN_VALUE double, IN END_OF_MONTH_CASH_VALUE double unsigned, IN RUNAWAY_VALUE float, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Cash` (`coworking_space_id`, `start_of_month_cash`, `incoming_cash`, `outgoing_cash`, `net_cash_burn`, `end_of_month_cash`, `runaway`, `create_date`, `modify_date`) 
	VALUES (COWORKING_SPACE_ID_VALUE, START_OF_MONTH_CASH_VALUE, INCOMING_CASH_VALUE, OUTGOING_CASH_VALUE, NET_CASH_BURN_VALUE, END_OF_MONTH_CASH_VALUE, RUNAWAY_VALUE, CREATE_DATE_VALUE, MODIFY_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

