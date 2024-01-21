USE NAVER_DB;

DROP TABLE IF EXISTS buy, member;
CREATE TABLE member
(
    mem_id   CHAR(8)          NOT NULL PRIMARY KEY,
    mem_name VARCHAR(10)      NOT NULL,
    height   TINYINT UNSIGNED NOT NULL,
    email    CHAR(30) UNIQUE
);

INSERT INTO member
VALUES ('BLK', '블랙핑크', 163, 'pink@gmail.com');
INSERT INTO member
VALUES ('TWC', '트와이스', 167, NULL);
INSERT INTO member
VALUES ('APN', '에이핑크', 164, 'pink@gmail.com');

DROP TABLE IF EXISTS buy, member;
CREATE TABLE member
(
    mem_id   CHAR(8)          NOT NULL PRIMARY KEY,
    mem_name VARCHAR(10)      NOT NULL,
    height   TINYINT UNSIGNED NOT NULL CHECK ( height >= 100 ),
    phone1   CHAR(3)          NULL
);

INSERT INTO member
VALUES ('BLK', '블랙핑크', 163, NULL);
INSERT INTO member
VALUES ('TWC', '트와이스', 99, NULL);

DROP TABLE IF EXISTS buy, member;
CREATE TABLE member
(
    mem_id   CHAR(8)          NOT NULL PRIMARY KEY,
    mem_name VARCHAR(10)      NOT NULL,
    height   TINYINT UNSIGNED NOT NULL CHECK ( height >= 100 ),
    phone1   CHAR(3)          NULL
);
ALTER TABLE member
    ADD CONSTRAINT CHECK (phone1 IN ('02', '031', '032', '054', '055', '061'));

INSERT INTO member VALUES ('TWC', '트와이스', 167, '02');
INSERT INTO member VALUES ('OMY', '오마이걸', 167, '010');

