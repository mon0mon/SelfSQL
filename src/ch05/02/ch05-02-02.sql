USE NAVER_DB;

DROP TABLE IF EXISTS buy, member;
CREATE TABLE member
(
    mem_id   CHAR(8)          NOT NULL PRIMARY KEY,
    mem_name VARCHAR(8)       NOT NULL,
    height   TINYINT UNSIGNED NULL
);
CREATE TABLE buy
(
    num       INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    mem_id    CHAR(8)            NOT NULL,
    prod_name CHAR(6)            NOT NULL,
    FOREIGN KEY (mem_id)
        REFERENCES member (mem_id)
);

DROP TABLE IF EXISTS buy, member;
CREATE TABLE member
(
    mem_id   CHAR(8)          NOT NULL PRIMARY KEY,
    mem_name VARCHAR(8)       NOT NULL,
    height   TINYINT UNSIGNED NULL
);
CREATE TABLE buy
(
    num       INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    mem_id    CHAR(8)            NOT NULL,
    prod_name CHAR(6)            NOT NULL
);
ALTER TABLE buy
    ADD CONSTRAINT FOREIGN KEY (mem_id)
        REFERENCES member (mem_id);

DELETE
FROM buy
WHERE TRUE;
DELETE
FROM member
WHERE TRUE;
INSERT INTO member
VALUES ('BLK', '블랙핑크', 163);
INSERT INTO buy
VALUES (NULL, 'BLK', '지갑');
INSERT INTO buy
VALUES (NULL, 'BLK', '맥북');

SELECT m.mem_id, m.mem_name, b.prod_name
FROM buy b
         INNER JOIN member m ON b.mem_id = m.mem_id;

UPDATE member
SET mem_id = 'PINK'
WHERE mem_id = 'BLK';
DELETE
FROM member
WHERE mem_id = 'BLK';


DROP TABLE IF EXISTS buy;
CREATE TABLE buy
(
    num       INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    mem_id    CHAR(8)            NOT NULL,
    prod_name CHAR(6)            NOT NULL
);
ALTER TABLE buy
    ADD CONSTRAINT FOREIGN KEY (mem_id)
        REFERENCES member (mem_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE;


DELETE
FROM buy
WHERE TRUE;
DELETE
FROM member
WHERE TRUE;
INSERT INTO member
VALUES ('BLK', '블랙핑크', 163);
INSERT INTO buy
VALUES (NULL, 'BLK', '지갑');
INSERT INTO buy
VALUES (NULL, 'BLK', '맥북');

UPDATE member
SET mem_id = 'PINK'
WHERE mem_id = 'BLK';

DELETE
FROM member
WHERE mem_id = 'PINK';

SELECT *
FROM buy;