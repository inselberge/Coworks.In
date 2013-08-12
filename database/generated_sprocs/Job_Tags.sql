DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`validateJob_Tags`$$
CREATE PROCEDURE `validateJob_Tags`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `Job_Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`getJob_Tags`$$
CREATE PROCEDURE `getJob_Tags`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `job_id`, `tag_id`, `create_date` 
	FROM `Job_Tags` 
	WHERE `id` = ID_VALUE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`updateJob_Tags`$$
CREATE PROCEDURE `updateJob_Tags`(IN ID_VALUE bigint(20) unsigned, IN JOB_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp)
BEGIN
	UPDATE `Job_Tags` 
	SET `job_id` = JOB_ID_VALUE, `tag_id` = TAG_ID_VALUE, `create_date` = CREATE_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Job` WHERE `id` = JOB_ID_VALUE)
		 AND (SELECT 1 FROM `Tags` WHERE `id` = TAG_ID_VALUE);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `Coworks_In`.`insertJob_Tags`$$
CREATE PROCEDURE `insertJob_Tags`(IN JOB_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `Job_Tags` (`job_id`, `tag_id`, `create_date`) 
	VALUES (JOB_ID_VALUE, TAG_ID_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END$$
DELIMITER ;

