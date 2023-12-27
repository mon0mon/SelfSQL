USE market_db;

-- ch03-01-02.sql

-- ch03-01-02-01.sql

-- 현재 사용하는 데이터베이스 형식 지정
USE market_db;


-- ch03-01-02-02.sql


USE market_db;
SELECT * -- 테이블에 있는 모든 칼럼 값을 가져옴
FROM member;
-- 데이터를 가져올 테이블


-- ch03-01-02-03.sql

SELECT mem_name
FROM member;


-- ch03-01-02-04.sql

SELECT addr, debut_date, mem_name
FROM member;


-- ch03-01-02-05.sql

SELECT addr 주소, debut_date "데뷔 일자", mem_name
FROM member;