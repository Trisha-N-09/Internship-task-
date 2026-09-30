# Retail Business Performance & Profitability Analysis

**Submitted by:** Trisha N

## Objective
Analyze transactional retail data to uncover profit-draining categories, understand inventory turnover, and identify seasonal product behavior.

## Project structure
- `data/retail_transactions_raw.csv` — raw dataset with deliberate duplicates/missing values for cleaning practice
- `data/retail_transactions_clean.csv` — cleaned dataset
- `data/category_summary.csv` — category KPIs
- `data/subcategory_summary.csv` — sub-category KPIs
- `data/monthly_summary.csv` — monthly sales/profit
- `data/region_summary.csv` — regional KPIs
- `data/season_summary.csv` — seasonal KPIs
- `data/slow_moving_risk.csv` — inventory/profit risk flags
- `sql/retail_analysis.sql` — SQL analysis queries
- `notebooks/Retail_Business_Analysis.ipynb` — Jupyter notebook
- `notebooks/retail_analysis.py` — Python script
- `visualizations/` — analysis charts
- `dashboard/Retail_Dashboard.xlsx` — dashboard-ready Excel workbook
- `reports/Retail_Project_Report.pdf` — 2-page final report

## Cleaning
Raw rows: 2,505
Clean unique transactions: 2,500
Duplicates removed: 5
Missing Discount values filled: 8

## Main results
- Total sales: 2,064,028.91
- Total profit: 246,734.05
- Overall profit margin: 11.95%
- Inventory Days vs Profit correlation: 0.14

## How to run
1. Open `notebooks/Retail_Business_Analysis.ipynb` in Jupyter/Google Colab.
2. If using Colab, upload the whole `data` folder and update the relative paths if required.
3. Run cells from top to bottom.
4. Execute `sql/retail_analysis.sql` after importing `retail_transactions_clean.csv` into your SQL database.

## Dashboard
`Retail_Dashboard.xlsx` contains KPI, category, monthly, and risk sheets. The clean CSV can be imported into Tableau to build an interactive dashboard with filters for Region, Category, Sub-Category and Season.
