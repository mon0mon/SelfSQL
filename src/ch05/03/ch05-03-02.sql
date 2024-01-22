USE market_db;

CREATE VIEW v_viewtest1
AS
SELECT b.mem_id                   'Member ID',
       m.mem_name AS              'Member Name',
       b.prod_name                "Product Name",
       CONCAT(m.phone1, m.phone2) "Office Phone"
FROM buy b
         INNER JOIN member m ON b.mem_id = m.mem_id;

SELECT DISTINCT `Member ID`, `Member Name`
FROM v_viewtest1;


ALTER VIEW v_viewtest1
    AS
        SELECT B.mem_id '회원 아이디', m.mem_name AS '회원 이름', b.prod_name "제품 이름", CONCAT(m.phone1, m.phone2) AS "연락처"
        FROM buy b
                 INNER JOIN member m ON b.mem_id = m.mem_id;

SELECT DISTINCT `회원 아이디`, `회원 이름`
FROM v_viewtest1;

DROP VIEW v_viewtest1;


CREATE OR REPLACE VIEW v_viewtest2 AS
SELECT mem_id, mem_name, addr
FROM member;

DESCRIBE v_viewtest2;
DESCRIBE member;

SHOW CREATE VIEW v_viewtest2;

UPDATE v_member SET addr = '부산' WHERE mem_id = 'BLK';

INSERT INTO v_member(mem_id, mem_name, addr) VALUES ('BTS', '방탄소년단', '경기');

create VIEW v_height167
AS
    SELECT * FROM member WHERE height >= 167;

SELECT * FROM v_height167;

DELETE FROM v_height167 WHERE height < 167;