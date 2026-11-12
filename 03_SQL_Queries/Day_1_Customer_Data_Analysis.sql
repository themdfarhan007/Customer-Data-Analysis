-- DAY 1: CUSTOMER DATA ANALYSIS
-- =========================================

-- STEP 1: INITIAL DATABASE EXPLORATION

-- Query 1 – Select the project database

USE project_customer_segmentation;

-- Query 2 – Check available tables
SHOW TABLES;

-- Query 3 – Check the structure of our dataset
DESCRIBE customer;

-- Query 4 – View the first 10 records
SELECT *
FROM customer
LIMIT 10;



-- Query 5 – Check the total number of records
SELECT COUNT(*) AS total_records
FROM customer;


-- STEP 2: DATA EXPLORATION AND QUALITY ASSESSMENT

-- Query 1: Verify the number of columns
SELECT COUNT(*) AS total_columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'project_customer_segmentation'
AND TABLE_NAME = 'customer';

-- Query 2: Count unique invoices and customers
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT invoice_no) AS unique_invoices,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM customer;

-- Query 3: Identify duplicate records
SELECT
    invoice_no,
    customer_id,
    gender,
    age,
    category,
    quantity,
    price,
    payment_method,
    invoice_date,
    shopping_mall,
    COUNT(*) AS duplicate_count
FROM customer
GROUP BY
    invoice_no,
    customer_id,
    gender,
    age,
    category,
    quantity,
    price,
    payment_method,
    invoice_date,
    shopping_mall
HAVING COUNT(*) > 1;

-- Query 4: Check missing values
SELECT
    SUM(invoice_no IS NULL) AS missing_invoice_no,
    SUM(customer_id IS NULL) AS missing_customer_id,
    SUM(gender IS NULL) AS missing_gender,
    SUM(age IS NULL) AS missing_age,
    SUM(category IS NULL) AS missing_category,
    SUM(quantity IS NULL) AS missing_quantity,
    SUM(price IS NULL) AS missing_price,
    SUM(payment_method IS NULL) AS missing_payment_method,
    SUM(invoice_date IS NULL) AS missing_invoice_date,
    SUM(shopping_mall IS NULL) AS missing_shopping_mall
FROM customer;

-- Query 5: Check gender distribution
SELECT
    gender,
    COUNT(*) AS total_records
FROM customer
GROUP BY gender;

-- Query 6: Check product categories
SELECT
    category,
    COUNT(*) AS total_records
FROM customer
GROUP BY category
ORDER BY total_records DESC;

-- Query 7: Check payment methods
SELECT
    payment_method,
    COUNT(*) AS total_records
FROM customer
GROUP BY payment_method;

-- STEP 3: DETAILED DATA VALIDATION
-- Query 1: Customer Age Validation
SELECT
    MIN(age) AS minimum_age,
    MAX(age) AS maximum_age,
    ROUND(AVG(age), 2) AS average_age,
    COUNT(*) AS total_records
FROM customer;

-- Query 2: Quantity validation
SELECT
    MIN(quantity) AS minimum_quantity,
    MAX(quantity) AS maximum_quantity,
    ROUND(AVG(quantity), 2) AS average_quantity,
    SUM(CASE WHEN quantity = 0 THEN 1 ELSE 0 END) AS zero_quantity,
    SUM(CASE WHEN quantity < 0 THEN 1 ELSE 0 END) AS negative_quantity
FROM customer;


-- Query 3: Price Validation
SELECT
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price,
    ROUND(AVG(price), 2) AS average_price,
    SUM(CASE WHEN price = 0 THEN 1 ELSE 0 END) AS zero_price,
    SUM(CASE WHEN price < 0 THEN 1 ELSE 0 END) AS negative_price
FROM customer;

-- Query 4: Invoice Date Validation
SELECT
    MIN(invoice_date) AS earliest_date,
    MAX(invoice_date) AS latest_date,
    COUNT(DISTINCT invoice_date) AS unique_dates
FROM customer;

-- Query 5: Shopping Mall Validation
SELECT
    shopping_mall,
    COUNT(*) AS total_records
FROM customer
GROUP BY shopping_mall
ORDER BY total_records DESC;

-- Query 6: Categorical Value Validation
SELECT DISTINCT gender FROM customer;

SELECT DISTINCT category FROM customer;

SELECT DISTINCT payment_method FROM customer;

-- Query 6 A : Gender validation
SELECT DISTINCT gender
FROM customer;

-- Query 6 B : Product category validation
SELECT DISTINCT category
FROM customer;