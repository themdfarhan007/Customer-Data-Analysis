-- CUSTOMER DATA ANALYSIS: MYSQL DATABASE SETUP AND SAFE DATE IMPORT
-- Source CSV stores invoice_date as DD-MM-YYYY (example: 10-07-2022).
-- Do NOT import that field directly into a MySQL DATE column.
-- Import the CSV into the staging table below, where invoice_date_text is VARCHAR.

CREATE DATABASE IF NOT EXISTS project_customer_segmentation;
USE project_customer_segmentation;

-- Final, analysis-ready table. invoice_date is a true MySQL DATE.
CREATE TABLE IF NOT EXISTS customer (
    invoice_no VARCHAR(20),
    customer_id VARCHAR(20),
    gender VARCHAR(10),
    age INT,
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    payment_method VARCHAR(20),
    invoice_date DATE,
    shopping_mall VARCHAR(100)
);

-- Import the supplied CSV into THIS staging table using Table Data Import Wizard.
-- Map the CSV invoice_date field to invoice_date_text.
CREATE TABLE IF NOT EXISTS customer_staging (
    invoice_no VARCHAR(20),
    customer_id VARCHAR(20),
    gender VARCHAR(10),
    age INT,
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    payment_method VARCHAR(20),
    invoice_date_text VARCHAR(20),
    shopping_mall VARCHAR(100)
);

-- STEP 1: Check staging import count and date strings before conversion.
SELECT COUNT(*) AS staging_records,
       MIN(invoice_date_text) AS sample_min_text,
       MAX(invoice_date_text) AS sample_max_text
FROM customer_staging;

-- STEP 2: Count rows whose date cannot be parsed as DD-MM-YYYY.
-- Expected invalid_date_rows: 0.
SELECT COUNT(*) AS invalid_date_rows
FROM customer_staging
WHERE invoice_date_text IS NULL
   OR STR_TO_DATE(TRIM(invoice_date_text), '%d-%m-%Y') IS NULL;

-- STEP 3: Transfer valid rows and convert the date explicitly.
-- The NOT EXISTS condition prevents duplicate invoice numbers if this
-- transfer statement is run again. Review invoice_no uniqueness in your data.
INSERT INTO customer (
    invoice_no, customer_id, gender, age, category, quantity, price,
    payment_method, invoice_date, shopping_mall
)
SELECT
    s.invoice_no, s.customer_id, s.gender, s.age, s.category, s.quantity,
    s.price, s.payment_method,
    STR_TO_DATE(TRIM(s.invoice_date_text), '%d-%m-%Y'),
    s.shopping_mall
FROM customer_staging AS s
WHERE s.invoice_date_text IS NOT NULL
  AND STR_TO_DATE(TRIM(s.invoice_date_text), '%d-%m-%Y') IS NOT NULL
  AND NOT EXISTS (
      SELECT 1 FROM customer AS c WHERE c.invoice_no = s.invoice_no
  );

-- STEP 4: Verify the final table. Expected values for the supplied CSV:
-- 99,457 rows; 2021-01-01 earliest; 2023-03-08 latest; 797 distinct dates.
SELECT
    COUNT(*) AS total_records,
    MIN(invoice_date) AS earliest_invoice_date,
    MAX(invoice_date) AS latest_invoice_date,
    COUNT(DISTINCT invoice_date) AS distinct_invoice_dates
FROM customer;
