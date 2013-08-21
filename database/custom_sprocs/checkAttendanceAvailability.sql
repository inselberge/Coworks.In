DELIMITER $$
DROP PROCEDURE IF EXISTS `checkAttendanceAvailability`$$
CREATE PROCEDURE `checkAttendanceAvailability`(IN EVENT_ID_VALUE INT(10) UNSIGNED)
BEGIN
SELECT count(1) into @attending FROM Event_Attendance 
	WHERE attending='yes' AND event_id=EVENT_ID_VALUE;

SELECT max_capacity into @max FROM Conference_Room cr
	JOIN Event_Room er ON er.conference_room_id=cr.id
	WHERE er.event_id=EVENT_ID_VALUE;

IF @attending < @max THEN
   SELECT TRUE as response;
ELSE 
	SELECT FALSE as response;
END IF;
END $$
CALL `checkAttendanceAvailability`(539);