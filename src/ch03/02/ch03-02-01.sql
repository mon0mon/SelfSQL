USE market_db;

-- ch03-02-01.sql

-- ch03-02-01-01.sql

SELECT mem_id, mem_name, debut_date
FROM member
ORDER BY debut_date;

SELECT mem_id, mem_name, debut_date
FROM member
ORDER BY debut_date DESC;


-- ch03-02-01-02.sql

-- ORDER BY는 WHERE 절 뒤에
# SELECT mem_id, mem_name, debut_date, height
# FROM member
# ORDER BY height DESC
# where height >= 164;


SELECT mem_id, mem_name, debut_date, height
FROM member
WHERE height >= 164
ORDER BY height DESC;

SELECT mem_id, mem_name, debut_date, height
FROM member
WHERE height >= 164
ORDER BY height DESC, debut_date ASC;


-- ch03-02-01-03.sql

SELECT *
FROM member
LIMIT 3;

SELECT mem_name, debut_date
FROM member
ORDER BY debut_date
LIMIT 3;

SELECT mem_name, height
FROM member
ORDER BY height DESC
LIMIT 5;

-- LIMIT 시작, 개수
-- LIMIT 개수 OFFSET 시작과 동일
SELECT mem_name, height
FROM member
ORDER BY height DESC
LIMIT 3, 2;

-- LIMIT 시작, 개수와 동일
SELECT mem_name, height
FROM member
ORDER BY height DESC
LIMIT 2 OFFSET 3;


-- ch03-02-01-04.sql


SELECT addr
FROM member;

SELECT addr
FROM member
ORDER BY addr;

SELECT DISTINCT addr
FROM member;


-- ch03-02-01-05.sql

SELECT mem_id, amount
FROM buy
ORDER BY mem_id;

SELECT mem_id, SUM(amount)
FROM buy
GROUP BY mem_id
ORDER BY mem_id;

SELECT mem_id AS "회원 아이디", SUM(amount) AS "총 구매 개수"
FROM buy
GROUP BY mem_id
ORDER BY mem_id;

SELECT mem_id AS "회원 아이디", SUM(price * amount) AS "총 구매 금액"
FROM buy
GROUP BY mem_id
ORDER BY mem_id;

SELECT AVG(amount) AS "평균 구매 개수"
FROM buy;

SELECT mem_id, AVG(amount) AS "평균 구매 개수"
FROM buy
GROUP BY mem_id;

SELECT COUNT(*)
FROM member;

SELECT COUNT(phone1) AS "연락처가 있는 회원"
FROM member;


-- ch03-02-01-06.sql

SELECT mem_id AS "회원 아이디", SUM(price * amount) AS "총 구매 금액"
FROM buy
GROUP BY mem_id;

-- [HY000][1111] Invalid use of group function
# SELECT mem_id AS "회원 아이디", SUM(price * amount) AS "총 구매 금액"
# FROM buy
# WHERE SUM(price * amount) > 1000
# GROUP BY mem_id;

SELECT mem_id AS "회원 아이디", SUM(price * amount) AS "총 구매 금액"
FROM buy
GROUP BY mem_id
HAVING SUM(price * amount) > 1000;

SELECT mem_id AS "회원 아이디", SUM(price * amount) AS "총 구매 금액"
FROM buy
GROUP BY mem_id
HAVING SUM(price * amount) > 1000
ORDER BY SUM(price * amount) DESC;