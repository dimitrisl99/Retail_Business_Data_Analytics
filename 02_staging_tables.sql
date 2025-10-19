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

COPY retail.stg_customer
FROM 'C:\Users\jimyl\Desktop\retail_project\Jean.gr Project - Customer.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

COPY retail.stg_customer_sale
FROM 'C:\Users\jimyl\Desktop\retail_project\Jean.gr Project - customer-sale_id.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

COPY retail.stg_product
FROM 'C:\Users\jimyl\Desktop\retail_project\Jean.gr Project - Product.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

COPY retail.stg_payment
FROM 'C:\Users\jimyl\Desktop\retail_project\Jean.gr Project - Payment.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

-- Check
SELECT COUNT(*) FROM retail.stg_customer;
SELECT COUNT(*) FROM retail.stg_customer_sale;
SELECT COUNT(*) FROM retail.stg_product;
SELECT COUNT(*) FROM retail.stg_payment;