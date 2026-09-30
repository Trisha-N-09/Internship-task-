# Customer Lifetime Value Prediction Model

**Submitted by:** Trisha N

## Objective
Predict customer lifetime value from purchase behavior and segment customers based on predicted LTV.

## Project structure
- `data/customer_ltv_raw.csv` — raw dataset
- `data/customer_ltv_clean.csv` — cleaned dataset
- `data/final_ltv_predictions.csv` — final required LTV prediction CSV
- `notebooks/Customer_LTV_Prediction.ipynb` — complete notebook
- `notebooks/ltv_model.py` — Python model script
- `models/ltv_random_forest_model.joblib` — trained model
- `visualizations/` — model and segmentation charts
- `reports/Customer_LTV_Project_Report.pdf` — final report

## Model
Random Forest Regression using:
- Frequency
- Recency_Days
- Average_Order_Value
- Tenure_Months

## Test-set metrics
- MAE: 113.56
- RMSE: 155.17
- R²: 0.911

## Segmentation
Predicted LTV is divided into four relative groups:
Low, Medium, High, Very High.

## How to run
Open the notebook in Jupyter or Google Colab and run the cells from top to bottom.
