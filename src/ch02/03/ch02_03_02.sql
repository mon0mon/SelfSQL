USE self_sql;

-- ch02-03-02-01.sql

-- member 테이블과 연결된 member_view 뷰 생성
CREATE VIEW member_view AS
SELECT *
FROM member;

SELECT *
FROM member_view;