USE market_db;

SELECT *
FROM buy
         INNER JOIN member ON buy.mem_id = member.mem_id
WHERE buy.mem_id = 'GRL';


SELECT *
FROM buy
         INNER JOIN member
                    ON buy.mem_id = member.mem_id;

-- [23000][1052] Column 'mem_id' in field list is ambiguous
SELECT mem_id, mem_name, prod_name, addr, CONCAT(phone1, phone2) '연락처'
FROM buy
         INNER JOIN member ON buy.mem_id = member.mem_id;


SELECT buy.mem_id, mem_name, prod_name, addr, CONCAT(phone1, phone2) '연락처'
FROM buy
         INNER JOIN member ON buy.mem_id = member.mem_id;

SELECT buy.mem_id, member.mem_name, buy.prod_name, member.addr, CONCAT(member.phone1, member.phone2) '연락처'
FROM buy
         INNER JOIN member ON buy.mem_id = member.mem_id;

SELECT b.mem_id, m.mem_name, b.prod_name, m.addr, CONCAT(m.phone1, m.phone2) '연락처'
FROM buy b
         INNER JOIN member m ON b.mem_id = m.mem_id;

SELECT m.mem_id, m.mem_name, b.prod_name, m.addr
FROM buy b
         INNER JOIN member m ON b.mem_id = m.mem_id
ORDER BY m.mem_id;

SELECT DISTINCT m.mem_id, m.mem_name, m.addr
FROM buy b
         INNER JOIN member m ON b.mem_id = m.mem_id
ORDER BY m.mem_id
