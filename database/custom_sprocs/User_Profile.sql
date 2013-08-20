-- Find the user information quickly
SELECT id, fullName, create_date FROM geekdom_members.viewUser WHERE id=587;
CALL getUserBioByUserID('587');
-- User Bio
SELECT id,description FROM geekdom_members.viewUser_Bio WHERE user_id=587;
-- User Circle
SELECT vuc.id, c.title, vuc.member_type 
	FROM geekdom_members.viewUser_Circle vuc 
	JOIN Circle c 
		ON vuc.circle_id=c.id 
	WHERE vuc.user_id=587;
CALL getCirclesByUserID('587');
-- User Company
SELECT vum.id as user_company_id, cm.id as company_id, cm.title as company_name
	FROM geekdom_members.viewUser_Company vum 
	JOIN Company cm
		ON vum.company_id=cm.id
	WHERE user_id=587;
CALL getUserCompanyByUserID('587');
-- User Contact TODO: clean User_Contact and remigrate information
SELECT vuct.id,vuct.contact_description_id, cd.title as contact_description,vuct.contact_value 
	FROM geekdom_members.viewUser_Contact vuct
	JOIN Contact_Description cd
		ON vuct.contact_description_id=cd.id
	WHERE user_id=587;
-- User Coworking Space TODO: load this
SELECT * FROM geekdom_members.viewUser_Coworking_Space WHERE user_id=587;
-- User Office
SELECT vuo.id, vuo.office_id, o.name as office_name 
	FROM geekdom_members.viewUser_Office vuo
	JOIN Office o
		ON vuo.office_id=o.id
	WHERE user_id=587;
-- User Tags
SELECT concat('<a href="tag/',vut.tags_id,'" class="tag" title="click to find more users tagged with ',t.tag,'">',t.tag,'</a>') 
	FROM geekdom_members.viewUser_Tags vut
	JOIN Tags t
		ON vut.tags_id=t.id
	WHERE user_id=587;

CALL getUserTagsByUserID('587');
-- User Type
SELECT * FROM geekdom_members.viewUser_Type WHERE user_id=587;