/******************************************************************************************
                                      RETAIL SALES ANALYSIS
Description:
This SQL script performs data analysis on a retail transactions dataset. 
It covers:
- Data cleaning (handling NULL values)
- Key business insights such as sales trends, customer behavior, and category performance.
- Analytical queries to support decision-making.

Assumptions:
- The database supports standard SQL with functions like EXTRACT, TO_CHAR, and window functions.
******************************************************************************************/

-- =========================
-- 1. CREATE RETAIL TABLE
-- =========================
CREATE TABLE retail (
    transactions_id   INT PRIMARY KEY,
    sale_date         DATE,
    sale_time         TIME,
    customer_id       INT,
    gender            VARCHAR(10),
    age               INT,
    category          VARCHAR(15),
    quantiy           INT,
    price_per_unit    FLOAT,
    cogs              FLOAT,
    total_sale        FLOAT
);

-- View first 10 records
SELECT * FROM retail
LIMIT 10;

-- Count total records
SELECT COUNT(*) AS total_records FROM retail;


-- =========================
-- 2. DATA CLEANING: Remove NULL Values
-- =========================

-- Identify records with NULL values in critical columns
SELECT * FROM retail
WHERE customer_id IS NULL
   OR sale_date IS NULL
   OR transactions_id IS NULL
   OR sale_time IS NULL
   OR gender IS NULL
   OR quantiy IS NULL
   OR category IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

-- Delete records with NULL values
DELETE FROM retail
WHERE customer_id IS NULL
   OR sale_date IS NULL
   OR transactions_id IS NULL
   OR sale_time IS NULL
   OR gender IS NULL
   OR quantiy IS NULL
   OR category IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

-- Verify remaining records
SELECT COUNT(*) AS cleaned_records FROM retail;


-- =========================
-- 3. BASIC EXPLORATION
-- =========================

-- Total distinct customers
SELECT COUNT(DISTINCT customer_id) AS total_customers FROM retail;

-- Distinct product categories
SELECT DISTINCT category FROM retail;


-- =========================
-- 4. ANALYTICAL QUERIES
-- =========================

-- Q1: Retrieve all sales made on '2022-11-05'
SELECT * FROM retail 
WHERE sale_date = '2022-11-05';


-- Q2: Transactions where category is 'Clothing' and quantity > 2 in Nov-2022
SELECT * FROM retail 
WHERE category = 'Clothing' 
  AND quantiy > 2 
  AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11';


-- Q3: Total sales per category
SELECT category, SUM(total_sale) AS total_sales
FROM retail
GROUP BY category
ORDER BY total_sales DESC;


-- Q4: Average age of customers who purchased from 'Beauty' category
SELECT ROUND(AVG(age), 2) AS average_age
FROM retail
WHERE category = 'Beauty';


-- Q5: Transactions where total_sale > 1000
SELECT * FROM retail 
WHERE total_sale > 1000;


-- Q6: Total number of transactions by gender and category
SELECT gender, category, COUNT(*) AS total_transactions
FROM retail
GROUP BY gender, category
ORDER BY gender, category;


-- Q7: Best selling month (by average sale) in each year
SELECT year, month, avg_sale
FROM (
    SELECT 
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER (PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS rank
    FROM retail
    GROUP BY year, month
) AS monthly_sales
WHERE rank = 1;


-- Q8: Top 5 customers based on highest total sales
SELECT customer_id, SUM(total_sale) AS total_sales
FROM retail
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;


-- Q9: Number of unique customers per category
SELECT category, COUNT(DISTINCT customer_id) AS unique_customers
FROM retail 
GROUP BY category;


-- Q10: Number of orders by shift (Morning <12, Afternoon 12-17, Evening >17)
SELECT shift, COUNT(*) AS number_of_orders
FROM (
    SELECT *,
        CASE 
            WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM retail
) AS shifts
GROUP BY shift
ORDER BY number_of_orders DESC;
