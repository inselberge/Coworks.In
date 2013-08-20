-- users from current
SELECT user_id FROM geekdom_production.manager_userprofile WHERE user_id IN (select id FROM geekdom_members.User) AND skills LIKE "%.net%";


DELIMITER $$
DROP PROCEDURE IF EXISTS geekdom_members.`migrateUserSkills`$$
CREATE PROCEDURE geekdom_members.`migrateUserSkills`()
BEGIN
SET @position=1;
select count(tag) INTO @max FROM geekdom_members.Tags;
WHILE @position <= @max DO
	-- get the current tag
	SELECT tag INTO @current_tag FROM geekdom_members.Tags WHERE id=@position;
	-- insert the users
	INSERT INTO geekdom_members.User_Tags (`user_id`,`tags_id`,`status`,`create_date`)
		SELECT user_id,@position,'enabled',NOW() 
					FROM geekdom_production.manager_userprofile 
					WHERE user_id IN (select id FROM geekdom_members.User) 
						AND skills LIKE CONCAT("%",@current_tag,"%");
	-- update the position
	SET @position=@position+1;
END WHILE;
END $$

CALL `migrateUserSkills`();