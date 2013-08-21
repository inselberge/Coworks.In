-- datatypes and their counts
select count(1) as cnt, column_type from information_schema.columns WHERE table_schema="geekdom_members" GROUP BY column_type ORDER BY cnt DESC;

select column_type, table_name, column_name from information_schema.columns WHERE table_schema="geekdom_members" GROUP BY column_type;

select table_name, column_name from information_schema.columns WHERE table_schema="geekdom_members" AND column_type="tinytext" order by table_name;

-- all key data
SELECT * FROM information_schema.key_column_usage WHERE table_schema="geekdom_members" ORDER BY table_name, constraint_name;

-- all primary and foreign keys
SELECT constraint_name, table_name, referenced_table_name, referenced_column_name FROM information_schema.key_column_usage WHERE table_schema="geekdom_members" ORDER BY table_name, constraint_name;

SELECT * from information_schema.columns WHERE table_schema="geekdom_members" and column_key!='' ORDER BY table_name, ordinal_position;