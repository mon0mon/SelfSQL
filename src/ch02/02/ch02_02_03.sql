USE self_sql;

DELETE
FROM member
WHERE member_id LIKE 'carry';

INSERT INTO member
VALUES ('carry', '머라이어', '미국 텍사스 사막');

UPDATE member
SET member_addr = '영국 런던 먹자골목'
WHERE member_id LIKE 'carry';

SELECT *
FROM member
WHERE member_id LIKE 'carry';