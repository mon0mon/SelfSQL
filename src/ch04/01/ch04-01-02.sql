USE market_db;

DESC member;

/*
[42000][1074] Column length too big for column 'date1' (max = 255); use BLOB or TEXT instead
*/
CREATE TABLE big_table
(
    date1 CHAR(256),
    date2 VARCHAR(16384)
);


CREATE DATABASE netflix_db;
USE netflix_db;
CREATE TABLE movie
(
    movie_id       INT,
    movie_title    VARCHAR(30),
    movie_director VARCHAR(20),
    movie_star     VARCHAR(20),
    movie_script   LONGTEXT,
    movie_file     LONGBLOB
);


USE market_db;
SET @myvar1 = 5;
SET @myvar2 = 4.25;

SELECT @myvar1;
SELECT @myvar2;
SELECT @myvar1 + @myvar2;

SET @txt = '가수 이름==> ';
SET @height = 166;
SELECT @txt, mem_name
FROM member
WHERE height > @height;


SET @count = 3;
-- LIMIT에서 변수 사용 X
-- [42000][1064] You have an error in your SQL syntax;
-- check the manual that corresponds to your MySQL server version for the right
-- syntax to use near '@count' at line 1
SELECT mem_name, height
FROM member
ORDER BY height
LIMIT @count;


SET @count = 3;
PREPARE mysql FROM 'SELECT mem_name, height FROM member ORDER BY height LIMIT ?';
EXECUTE mysql USING @count;


SELECT AVG(price) AS '평균 가격'
FROM buy;


SELECT CAST(AVG(price) AS SIGNED) '평균 가격'
FROM buy;
SELECT CONVERT(AVG(price), SIGNED) '평균 가격'
FROM buy;


SELECT CAST('2022$12$12' AS DATE);
SELECT CAST('2022/12/12' AS DATE);
SELECT CAST('2022%12%12' AS DATE);
SELECT CAST('2022@12@12' AS DATE);

SELECT num,
       CONCAT(CAST(price AS CHAR), 'X', CAST(amount AS CHAR), '=')
           '가격X수량', price * amount '구매액'
FROM buy;


SELECT '100' + '200';

SELECT CONCAT(100, '200');
SELECT 100 + '200';
