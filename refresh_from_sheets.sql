
-- REFRESH DATA FROM GOOGLE SHEETS  (run as superuser)

SET datestyle TO 'DMY';

-- 1) CUSTOMER 
TRUNCATE retail.stg_customer;
COPY retail.stg_customer (customer_id, gender, age, country)
FROM PROGRAM 'curl -sSL "https://docs.google.com/spreadsheets/d/e/2PACX-1vSajsHDqOE_iUmbsgYrQNdC9y1BjXlnqeS1w2qL8k5owlfYOycDEBJhlqFVRCmVuFvwSHWVRMp-VGJe/pub?gid=1121665675&single=true&output=csv"'
WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ESCAPE '"', ENCODING 'UTF8');

-- 2) CUSTOMER SALE
TRUNCATE retail.stg_customer_sale;
COPY retail.stg_customer_sale (sales_id, customer_id)
FROM PROGRAM 'curl -sSL "https://docs.google.com/spreadsheets/d/e/2PACX-1vSajsHDqOE_iUmbsgYrQNdC9y1BjXlnqeS1w2qL8k5owlfYOycDEBJhlqFVRCmVuFvwSHWVRMp-VGJe/pub?gid=785230360&single=true&output=csv"'
WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ESCAPE '"', ENCODING 'UTF8');

-- 3) PRODUCT
TRUNCATE retail.stg_product;
COPY retail.stg_product (sale_id, product_id, category, brand, size, color, season, discount_raw)
FROM PROGRAM 'curl -sSL "https://docs.google.com/spreadsheets/d/e/2PACX-1vSajsHDqOE_iUmbsgYrQNdC9y1BjXlnqeS1w2qL8k5owlfYOycDEBJhlqFVRCmVuFvwSHWVRMp-VGJe/pub?gid=0&single=true&output=csv"'
WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ESCAPE '"', ENCODING 'UTF8');

-- 4) GENERAL INFO 
TRUNCATE retail.stg_general_info;
COPY retail.stg_general_info (sales_id, day, time, temperature, weather)
FROM PROGRAM 'curl -sSL "https://docs.google.com/spreadsheets/d/e/2PACX-1vSajsHDqOE_iUmbsgYrQNdC9y1BjXlnqeS1w2qL8k5owlfYOycDEBJhlqFVRCmVuFvwSHWVRMp-VGJe/pub?gid=63291827&single=true&output=csv"'
WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ESCAPE '"', ENCODING 'UTF8');

-- 5) PAYMENT
TRUNCATE retail.stg_payment;
COPY retail.stg_payment (sales_id, payment_method)
FROM PROGRAM 'curl -sSL "https://docs.google.com/spreadsheets/d/e/2PACX-1vSajsHDqOE_iUmbsgYrQNdC9y1BjXlnqeS1w2qL8k5owlfYOycDEBJhlqFVRCmVuFvwSHWVRMp-VGJe/pub?gid=1786090900&single=true&output=csv"'
WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ESCAPE '"', ENCODING 'UTF8');



-- Πόσες γραμμές έχει ο καθένας;
SELECT 'stg_customer'        AS table, COUNT(*) FROM retail.stg_customer
UNION ALL
SELECT 'stg_customer_sale',        COUNT(*) FROM retail.stg_customer_sale
UNION ALL
SELECT 'stg_product',              COUNT(*) FROM retail.stg_product
UNION ALL
SELECT 'stg_general_info',         COUNT(*) FROM retail.stg_general_info
UNION ALL
SELECT 'stg_payment',              COUNT(*) FROM retail.stg_payment;

-- Δείξε 5 γραμμές από το General Info
SELECT * FROM retail.stg_general_info ORDER BY sales_id LIMIT 5;

-- Δείξε 5 γραμμές από κάθε άλλον (προαιρετικά)
SELECT * FROM retail.stg_customer      LIMIT 5;
SELECT * FROM retail.stg_customer_sale LIMIT 5;
SELECT * FROM retail.stg_product       LIMIT 5;
SELECT * FROM retail.stg_payment       LIMIT 5;

