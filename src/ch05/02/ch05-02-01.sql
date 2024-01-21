USE NAVER_DB;

DROP TABLE IF EXISTS buy, member;
CREATE TABLE member
(
    mem_id   CHAR(8)          NOT NULL PRIMARY KEY,
    mem_name VARCHAR(10)      NOT NULL,
    height   TINYINT UNSIGNED NULL
);

DESCRIBE member;

DROP TABLE IF EXISTS member;
CREATE TABLE member
(
    mem_id   CHAR(8)          NOT NULL,
    mem_name VARCHAR(10)      NOT NULL,
    height   TINYINT UNSIGNED NULL,
    PRIMARY KEY (mem_id)
);

-- 테이블 변경으로 PK 수정
DROP TABLE IF EXISTS member;
CREATE TABLE member
(
    mem_id   CHAR(8)          NOT NULL,
    mem_name VARCHAR(10)      NOT NULL,
    height   TINYINT UNSIGNED NULL
);
ALTER TABLE member
    ADD CONSTRAINT PRIMARY KEY (mem_id);


-- 제약조건으로 PK 이름 재정의
DROP TABLE IF EXISTS member;
CREATE TABLE member
(
    mem_id   CHAR(8)          NOT NULL,
    mem_name VARCHAR(8)       NOT NULL,
    height   TINYINT UNSIGNED NULL,
    CONSTRAINT PRIMARY KEY PK_member_mem_id (mem_id)
);
