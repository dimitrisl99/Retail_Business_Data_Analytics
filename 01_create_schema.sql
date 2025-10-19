CREATE SCHEMA retail;
SET search_path TO retail, public;
CREATE TABLE retail.stg_general_info (
  sales_id     INTEGER,
  day          DATE,
  time         TEXT,
  temperature  NUMERIC,
  weather      TEXT
);

-- Check that it excist 

SELECT * FROM retail.stg_general_info LIMIT 0;

-- Insert the data

COPY retail.stg_general_info
FROM 'C:\Users\jimyl\Desktop\retail_project\Jean.gr Project - General Info.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

-- Check
SELECT COUNT(*) FROM retail.stg_general_info;
SELECT * FROM retail.stg_general_info LIMIT 5;

