import pandas as pd
import matplotlib.pyplot as plt

# Load the raw data
df = pd.read_csv("data/retail_transactions_raw.csv")

# Data cleaning
df = df.drop_duplicates(subset=["Order_ID"]).copy()
df["Discount"] = df["Discount"].fillna(0)
df["Order_Date"] = pd.to_datetime(df["Order_Date"])

# EDA
category = df.groupby("Category").agg(
    Sales=("Sales","sum"),
    Profit=("Profit","sum"),
    Avg_Inventory_Days=("Inventory_Days","mean")
).reset_index()
category["Profit_Margin_%"] = category["Profit"] / category["Sales"] * 100

print("Category performance:")
print(category.sort_values("Profit", ascending=False))

corr = df[["Inventory_Days","Profit"]].corr().iloc[0,1]
print(f"Inventory Days vs Profit correlation: {corr:.3f}")

# Visualization
plt.figure(figsize=(9,5))
plt.bar(category["Category"], category["Profit"])
plt.title("Profit by Category")
plt.xlabel("Category")
plt.ylabel("Profit")
plt.tight_layout()
plt.show()
