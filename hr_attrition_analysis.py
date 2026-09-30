import os
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import OneHotEncoder
from sklearn.pipeline import Pipeline
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

INPUT_FILE="hr_attrition_sample.csv"
OUT="outputs"
os.makedirs(OUT,exist_ok=True)

df=pd.read_csv(INPUT_FILE)

# Basic data-quality checks
quality=pd.DataFrame({
    "metric":["Rows","Columns","Duplicate rows","Missing cells"],
    "value":[len(df),len(df.columns),int(df.duplicated().sum()),int(df.isna().sum().sum())]
})
quality.to_csv(os.path.join(OUT,"data_quality_summary.csv"),index=False)

# EDA summaries
dept=pd.crosstab(df["Department"],df["Attrition"])
dept.to_csv(os.path.join(OUT,"attrition_by_department.csv"))
level=pd.crosstab(df["JobLevel"],df["Attrition"])
level.to_csv(os.path.join(OUT,"attrition_by_job_level.csv"))
ot=pd.crosstab(df["OverTime"],df["Attrition"])
ot.to_csv(os.path.join(OUT,"attrition_by_overtime.csv"))

# Charts
rate=df.groupby("Department")["Attrition"].mean().sort_values()
plt.figure(figsize=(8,5))
plt.barh(rate.index,rate.values)
plt.xlabel("Attrition Rate")
plt.ylabel("Department")
plt.title("Attrition Rate by Department")
plt.tight_layout()
plt.savefig(os.path.join(OUT,"attrition_by_department.png"),dpi=200)
plt.close()

ot_rate=df.groupby("OverTime")["Attrition"].mean()
plt.figure(figsize=(7,5))
plt.bar(ot_rate.index.astype(str),ot_rate.values)
plt.xlabel("Overtime")
plt.ylabel("Attrition Rate")
plt.title("Attrition Rate by Overtime")
plt.tight_layout()
plt.savefig(os.path.join(OUT,"attrition_by_overtime.png"),dpi=200)
plt.close()

# Model
X=df.drop(columns=["Attrition","EmployeeID"])
y=df["Attrition"]
cat=X.select_dtypes(include=["object"]).columns.tolist()
num=[c for c in X.columns if c not in cat]

pre=ColumnTransformer([("cat",OneHotEncoder(handle_unknown="ignore"),cat)],remainder="passthrough")
model=Pipeline([("prep",pre),("clf",DecisionTreeClassifier(max_depth=4,random_state=42))])

X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.25,random_state=42,stratify=y)
model.fit(X_train,y_train)
pred=model.predict(X_test)

accuracy=accuracy_score(y_test,pred)
cm=confusion_matrix(y_test,pred)
pd.DataFrame({"metric":["Accuracy"],"value":[accuracy]}).to_csv(os.path.join(OUT,"model_metrics.csv"),index=False)
pd.DataFrame(cm,index=["Actual_0","Actual_1"],columns=["Predicted_0","Predicted_1"]).to_csv(os.path.join(OUT,"confusion_matrix.csv"))
with open(os.path.join(OUT,"classification_report.txt"),"w") as f:
    f.write(classification_report(y_test,pred,zero_division=0))

# Power BI-ready table
df.to_csv(os.path.join(OUT,"powerbi_employee_data.csv"),index=False)

print("Model accuracy:",round(accuracy,4))
print("Confusion matrix:")
print(cm)
print("Outputs saved in:",OUT)
