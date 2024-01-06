USE market_db;

-- ch03-03-03.sql

-- ch03-03-03-01.sql
DELETE FROM city_popul
WHERE city_name LIKE 'New%';


-- ch03-03-03-02.sql
DELETE FROM city_popul
WHERE city_name LIKE 'New%' LIMIT 5;