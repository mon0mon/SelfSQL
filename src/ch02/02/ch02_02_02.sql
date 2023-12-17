USE self_sql;

SELECT *
FROM member;
SELECT *
FROM product;

DELETE
FROM member
WHERE 1=1;

INSERT INTO member VALUES
                       ('test', '나훈아', '경기 부천시 중동'),
                       ('hero', '임영웅', '서울 은평구 증산동'),
                       ('iyou', '아이유', '인천 남구 주안동'),
                       ('jyp', '박진영', '경기 고양시 장항동');

SELECT *
FROM member;

DELETE
FROM product
WHERE 1=1;

INSERT INTO product VALUES
                        ('바나나', 1500, '2021-07-01', '델몬트', 17),
                        ('카스', 2500, '2022-03-01', 'OB', 3),
                        ('삼각김밥', 800, '2023-09-01', 'CJ', 22);

SELECT *
FROM product;