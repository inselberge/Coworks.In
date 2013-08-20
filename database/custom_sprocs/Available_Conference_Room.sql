DELIMITER $$
DROP PROCEDURE IF EXISTS `availableConferenceRooms`$$
CREATE PROCEDURE `availableConferenceRooms`(IN LOCATION_ID_VALUE INT(10) UNSIGNED, START_TIME_VALUE timestamp, END_TIME_VALUE timestamp)
BEGIN
	SELECT id, name, floor, max_capacity 
		FROM Conference_Room 
		WHERE location_id=LOCATION_ID_VALUE
			AND status='enabled'
			AND id NOT IN (
				SELECT conference_room_id FROM Event_Room er
					JOIN Event e ON er.event_id=e.id
					WHERE e.status='enabled' 
						AND er.status='enabled'
						AND e.start_time<=START_TIME_VALUE 
						AND (e.end_time>=START_TIME_VALUE
						OR e.end_time<=END_TIME_VALUE)
			);
END$$

CALL `availableConferenceRooms`(1,"2013-10-01 18:00:00","2013-10-01 19:00:00");