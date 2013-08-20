select count(1) as count, u.fullName FROM Event e
	JOIN User u ON e.user_id=u.id
	GROUP BY user_id ORDER BY count DESC;