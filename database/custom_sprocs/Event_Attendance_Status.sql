select status,count(1) FROM Event_Attendance WHERE event_id=EVENT_ID_VALUE GROUP BY status;

select 'Yes' as attending,count(1) as count FROM Event_Attendance WHERE event_id=539  AND attending='yes'
UNION
select 'No' as attending,count(1) as count FROM Event_Attendance WHERE event_id=539  AND attending='no'
UNION
select 'Maybe' as attending,count(1) as count FROM Event_Attendance WHERE event_id=539  AND attending='maybe'
UNION
select 'Lead' as attending,count(1) as count FROM Event_Attendance WHERE event_id=539 AND attending='lead';


select distinct attending,count(1) as count FROM Event_Attendance WHERE event_id=539 GROUP BY attending ORDER BY count DESC;