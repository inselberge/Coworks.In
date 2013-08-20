SELECT * FROM geekdom_members.Event;

DELETE FROM geekdom_members.Event WHERE id < 5000;

INSERT INTO geekdom_members.Event (id, user_id, title, description, start_time, end_time, url, status, create_date)
SELECT id, added_by_id, name, description, starts_at, ends_at, link, 'retired',NOW() FROM geekdom_production.manager_event WHERE ends_at < NOW() AND added_by_id IN (select id FROM geekdom_members.User);