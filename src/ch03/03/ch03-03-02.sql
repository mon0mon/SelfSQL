USE market_db;

-- ch03-03-02.sql

-- ch03-03-02-01.sql
USE market_db;
UPDATE city_popul
SET city_name = '서울'
WHERE city_name = 'Seoul';
SELECT *
FROM city_popul
WHERE city_name = '서울';


-- ch03-03-02-02.sql
UPDATE city_popul
SET city_name  = '뉴욕',
    population = 0
WHERE city_name = 'New York';
SELECT *
FROM city_popul
WHERE city_name = '뉴욕';


-- ch03-03-02-03.sql
-- MySQL은 기본적으로 AUTO_COMMIT 이 1로 설정되어 있음
-- 명령어 수행 후 즉시 COMMIT 되는 방식
-- START TRANSACTION을 사용하면, 사용자가 직접 COMMIT 여부를 설정 할 수 있음
START TRANSACTION;
UPDATE city_popul
SET city_name = '서울';
SELECT *
FROM city_popul;
-- 수행한 변경사항을 롤백
ROLLBACK;
SELECT *
FROM city_popul;
SELECT *
FROM city_popul;


-- ch03-03-02-04.sql
UPDATE city_popul SET population = population / 10000;
SELECT * FROM city_popul LIMIT 5;