USE market_db;

CREATE TABLE hongong4
(
    tinyint_col  TINYINT,
    smallint_col SMALLINT,
    int_col      INT,
    bigint_col   BIGINT
);

INSERT INTO hongong4
VALUES (127, 32767, 2147483647, 9000000000000000000);


/**
[2024-01-13 22:33:14] [22001][1264] Data truncation: Out of range value for column 'tinyint_col' at row 1
[2024-01-13 22:33:14] [22003][1264] Out of range value for column 'tinyint_col' at row 1
 */
INSERT INTO hongong4
VALUES (128, 32768, 2147483648, 90000000000000000000);

DESC member;

-- mem_number, height 칼럼의 데이터 타입 변경
# START TRANSACTION;
ALTER TABLE member
    MODIFY COLUMN mem_number TINYINT NOT NULL;
ALTER TABLE member
    MODIFY COLUMN height TINYINT UNSIGNED NOT NULL;
# COMMIT;
# ROLLBACK;

-- 기존의 테이블의 데이터 타입으로 변경
# START TRANSACTION;
ALTER TABLE member
    MODIFY mem_number INT NOT NULL;
ALTER TABLE member
    MODIFY height SMALLINT NOT NULL;
# COMMIT;
# ROLLBACK;

/**
PS. START TRANSACTION과 ROLLBACK은 DDL에서는 동작 X
  - https://dev.mysql.com/doc/refman/8.0/en/commit.html
  - https://velog.io/@guns95/MySql-%ED%8A%B8%EB%9E%9C%EC%9E%AD%EC%85%98
*/

DESC member;