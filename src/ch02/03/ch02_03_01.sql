USE self_sql;

SHOW INDEX FROM member;
DROP INDEX idx_member_name ON member;


-- ch02-03-01-01.sql

SELECT *
FROM member
WHERE member_name = '아이유';

-- 다음 EXPLAIN 키워드를 통해, 쿼리문의 실행 계획을 확인할 수 있음
EXPLAIN SELECT * FROM member WHERE member_name = '아이유';


-- ch02-03-01-02.sql

-- member_name을 기반으로 하는 idx_member_name라는 인덱스 생성
CREATE INDEX idx_member_name ON member (member_name);

SELECT *
FROM member
WHERE member_name = '아이유';