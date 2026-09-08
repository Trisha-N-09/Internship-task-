# Task 6 – Sales Trend Analysis Using Aggregations

## Objective
Analyze monthly revenue and order volume using SQL aggregation functions.

## Tool
SQLite (the SQL can be adapted for PostgreSQL/MySQL).

## Dataset
The task brief specifies an `online_sales` table with:
- `order_id`
- `order_date`
- `amount`
- `product_id`

The SQL file assumes that the `online_sales` table has already been imported into the database.

## Files
- `task6_sales_trend_analysis.sql` – complete SQL queries for monthly revenue, order volume, date filtering, and top 3 months.
- `results_table.csv` – example output format showing how the final results should be presented.

## Main Analysis
1. Group orders by year and month.
2. Calculate monthly revenue with `SUM(amount)`.
3. Calculate order volume with `COUNT(DISTINCT order_id)`.
4. Handle missing amounts with `COALESCE`.
5. Sort results chronologically.
6. Find the top 3 months by revenue.

## Interview Questions – Answers

### 1. How do you group data by month and year?
Use a year/month extraction function and include both fields in `GROUP BY`. In SQLite, `strftime('%Y', order_date)` and `strftime('%m', order_date)` are used.

### 2. What's the difference between COUNT(*) and COUNT(DISTINCT col)?
`COUNT(*)` counts rows, while `COUNT(DISTINCT col)` counts only unique non-NULL values in the selected column.

### 3. How do you calculate monthly revenue?
Use `SUM(amount)` and group the records by year and month.

### 4. What are aggregate functions in SQL?
Aggregate functions perform calculations over multiple rows. Common examples are `SUM()`, `COUNT()`, `AVG()`, `MIN()`, and `MAX()`.

### 5. How do you handle NULLs in aggregates?
For amounts, `COALESCE(amount, 0)` can replace NULL with zero before applying `SUM()`. `COUNT(column)` also ignores NULL values.

### 6. What’s the role of ORDER BY and GROUP BY?
`GROUP BY` combines rows with the same grouping values for aggregation. `ORDER BY` sorts the final result.

### 7. How do you get the top 3 months by sales?
Group by year/month, calculate `SUM(amount)`, sort by revenue in descending order, and use `LIMIT 3`.

## Important
The provided task brief does not include the actual `online_sales` dataset values. Therefore, the SQL script is ready to run against the assigned dataset, while `results_table.csv` is an example results format rather than claimed results from an unavailable dataset.
