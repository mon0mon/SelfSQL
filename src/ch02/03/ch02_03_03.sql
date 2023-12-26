USE self_sql;

-- ch02-03-03-01.sql

SELECT *
FROM member
WHERE member_name = '나훈아';
SELECT *
FROM product
WHERE product_name = '삼각김밥';

-- 두 SQL을 하나의 스토어드 프로시저로 생성
-- 첫 행과 마지막 행의 구분문자로 'DELIMITER //', 'DELIMITER ;'를 사용
-- BEGIN과 END 사이에 SQL 문을 입력
DELIMITER //
CREATE PROCEDURE myProc()
BEGIN
    SELECT * FROM member WHERE member_name = '나훈아';
    SELECT * FROM product WHERE product_name = '삼각김밥';
END //
DELIMITER ;

CALL myProc();

DROP PROCEDURE myProc;