USE market_db;

DROP PROCEDURE IF EXISTS ifProc1;
DELIMITER $$
CREATE PROCEDURE ifProc1()
BEGIN
    IF 100 = 100 THEN
        SELECT '100은 100과 같습니다.';
    END IF;
END $$
DELIMITER ;
CALL ifProc1();

DROP PROCEDURE IF EXISTS ifProc2;
DELIMITER $$
CREATE PROCEDURE ifProc2()
BEGIN
    DECLARE mynum INT;
    SET mynum = 200;
    IF mynum = 100 THEN
        SELECT '100입니다.';
    ELSE
        SELECT '100이 아닙니다.';
    END IF;
END $$
DELIMITER ;
CALL ifProc2();

DROP PROCEDURE IF EXISTS ifProc3;
DELIMITER $$
CREATE PROCEDURE ifProc3()
BEGIN
    DECLARE debutdate DATE;
    DECLARE curdate DATE;
    DECLARE days INT;
    SELECT debut_date INTO debutdate FROM market_db.member WHERE mem_id = 'APN';

    SET curdate = CURRENT_DATE();
    SET days = DATEDIFF(curdate, debutdate);

    IF (days / 365) >= 5 THEN
        SELECT CONCAT('데뷔한 지', days, '일이나 지났습니다. 핑순이들 축하합니다!');
    ELSE
        SELECT '데뷔한 지 ' + days + '일 밖에 안되었네요. 핑순이들 화이팅~';
    END IF;
END $$
DELIMITER ;
CALL ifProc3();