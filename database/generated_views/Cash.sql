DELIMITER $$
DROP VIEW IF EXISTS `Coworks_In`.`viewCash`$$
CREATE VIEW `viewCash` AS SELECT `id`, `coworking_space_id`, `start_of_month_cash`, `incoming_cash`, `outgoing_cash`, `net_cash_burn`, `end_of_month_cash`, `runaway`, `create_date`, `modify_date` FROM `Cash`$$
DELIMITER ;
