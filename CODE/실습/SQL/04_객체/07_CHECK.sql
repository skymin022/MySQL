-- CHECK
DROP TABLE IF EXISTS products;

CREATE TABLE products(
    no          BIGINT AUTO_INCREMENT PRIMARY KEY,
    price       INT NOT NULL CHECK(price >= 0),
    discount    INT NOT NULL,
    CONSTRAINT  check_discount CHECK (price >= discount)
);

INSERT INTO products (price, discount)
VALUES (-1000, 0);


INSERT INTO products (price, discount)
VALUES (10000, 20000);

INSERT INTO products (price, discount)
VALUES (20000, 10000);

-- check_constraint 확인
SELECT *
FROM information_schema.CHECK_CONSTRAINTS

TRUNCATE TABLE products

-- check 제약 조건 삭제
ALTER TABLE products
DROP CONSTRAINT products_chk_1;
ALTER TABLE products
DROP CONSTRAINT check_discount;

SELECT *
FROM products