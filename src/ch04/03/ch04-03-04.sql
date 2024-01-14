USE market_db;

PREPARE myQuery FROM 'SELECT * FROM member WHERE mem_id = "BLK"';
EXECUTE myQuery;
DEALLOCATE PREPARE myQuery;

DROP TABLE IF EXISTS gate_table;
CREATE TABLE gate_table
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    entry_time DATETIME
);

SET @curDate = CURRENT_TIMESTAMP();

PREPARE myQuery FROM 'INSERT INTO gate_table VALUES (NULL, ?)';
EXECUTE myQuery USING @curDate;
DEALLOCATE PREPARE myQuery;

SELECT *
FROM gate_table;