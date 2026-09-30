-- Retail Business Performance & Profitability Analysis
-- Database: PostgreSQL / MySQL-compatible with minor date-function adjustments if needed

CREATE TABLE retail_transactions (
    order_id VARCHAR(20) PRIMARY KEY,
    order_date DATE,
    region VARCHAR(20),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product VARCHAR(100),
    customer_id VARCHAR(20),
    units INT,
    sales DECIMAL(12,2),
    discount DECIMAL(5,2),
    profit DECIMAL(12,2),
    inventory_days DECIMAL(8,2),
    season VARCHAR(20)
);

-- 1. Total sales, profit and margin
SELECT
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales),0) * 100,2) AS profit_margin_pct
FROM retail_transactions;

-- 2. Profitability by category
SELECT
    category,
    ROUND(SUM(sales),2) AS sales,
    ROUND(SUM(profit),2) AS profit,
    ROUND(SUM(profit)/NULLIF(SUM(sales),0)*100,2) AS profit_margin_pct
FROM retail_transactions
GROUP BY category
ORDER BY profit DESC;

-- 3. Profitability by sub-category
SELECT
    category, sub_category,
    ROUND(SUM(sales),2) AS sales,
    ROUND(SUM(profit),2) AS profit,
    ROUND(AVG(inventory_days),1) AS avg_inventory_days,
    ROUND(SUM(profit)/NULLIF(SUM(sales),0)*100,2) AS profit_margin_pct
FROM retail_transactions
GROUP BY category, sub_category
ORDER BY profit ASC;

-- 4. Region performance
SELECT
    region,
    ROUND(SUM(sales),2) AS sales,
    ROUND(SUM(profit),2) AS profit,
    ROUND(SUM(profit)/NULLIF(SUM(sales),0)*100,2) AS profit_margin_pct
FROM retail_transactions
GROUP BY region
ORDER BY profit DESC;

-- 5. Seasonal performance
SELECT
    season,
    ROUND(SUM(sales),2) AS sales,
    ROUND(SUM(profit),2) AS profit
FROM retail_transactions
GROUP BY season
ORDER BY sales DESC;

-- 6. Monthly trend
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    ROUND(SUM(sales),2) AS sales,
    ROUND(SUM(profit),2) AS profit
FROM retail_transactions
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY year, month;

-- 7. Slow-moving / overstocked sub-categories
SELECT
    sub_category,
    ROUND(AVG(inventory_days),1) AS avg_inventory_days,
    ROUND(SUM(sales),2) AS sales,
    ROUND(SUM(profit),2) AS profit
FROM retail_transactions
GROUP BY sub_category
HAVING AVG(inventory_days) >= 50
ORDER BY avg_inventory_days DESC;

-- 8. Inventory days vs profitability at transaction level
SELECT
    ROUND(CORR(inventory_days, profit),4) AS inventory_profit_correlation
FROM retail_transactions;

-- 9. Products with negative total profit
SELECT
    product,
    ROUND(SUM(sales),2) AS sales,
    ROUND(SUM(profit),2) AS profit
FROM retail_transactions
GROUP BY product
HAVING SUM(profit) < 0
ORDER BY profit ASC;

-- 10. Discount analysis
SELECT
    discount,
    COUNT(*) AS transactions,
    ROUND(SUM(sales),2) AS sales,
    ROUND(SUM(profit),2) AS profit,
    ROUND(SUM(profit)/NULLIF(SUM(sales),0)*100,2) AS margin_pct
FROM retail_transactions
GROUP BY discount
ORDER BY discount;
