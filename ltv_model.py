import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score

df = pd.read_csv("data/customer_ltv_raw.csv")
df["Average_Order_Value"] = df["Average_Order_Value"].fillna(df["Average_Order_Value"].median())
df["Recency_Days"] = df["Recency_Days"].fillna(df["Recency_Days"].median())
df = df.drop_duplicates(subset=["Customer_ID"])

features = ["Frequency","Recency_Days","Average_Order_Value","Tenure_Months"]
X, y = df[features], df["Lifetime_Value"]
X_train,X_test,y_train,y_test = train_test_split(X,y,test_size=0.2,random_state=42)

model = RandomForestRegressor(n_estimators=250, max_depth=12, random_state=42)
model.fit(X_train,y_train)

pred = model.predict(X_test)
print("MAE:", mean_absolute_error(y_test,pred))
print("RMSE:", np.sqrt(mean_squared_error(y_test,pred)))
print("R2:", r2_score(y_test,pred))

df["Predicted_LTV"] = model.predict(df[features])
df["LTV_Segment"] = pd.qcut(df["Predicted_LTV"], 4, labels=["Low","Medium","High","Very High"])
df[["Customer_ID","Predicted_LTV","LTV_Segment"]].to_csv("data/final_ltv_predictions.csv",index=False)
