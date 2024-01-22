USE market_db;

CREATE VIEW v_member
AS
SELECT mem_id, mem_name, addr
FROM member;

SELECT *
FROM v_member;

SELECT mem_name, addr
FROM v_member
WHERE addr IN ('서울', '경기');


SELECT b.mem_id, m.mem_name, b.prod_name, m.addr, CONCAT(m.phone1, m.phone2) '연락처'
FROM buy b
         INNER JOIN member m ON b.mem_id = m.mem_id;

CREATE VIEW v_memberbuy
AS
SELECT b.mem_id, m.mem_name, b.prod_name, m.addr, CONCAT(m.phone1, m.phone2) '연락처'
FROM buy b
         INNER JOIN member m ON b.mem_id = m.mem_id;

SELECT * FROM v_memberbuy WHERE mem_name = '블랙핑크';