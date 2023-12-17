SHOW DATABASES;

USE self_sql;

CREATE TABLE member
(
    member_id   char(8) PRIMARY KEY,
    member_name char(5) NOT NULL,
    member_addr char(20)
);

CREATE TABLE product
(
    product_name char(4) PRIMARY KEY,
    cost         int NOT NULL,
    make_date    date,
    company      char(5),
    amount       int NOT NULL
);