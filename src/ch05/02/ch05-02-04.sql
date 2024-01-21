USE NAVER_DB;

DROP TABLE IF EXISTS member;
CREATE TABLE member
(
    mem_id   CHAR(8)          NOT NULL PRIMARY KEY,
    mem_name VARCHAR(10)      NOT NULL,
    height   TINYINT UNSIGNED NULL DEFAULT 160,
    phone1   CHAR(3)          NULL
);
ALTER TABLE member
    ALTER COLUMN phone1 SET DEFAULT '02';

INSERT INTO member
VALUES ('RED', '레드벨벳', 161, '054');
INSERT INTO member
VALUES ('SPC', '우주소녀', DEFAULT, DEFAULT);

SELECT *
FROM member;
