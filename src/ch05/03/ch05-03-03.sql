USE market_db;

CREATE OR REPLACE VIEW v_height167
AS
SELECT *
FROM member
WHERE height >= 167;

INSERT INTO v_height167
VALUES ('TRA', '티아라', 6, '서울', NULL, NULL, 159, '2005-01-01');


SELECT *
FROM v_height167;


ALTER VIEW v_height167
    AS
        SELECT *
        FROM member
        WHERE height >= 167 WITH CHECK OPTION;

INSERT INTO v_height167
VALUES ('TOB', '텔레토비', 4, '영국', NULL, NULL, 140, '1995-01-01');


DROP TABLE IF EXISTS buy, member;

SELECT *
FROM v_height167;

CHECK TABLE v_height167;
