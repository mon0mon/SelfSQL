USE market_db;

SELECT m.mem_id, m.mem_name, b.prod_name, m.addr
FROM member m
         LEFT OUTER JOIN buy b ON m.mem_id = b.mem_id
ORDER BY m.mem_id;

SELECT m.mem_id, m.mem_name, b.prod_name, m.addr
FROM buy b
         RIGHT OUTER JOIN member m ON b.mem_id = m.mem_id
ORDER BY m.mem_id;

SELECT DISTINCT m.mem_id, prod_name, mem_name, addr
FROM member m
         LEFT OUTER JOIN buy b ON m.mem_id = b.mem_id
WHERE b.prod_name IS NULL
ORDER BY m.mem_id;

SELECT *
FROM buy
         CROSS JOIN member;

SELECT COUNT(*)
FROM sakila.inventory;
SELECT COUNT(*)
FROM sakila.city;

SELECT COUNT(*) AS "데이터 개수"
FROM sakila.inventory
         CROSS JOIN sakila.city;

SELECT COUNT(*)
FROM sakila.actor;
SELECT COUNT(*)
FROM world.country;

CREATE TABLE cross_table
SELECT *
FROM sakila.actor
         CROSS JOIN world.country;

SELECT *
FROM cross_table
LIMIT 5;

CREATE TABLE emp_table
(
    emp     CHAR(4),
    manager CHAR(4),
    phone   VARCHAR(8)
);

INSERT INTO emp_table
VALUES ('대표', NULL, '0000');
INSERT INTO emp_table
VALUES ('영업이사', '대표', '1111');
INSERT INTO emp_table
VALUES ('관리이사', '대표', '2222');
INSERT INTO emp_table
VALUES ('정보이사', '대표', '3333');
INSERT INTO emp_table
VALUES ('영업과장', '영업이사', '1111-1');
INSERT INTO emp_table
VALUES ('경리부장', '관리이사', '2222-1');
INSERT INTO emp_table
VALUES ('인사부장', '관리이사', '2222-2');
INSERT INTO emp_table
VALUES ('개발팀장', '정보이사', '3333-1');
INSERT INTO emp_table
VALUES ('개발주임', '정보이사', '3333-1-1');

-- plan1
SELECT a.emp "직원", b.emp "직속상관", b.phone "직속상관연락처"
FROM emp_table a
         INNER JOIN emp_table b ON a.manager = b.emp
WHERE a.emp = '경리부장';

-- plan2
SELECT b.emp "직원", a.emp "직속상관", a.phone "직속상관연락처"
FROM emp_table a,
    (SELECT * from emp_table b WHERE b.emp = '경리부장') b
WHERE a.emp = b.manager;