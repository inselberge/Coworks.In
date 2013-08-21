INSERT INTO Billing_Plan (`title`,`price`,`status`,`create_date`)
SELECT name,price,'enabled',NOW() FROM geekdom_production.manager_membershiptype GROUP BY price;