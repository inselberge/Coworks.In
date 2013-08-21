SELECT COUNT(1) FROM geekdom_production.manager_checkin;

SELECT count(1) FROM geekdom_production.manager_checkin GROUP BY HOUR(occurred_on);

SELECT count(1) as visits, concat(first_name,' ',last_name) as fullName, email FROM geekdom_production.manager_checkin mc
	JOIN geekdom_production.auth_user au ON au.id=mc.userprofile_id
WHERE mc.occurred_on > "2013-01-01" AND au.is_active=1 GROUP BY mc.userprofile_id ORDER BY visits DESC;

