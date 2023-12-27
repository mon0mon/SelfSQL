USE market_db;

-- ch03-01-04.sql

-- ch03-01-04-01.sql

SELECT height
FROM member
WHERE mem_name = '에이핑크';

SELECT mem_name, height
FROM member
WHERE height > 164;

SELECT mem_name, height
FROM member
WHERE height > (SELECT height FROM member WHERE mem_name = '에이핑크');