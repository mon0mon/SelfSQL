USE market_db;

-- ch03-03-03-appendix.sql

-- ch03-03-03-appendix-01.sql
CREATE TABLE big_table1 (SELECT *
                         FROM world.city, sakila.country);
CREATE TABLE big_table2 (SELECT *
                         FROM world.city, sakila.country);
CREATE TABLE big_table3 (SELECT *
                         FROM world.city, sakila.country);
SELECT COUNT(*)
FROM big_table1;


-- ch03-03-03-appendix-02.sql
-- 속도 순서 DROP > TURNCATE > DELETE
-- DELETE와 TRUNCATE는 빈 테이블을 남김
-- DROP은 테이블 자체를 삭제
DELETE FROM big_table1;
DROP TABLE big_table2;
TRUNCATE TABLE big_table3;
