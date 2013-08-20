DELIMITER $$
DROP PROCEDURE IF EXISTS geekdom_members.`migrateUserCompany`$$
CREATE PROCEDURE geekdom_members.`migrateUserCompany`()
BEGIN
SET @position=2;
select max(id) INTO @max FROM geekdom_members.Company;
WHILE @position <= @max DO
	-- get the current tag
	SELECT title INTO @current_company FROM geekdom_members.Company WHERE id=@position;
	IF @current_company !='' THEN
		-- insert the users
		INSERT INTO geekdom_members.User_Company (`user_id`,`company_id`,`status`,`create_date`)
			SELECT gp.user_id,@position,'enabled',NOW() 
						FROM geekdom_production.manager_userprofile as gp
						WHERE gp.user_id IN (select id FROM geekdom_members.User)
							AND company_name !=''
							AND company_name = @current_company;

	END IF;
	-- update the position
	SET @position=@position+1;
END WHILE;
END $$
CALL migrateUserCompany();