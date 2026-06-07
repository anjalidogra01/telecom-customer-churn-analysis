# 📡 Telecom Customer Churn Analysis
### End-to-End Data Analytics Project

![Python](https://img.shields.io/badge/Python-3.10-blue)
![Machine Learning](https://img.shields.io/badge/ML-Random%20Forest-green)
![Power BI](https://img.shields.io/badge/Visualization-Power%20BI-yellow)
![SQL](https://img.shields.io/badge/Database-SQL%20Server-orange)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)

---

## 🎯 Project Overview

A complete end-to-end customer churn analytics pipeline for a telecom company — covering data engineering in SQL, machine learning in Python, and business intelligence in Power BI.

**The core problem:** With a churn rate of **26.54%**, the business is losing roughly 1 in 4 customers. This project identifies *who* is at risk, *why* they leave, and *what* actions to take.

**Key technical contribution:** Identified and solved a **distribution shift problem** — a single model cannot fairly predict churn for both existing customers and new joiners. Built a **two-model architecture** to handle each segment correctly.

---

## 🏗️ Project Architecture

```text
Raw Data (SQL Server)
        ↓
   Null Audit & Cleaning
        ↓
   Staging → Production Table
        ↓
   Views: vw_ChurData | vw_JoinData
        ↓
   ┌─────────────────────────────────┐
   │         Python Pipeline         │
   │                                 │
   │  EDA → Feature Engineering      │
   │              ↓                  │
   │  Model 1 (Existing Customers)   │
   │  Model 2 (New Joiners)          │
   └─────────────────────────────────┘
        ↓
   Excel Output (Predictions)
        ↓
   Power BI Dashboard
   Page 1: Historical Analysis
   Page 2: Churn Predictions
```

---

## 🛠️ Tech Stack

| Layer | Tools |
|---------|---------|
| Data Engineering | SQL Server, T-SQL |
| Analysis & ML | Python, Pandas, NumPy, Scikit-learn |
| Visualization | Matplotlib, Seaborn |
| Dashboard | Power BI |
| Model Saving | Joblib |
| Output | Excel |

---

## 🗄️ SQL Layer

| Script | Purpose |
|---------|---------|
| `_null_value_count.sql` | Null audit across all 38 columns |
| `Replacing_Null.sql` | Null replacement with business logic |
| `Create_view.sql` | Separate views for churned vs new customers |
| `basic_count.sql` | Distribution checks by key segments |

### Null Replacement Strategy

- Service columns → `'No'` (NULL means service not subscribed)
- `Internet_Type` → `'None'` (NULL means no internet service)
- Numeric charges → `0` (NULL means no usage)
- `Churn_Category` / `Churn_Reason` → `'Others'`

---

## 🤖 Two-Model Architecture

### The Problem

Applying a single churn model to new joiners produced **85% churn predictions (389/454)** — clearly unrealistic.

New customers naturally have:

- Low tenure
- Low accumulated revenue
- Limited usage history

The original model incorrectly interpreted these characteristics as churn signals.

### The Solution

### Model 1 — Existing Customers (Tenure ≥ 6 Months)

- Full feature set including tenure, revenue, and service usage
- Algorithm: Random Forest + GridSearchCV (5-Fold Cross Validation)
- Accuracy: ~86%

**Best Parameters**

```python
n_estimators = 175
max_depth = 20
min_samples_split = 2
```

### Model 2 — New Joiners (Signup-Time Features Only)

Uses only information available at customer onboarding:

- Contract
- Payment Method
- Offer
- Internet Type
- Monthly Charge
- Age
- Gender
- Married
- Number of Dependents
- Phone Service
- Internet Service
- Paperless Billing

### Output

- Churn Probability (0–100%)
- Risk Tier
- Risk Rank

### Model 2 Results

| Risk Tier | Count | Percentage | Action |
|------------|--------|------------|---------|
| 🔴 High Risk | 156 | 34.4% | Immediate retention outreach |
| 🟠 Medium Risk | 158 | 34.8% | Monitor and nurture |
| 🟢 Low Risk | 140 | 30.8% | Standard onboarding |

---

## 📊 Power BI Dashboard

### Page 1 — Churn Analysis Summary

- KPI Cards
  - Total Customers (7K)
  - Total Churn (1.87K)
  - Churn Rate (26.54%)

- Churn Analysis by:
  - Contract Type
  - Tenure Group
  - Age Group
  - Internet Type
  - Payment Method

- Service Adoption Matrix
  - Yes/No breakdown for all 12 telecom services

- Churn Category Analysis
  - Competitor
  - Dissatisfaction
  - Price
  - Attitude

### Page 2 — Churn Prediction Dashboard

- Risk Tier KPI Cards
- Churn Probability Distribution
- Risk by:
  - Contract Type
  - Age Group
  - Internet Type
  - Payment Method

- Retention Priority Table
  - Sorted using Risk Rank

- Interactive Slicers
  - Risk Tier
  - Contract Type

---

## 🔍 Key Insights

### 1. Contract Type is the Strongest Churn Driver

- Month-to-Month Churn: **45.84%**
- Two-Year Contract Churn: **2.55%**

➡️ Nearly **18× higher churn risk**

### 2. Fiber Optic Customers Churn the Most

- Churn Rate: **40.72%**

Despite being the premium product, customers leave more frequently.

### 3. Competitor Switching is the #1 Churn Reason

- **841 customers** left for competitors

### 4. First Six Months are Critical

- Churn Rate: **54.71%**

Customer experience during onboarding heavily impacts retention.

### 5. Mailed Check Customers Have Highest Churn

- Churn Rate: **36.88%**

Likely less engaged and less likely to use auto-pay.

### 6. Tech Support Improves Retention

- **83.41%** of churned customers did **not** subscribe to premium tech support.

---

## 💡 Business Recommendations

| Priority | Segment | Recommendation | Expected Impact |
|------------|------------|------------------|------------------|
| 1 | Month-to-Month New Joiners | Offer discounted annual plans at signup | Reduce High-Risk customers |
| 2 | High-Risk Fiber Users | Free Premium Tech Support (3 months) | Reduce dissatisfaction |
| 3 | Churn Probability ≥ 70% | Loyalty offers before contract exit | Improve retention |
| 4 | Mailed Check Customers | Incentivize Auto-Pay adoption | Increase engagement |
| 5 | Customers Age 60+ | Dedicated onboarding support | Improve early experience |

---

## 📁 Repository Structure

```text
telecom-customer-churn-analysis/
│
├── Notebook.ipynb
│
├── sql/
│   ├── _null_value_count.sql
│   ├── Replacing_Null.sql
│   ├── Create_view.sql
│   └── basic_count.sql
│
├── dataset/
│   └── Customer_Churn_Predicted.xlsx
│
├── models/
│   ├── model1_existing_customers.pkl
│   ├── model1_label_encoders.pkl
│   ├── model2_new_joiners.pkl
│   └── model2_label_encoders.pkl
│
├── power_bi/
│   └── churn_analysis.pbix
│
└── Report.pdf
```

---

## 📈 Model Performance

| Metric | Score |
|----------|----------|
| Accuracy | ~86% |
| Precision | 0.85 |
| Recall | 0.66 |
| F1 Score | 0.74 |
| ROC-AUC | High |

---

## 🚀 How to Run

```bash
# Clone repository
git clone https://github.com/anjalidogra01/telecom-customer-churn-analysis.git

# Move into project folder
cd telecom-customer-churn-analysis

# Install dependencies
pip install pandas numpy scikit-learn matplotlib seaborn openpyxl joblib

# Launch notebook
jupyter notebook Notebook.ipynb
```

---

## 👩‍💻 Author

### Anjali Dogra
**Data Analyst | Data Science Aspirant**

- GitHub: https://github.com/anjalidogra01
- LinkedIn: https://www.linkedin.com/in/anjali-dogra

---

⭐ If you found this project useful, consider giving it a star.
