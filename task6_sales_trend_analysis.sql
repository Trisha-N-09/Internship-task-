-- TASK 6: Sales Trend Analysis Using Aggregations
-- Data Analyst Internship
-- SQLite-compatible SQL
-- Dataset/table: online_sales
-- Columns used: order_id, order_date, amount, product_id

-- 1. Check the source data
SELECT * FROM online_sales LIMIT 10;

-- 2. Monthly revenue and order volume
-- strftime('%Y', order_date) extracts the year.
-- strftime('%m', order_date) extracts the month.
SELECT
    CAST(strftime('%Y', order_date) AS INTEGER) AS year,
    CAST(strftime('%m', order_date) AS INTEGER) AS month,
    ROUND(SUM(COALESCE(amount, 0)), 2) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

-- 3. Monthly sales for a specific period
-- Change the dates below when a different period is required.
SELECT
    CAST(strftime('%Y', order_date) AS INTEGER) AS year,
    CAST(strftime('%m', order_date) AS INTEGER) AS month,
    ROUND(SUM(COALESCE(amount, 0)), 2) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
WHERE order_date >= '2024-01-01'
  AND order_date <  '2025-01-01'
GROUP BY year, month
ORDER BY year, month;

-- 4. Top 3 months by sales/revenue
SELECT
    CAST(strftime('%Y', order_date) AS INTEGER) AS year,
    CAST(strftime('%m', order_date) AS INTEGER) AS month,
    ROUND(SUM(COALESCE(amount, 0)), 2) AS monthly_revenue
FROM online_sales
GROUP BY year, month
ORDER BY monthly_revenue DESC
LIMIT 3;

-- 5. Highest order-volume months
SELECT
    CAST(strftime('%Y', order_date) AS INTEGER) AS year,
    CAST(strftime('%m', order_date) AS INTEGER) AS month,
    COUNT(DISTINCT order_id) AS order_volume,
    ROUND(SUM(COALESCE(amount, 0)), 2) AS monthly_revenue
FROM online_sales
GROUP BY year, month
ORDER BY order_volume DESC
LIMIT 3;

-- Notes:
-- SUM() calculates total revenue.
-- COUNT(DISTINCT order_id) counts unique orders.
-- COALESCE(amount, 0) prevents NULL amounts from being added as NULL.
-- GROUP BY creates one result row for each year/month.
-- ORDER BY sorts the result.
