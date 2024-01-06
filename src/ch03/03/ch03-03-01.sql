USE market_db;

-- ch03-03-01.sql

-- ch03-03-01-01.sql
USE market_db;
CREATE TABLE hongong1
(
    toy_id   INT,
    toy_name CHAR(4),
    age      INT
);
INSERT INTO hongong1
VALUES (1, '우디', 25);


-- ch03-03-01-02.sql
INSERT INTO hongong1 (toy_id, toy_name)
VALUES (2, '버즈');


-- ch03-03-01-03.sql
INSERT INTO hongong1 (toy_name, age, toy_id)
VALUES ('제시', 20, 3);


-- ch03-03-01-04.sql
CREATE TABLE hongong2
(
    toy_id   INT AUTO_INCREMENT PRIMARY KEY,
    toy_name CHAR(4),
    age      INT
);


-- ch03-03-01-05.sql
INSERT INTO hongong2
VALUES (NULL, '보핍', 25);
INSERT INTO hongong2
VALUES (NULL, '슬링키', 22);
INSERT INTO hongong2
VALUES (NULL, '렉스', 21);
SELECT *
FROM hongong2;

-- ch03-03-01-06.sql
SELECT LAST_INSERT_ID();


-- ch03-03-01-07.sql
-- show create table로 해당 테이블의 구조를 파악할 수 있음
SHOW CREATE TABLE hongong2;
ALTER TABLE hongong2
    AUTO_INCREMENT = 100;
INSERT INTO hongong2
VALUES (NULL, '재남', 35);
SELECT *
FROM hongong2;
SHOW CREATE TABLE hongong2;
SELECT `LAST_INSERT_ID`();


-- ch03-03-01-08.sql
CREATE TABLE hongong3
(
    toy_id   INT AUTO_INCREMENT PRIMARY KEY,
    toy_name char(4),
    age      INT
);
-- auto_increment 시작 값을 1000으로 지정
ALTER TABLE hongong3
    AUTO_INCREMENT = 1000;
-- auto_increment 증가 값을 3으로 지정
SET @@auto_increment_increment = 3;


-- ch03-03-01-09.sql
-- @@auto_increment_increment는 시스템 변수 중 하나
-- 모든 시스템 변수를 보고 싶으면 SHOW GLOBAL VARIABLES를 실행
SHOW GLOBAL VARIABLES;


-- ch03-03-01-10.sql
INSERT INTO hongong3
VALUES (NULL, '토마스', 20);
INSERT INTO hongong3
VALUES (NULL, '제임스', 23);
INSERT INTO hongong3
VALUES (NULL, '고든', 25);
SELECT *
FROM hongong3;


-- ch03-03-01-11.sql
SELECT COUNT(*)
FROM world.city;


-- ch03-03-01-12.sql
DESC world.city;


-- ch03-03-01-13.sql
SELECT *
FROM world.city
LIMIT 5;


-- ch03-03-01-14.sql
CREATE TABLE city_popul
(
    city_name  CHAR(35),
    population INT
);
SHOW TABLES;


-- ch03-03-01-15.sql
INSERT INTO city_popul
SELECT name, population
FROM world.city;
SELECT *
FROM city_popul;