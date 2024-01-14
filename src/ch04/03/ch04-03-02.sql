USE market_db;

DROP PROCEDURE IF EXISTS caseProc;
DELIMITER $$
CREATE PROCEDURE caseProc()
BEGIN
    DECLARE point INT;
    DECLARE credit CHAR(1);
    SET point = 88;

    CASE
        WHEN point >= 90 THEN SET credit = 'A';
        WHEN point >= 80 THEN SET credit = 'B';
        WHEN point >= 70 THEN SET credit = 'C';
        WHEN point >= 60 THEN SET credit = 'D';
        ELSE SET credit = 'F';
        END CASE;
    SELECT CONCAT('취득점수 ==> ', point), CONCAT('학점 ==> ', credit);
END $$
DELIMITER ;
CALL caseProc();

SELECT mem_id, SUM(price * amount) "총 구매액"
FROM buy
GROUP BY mem_id
ORDER BY SUM(price * amount) DESC;

SELECT *
FROM member;

-- 구매내역이 있는 그룹 멤버를 출력
SELECT m.mem_id, mem_name, SUM(price * amount) "총 구매액"
FROM buy b
         INNER JOIN member m ON b.mem_id = m.mem_id
GROUP BY mem_id
ORDER BY SUM(price * amount) DESC;

-- 구매내역이 없는 그룹 멤버를 출력
SELECT m.mem_id, mem_name, SUM(price * amount) "총 구매액"
FROM buy b
         RIGHT OUTER JOIN member m ON b.mem_id = m.mem_id
GROUP BY m.mem_id
HAVING SUM(price * amount) IS NULL
ORDER BY SUM(price * amount) DESC;

-- 그룹 멤버의 구매내역을 출력
SELECT m.mem_id, mem_name, SUM(price * amount) "총 구매액"
FROM buy b
         RIGHT OUTER JOIN member m ON b.mem_id = m.mem_id
GROUP BY m.mem_id
ORDER BY SUM(price * amount) DESC;


SELECT m.mem_id, mem_name, SUM(price * amount) "총 구매액",
       CASE
           WHEN (SUM(price * amount) >= 1500) THEN '최우수고객'
           WHEN (SUM(price * amount) >= 1000) THEN '우수고객'
           WHEN (SUM(price * amount) >= 1) THEN '일반고객'
           ELSE '유령고객'
           END '회원등급'
FROM buy b
         RIGHT OUTER JOIN member m ON b.mem_id = m.mem_id
GROUP BY m.mem_id
ORDER BY SUM(price * amount) DESC;

SHOW GLOBAL VARIABLES LIKE 'log_bin_trust_function_creators';
set GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION IF EXISTS memberRank;
DELIMITER $$
CREATE FUNCTION memberRank(spent INT) RETURNS VARCHAR(20)
BEGIN
    DECLARE `rank` VARCHAR(20);
    CASE
        WHEN spent >= 1500 THEN SET `rank` = '최우수고객';
        WHEN spent >= 1000 THEN SET `rank` = '우수고객';
        WHEN spent >= 1 THEN SET `rank` = '일반고객';
        ELSE SET `rank` = '유령고객';
        END CASE;
    RETURN `rank`;
END $$
DELIMITER ;

SELECT m.mem_id, mem_name, SUM(price * amount) "총 구매액", memberRank(SUM(price * amount)) '회원등급'
FROM buy b
         RIGHT OUTER JOIN member m ON b.mem_id = m.mem_id
GROUP BY m.mem_id
ORDER BY SUM(price * amount) DESC;