# Customer Churn Prediction – End-to-End Data Science Project

![Python](https://img.shields.io/badge/Python-3.10-blue)
![Machine Learning](https://img.shields.io/badge/Machine%20Learning-Random%20Forest-green)
![Power BI](https://img.shields.io/badge/Visualization-Power%20BI-yellow)
![SQL](https://img.shields.io/badge/Database-SQL-orange)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)
## Project Overview

This project builds an end-to-end data science pipeline to analyze and predict **customer churn** in a telecom company. The goal is to identify customers who are likely to leave the service so businesses can take proactive retention actions.

The project demonstrates a complete analytics workflow combining **SQL for data cleaning, Power BI for business insights, and machine learning in Python for predictive modeling.**

---

## Project Workflow

SQL Data Cleaning
↓
Power BI Dashboard Analysis
↓
Data Preprocessing (Python)
↓
Machine Learning Model Training
↓
Model Evaluation
↓
Customer Churn Prediction

---

## Tech Stack

* **Python**
* **Pandas, NumPy**
* **Scikit-learn**
* **Matplotlib, Seaborn**
* **SQL**
* **Power BI**

---

## Machine Learning Model

The project uses a **Random Forest Classifier** to predict whether a customer will churn.

To improve model performance, **GridSearchCV with 5-fold cross-validation** was used for hyperparameter tuning. The following parameters were optimized:

* `n_estimators` – number of trees in the forest
* `max_depth` – maximum depth of decision trees
* `min_samples_split` – minimum samples required to split a node
* `max_features` – number of features considered at each split

This approach helps select the **best-performing model configuration**.

---

## Model Evaluation

The model performance was evaluated using multiple metrics:

* **Accuracy:** ~86%
* **Confusion Matrix**
* **Precision, Recall, F1-score**
* **ROC-AUC Score**
* **ROC Curve**

These metrics provide a comprehensive evaluation of the model’s classification performance.

---

## Feature Importance Insights

Feature importance analysis shows that the most influential factors for churn prediction include:

* **Tenure in Months**
* **Contract Type**
* **Monthly Charges**
* **Total Revenue**
* **Customer Usage Patterns**

Customers with **short tenure and month-to-month contracts** are more likely to churn.

---

## Churn Prediction for New Customers

The trained model was used to predict churn probabilities for new customers.

Customers with churn probability **greater than 0.8** were classified as high-risk churn customers.

The predictions were exported to an Excel file for further business analysis.

---

## Power BI Dashboard

The Power BI dashboard provides business insights including:

* Customer churn distribution
* Contract type analysis
* Revenue trends
* Customer behavior patterns

### Dashboard Preview

![Power BI Dashboard](images/dashboard.png)

---

## Model Visualizations

### ROC Curve

![ROC Curve](images/roc_curve.png)

### Feature Importance

![Feature Importance](images/feature_importance.png)

---
## Repository Structure

```
telecom-customer-churn-analysis

notebook/
    Customer_churn_analysis.ipynb

sql/
    data_cleaning_queries.sql

powerbi/
    churn_dashboard.pbix

outputs/
    churn_predictions.xlsx

images/
    dashboard.png
    roc_curve.png
    feature_importance.png
```

---
## Dataset

This project uses the Telecom Customer Churn dataset, which contains customer demographics, subscribed services, billing information, and churn status.
---
## Model Performance

Random Forest model after hyperparameter tuning using **GridSearchCV** achieved:

* Accuracy: ~86%
* Precision: 0.85
* Recall: 0.66
* F1 Score: 0.74

The model helps identify **high-risk churn customers**, enabling businesses to take proactive retention strategies.
---

## Key Insights

- Customers with **month-to-month contracts** have higher churn rates  
- Customers with **short tenure** are more likely to churn  
- **Higher monthly charges** correlate with increased churn probability 
## Conclusion

This project demonstrates a complete **data analytics and machine learning workflow** combining data cleaning, business intelligence, and predictive modeling.

The Random Forest model provides strong predictive performance and can help businesses **identify high-risk churn customers and design effective retention strategies.**

---

## Author

**Anjali Dogra**
Data Science Aspirant
