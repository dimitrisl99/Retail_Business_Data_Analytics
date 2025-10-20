CREATE TABLE retail.stg_customer (
  customer_id  INTEGER,
  gender       TEXT,
  age          INTEGER,
  country      TEXT
);

CREATE TABLE retail.stg_customer_sale (
  sales_id     INTEGER,
  customer_id  INTEGER
);

CREATE TABLE retail.stg_product (
  sale_id      INTEGER,    
  product_id   TEXT,
  category     TEXT,
  brand        TEXT,
  size         TEXT,
  color        TEXT,
  season       TEXT,
  discount_raw     TEXT
);

CREATE TABLE retail.stg_payment (
  sales_id       INTEGER,
  payment_method TEXT
);

-- Check
SELECT 1 FROM retail.stg_customer      LIMIT 0;
SELECT 1 FROM retail.stg_customer_sale LIMIT 0;
SELECT 1 FROM retail.stg_product       LIMIT 0;
SELECT 1 FROM retail.stg_payment       LIMIT 0;

-- Insert the Data 


-- Load data from Google Sheets  (no local file paths)


-- Cleaning stage tables
TRUNCATE retail.stg_customer;
TRUNCATE retail.stg_customer_sale;
TRUNCATE retail.stg_product;
TRUNCATE retail.stg_payment;

-- 1) CUSTOMER
COPY retail.stg_customer (customer_id, gender, age, country)
FROM PROGRAM 'curl -sSL "https://docs.google.com/spreadsheets/d/e/2PACX-1vSajsHDqOE_iUmbsgYrQNdC9y1BjXlnqeS1w2qL8k5owlfYOycDEBJhlqFVRCmVuFvwSHWVRMp-VGJe/pub?gid=1121665675&single=true&output=csv"'
WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ESCAPE '"', ENCODING 'UTF8');

-- 2) CUSTOMER_SALE
COPY retail.stg_customer_sale (sales_id, customer_id)
FROM PROGRAM 'curl -sSL "https://docs.google.com/spreadsheets/d/e/2PACX-1vSajsHDqOE_iUmbsgYrQNdC9y1BjXlnqeS1w2qL8k5owlfYOycDEBJhlqFVRCmVuFvwSHWVRMp-VGJe/pub?gid=785230360&single=true&output=csv"'
WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ESCAPE '"', ENCODING 'UTF8');

-- 3) PRODUCT
COPY retail.stg_product (sale_id, product_id, category, brand, size, color, season, discount_raw)
FROM PROGRAM 'curl -sSL "https://docs.google.com/spreadsheets/d/e/2PACX-1vSajsHDqOE_iUmbsgYrQNdC9y1BjXlnqeS1w2qL8k5owlfYOycDEBJhlqFVRCmVuFvwSHWVRMp-VGJe/pub?gid=0&single=true&output=csv"'
WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ESCAPE '"', ENCODING 'UTF8');

-- 4) PAYMENT
COPY retail.stg_payment (sales_id, payment_method)
FROM PROGRAM 'curl -sSL "https://docs.google.com/spreadsheets/d/e/2PACX-1vSajsHDqOE_iUmbsgYrQNdC9y1BjXlnqeS1w2qL8k5owlfYOycDEBJhlqFVRCmVuFvwSHWVRMp-VGJe/pub?gid=1786090900&single=true&output=csv"'
WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ESCAPE '"', ENCODING 'UTF8');

-- Quick sanity checks
SELECT COUNT(*) FROM retail.stg_customer;
SELECT COUNT(*) FROM retail.stg_customer_sale;
SELECT COUNT(*) FROM retail.stg_product;
SELECT COUNT(*) FROM retail.stg_payment;
