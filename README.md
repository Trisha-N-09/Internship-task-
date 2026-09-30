# HR Analytics – Predict Employee Attrition

## Project Overview
This project analyzes employee data to identify patterns associated with employee attrition and demonstrates a classification workflow for predicting attrition.

The project follows the supplied internship brief, which asks for EDA on department-wise attrition, salary bands and promotions; a Logistic Regression or Decision Tree model; Power BI visualization; and SHAP-based model explanation. Required deliverables are a Power BI dashboard, model accuracy/confusion matrix, and a PDF of attrition-prevention suggestions. fileciteturn0file0L27-L40

> **Data note:** The included CSV is a small synthetic practice dataset created for demonstrating the project workflow. It is not a real company's employee data and should not be presented as such.

## Objectives
- Explore employee attrition patterns.
- Compare attrition across departments, job levels and overtime status.
- Examine salary, satisfaction and promotion-related patterns.
- Build a binary classification model.
- Evaluate the model using accuracy and a confusion matrix.
- Explain important model features.
- Prepare recommendations that HR teams could investigate.

## Tools Used
- Python
- Pandas
- Matplotlib
- Scikit-learn
- SHAP (optional explainability)
- Power BI

## Project Workflow
1. Import the employee dataset.
2. Check missing values and duplicates.
3. Encode categorical variables.
4. Perform exploratory data analysis.
5. Split data into training and testing sets.
6. Train a Decision Tree classifier.
7. Calculate accuracy and confusion matrix.
8. Review feature importance.
9. Create Power BI-ready summary data.
10. Prepare HR recommendations.

## Important Interpretation Note
The model and findings in this repository are demonstrations using synthetic data. They should not be used to make real employment decisions. A production HR model would require a much larger, representative dataset, fairness testing, privacy controls, validation and human review.

## Deliverables
- `hr_attrition_sample.csv` — synthetic practice dataset
- `hr_attrition_analysis.py` — analysis and model script
- `requirements.txt`
- `project_report.md`
- `attrition_prevention_suggestions.md`
- `outputs/` — charts, confusion matrix, model metrics and Power BI-ready tables

## How to Run
```bash
pip install -r requirements.txt
python hr_attrition_analysis.py
```

## Interview Explanation
**Problem:** Organizations want to understand factors associated with employee attrition and identify employees who may be at higher risk.

**Approach:** I cleaned the HR dataset, explored attrition patterns, encoded categorical variables, trained a Decision Tree classifier, evaluated it with accuracy and a confusion matrix, and reviewed feature importance.

**Outcome:** The project demonstrates an end-to-end HR analytics workflow and shows how data can support further investigation into retention factors.

## Future Improvements
- Use a larger real-world dataset with appropriate permissions.
- Add cross-validation and ROC-AUC/precision/recall.
- Tune model hyperparameters.
- Add SHAP explanations for individual predictions.
- Build an interactive Power BI dashboard.
- Perform fairness and bias checks before any real-world use.
