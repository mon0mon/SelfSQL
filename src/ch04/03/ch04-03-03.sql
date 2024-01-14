USE market_db;

DROP PROCEDURE IF EXISTS whileProc;
DELIMITER $$
CREATE PROCEDURE whileProc()
BEGIN
    DECLARE i INT;
    DECLARE hap INT;
    SET i = 1;
    SET hap = 0;

    WHILE (i <= 100)
        DO
            SET hap = hap + i;
            SET i = i + 1;
        END WHILE;

    SELECT '1부터 100까지의 합 ==> ', hap;
END $$
DELIMITER ;
CALL whileProc();

DROP PROCEDURE IF EXISTS whileProc2;
DELIMITER $$
CREATE PROCEDURE whileProc2()
BEGIN
    DECLARE i INT;
    DECLARE hap INT;
    SET i = 1;
    SET hap = 0;

    myWhile:
    WHILE (i <= 100)
        DO
            IF (i % 4 = 0) THEN
                SET i = i + 1;
                ITERATE myWhile;
            END IF;
            SET hap = hap + i;
            IF (hap > 1000) THEN
                LEAVE myWhile;
            END IF;
            SET i = i + 1;
        END WHILE;
    SELECT '1부터 100까지의 합(4의 배수 제외), 1000 넘으면 종료 ==> ', hap;
END $$
DELIMITER ;
CALL whileProc2();