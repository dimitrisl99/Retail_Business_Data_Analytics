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



