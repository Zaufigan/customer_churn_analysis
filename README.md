# 📊 Customer Churn Analysis

## Overview

This project analyzes customer churn to understand **customer retention, churn behavior, revenue at risk, and customer support factors associated with churn**.

The project follows an end-to-end data analytics workflow using Python for data loading, EDA, data cleaning, feature engineering, statistical analysis, and visualization, followed by SQL analysis and Power BI dashboard development.

The analysis combines **customer, subscription, and customer-support data** to generate actionable business insights.

---

## 🎯 Objectives

* Measure overall customer churn and retention
* Identify churn patterns across subscription and plan types
* Analyze customer revenue and value
* Identify revenue at risk from churned customers
* Analyze the relationship between customer support escalations and churn
* Segment customers based on churn risk
* Build an interactive Power BI dashboard for business reporting

---

## 📚 Libraries

The Python analysis uses:

```python
import sqlite3
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
import seaborn as sns
```

Statistical analysis also uses functions from **SciPy**, including Chi-square and Mann–Whitney U tests.

---

## 📁 Dataset

The project uses a SQLite database containing three tables:

* `db_customer` – customer demographic information
* `db_subscription` – subscription, plan, contract, charges, churn and cancellation information
* `db_support` – customer complaints, escalations and CSAT information

The database contains **1,500 customers**.

### Key Data Fields

**Customer Data**

* Customer ID
* Customer Name
* Country
* State
* Gender
* Date of Birth

**Subscription Data**

* Subscription Start Date
* Subscription Type
* Renewal Date
* Plan Type
* Contract Type
* Cancellation Date
* Cancellation Reason
* Monthly Charges
* CLTV
* Churn Score

**Support Data**

* Complaint Date
* Escalations
* CSAT Score
* Complaint Count

---

## 🛠️ Tools & Technologies

| Tool               | Purpose                                  |
| ------------------ | ---------------------------------------- |
| Python             | Data loading, cleaning, EDA and analysis |
| Pandas             | Data manipulation and preprocessing      |
| NumPy              | Feature engineering and calculations     |
| Matplotlib         | Data visualization                       |
| Seaborn            | Statistical visualization                |
| SQLite             | Source database and data extraction      |
| MySQL / PostgreSQL | SQL-based business analysis              |
| Power BI           | Interactive dashboard                    |
| Gamma              | Presentation creation                    |
| Jupyter Notebook   | Analysis and documentation               |

---

## 🔄 Project Workflow

### 1. Data Loading

Connected to the SQLite database using `sqlite3` and extracted the three available tables into Pandas DataFrames.

```text
SQLite Database
      ↓
Customer
Subscription
Support
      ↓
Pandas DataFrames
```

---

### 2. Exploratory Data Analysis

Performed EDA to understand the structure and quality of the data.

Activities included:

* Inspecting datasets using `head()`
* Checking data types using `info()`
* Examining missing values
* Reviewing categorical values
* Understanding customer, subscription and support data
* Analyzing churn patterns

The customer table contains 1,500 records and initially includes 8 columns.

---

### 3. Data Cleaning

#### Customer Data

The customer dataset was cleaned by:

* Renaming `name` to `customer_name`
* Removing unnecessary `interests` and `pincode` columns
* Converting `dob` to datetime
* Standardizing gender values
* Handling missing country values using state-to-country mapping

#### Subscription Data

The subscription data was cleaned by:

* Converting date columns to datetime
* Creating `churn_status`
* Creating `churn_flag`
* Handling missing cancellation reasons
* Creating a cleaned cancellation-reason field

Customers were classified as:

```text
Active  → No cancellation date
Churned → Cancellation date available
```

The dataset contains **1,143 active customers and 357 churned customers**.

#### Support Data

The support table was cleaned by:

* Removing unnecessary columns
* Converting `complaint_date` to datetime
* Calculating complaint counts per customer
* Handling duplicate customer support records before merging

---

## ⚙️ Feature Engineering

Several analytical features were created to support deeper analysis.

### Churn Flag

```text
1 → Churned
0 → Active
```

### Tenure

Customer tenure was calculated using the subscription start date and either the cancellation date or the current date for active customers.

### Churn Risk

Customers were segmented using their existing churn score:

| Churn Score | Risk   |
| ----------- | ------ |
| < 50        | Low    |
| 50–69       | Medium |
| ≥ 70        | High   |

---

## 🧮 Key Metrics

The analysis calculated several important business KPIs:

* Churn Rate
* Retention Rate
* Churn by Plan Type
* Revenue by State
* Customer Count by State
* Revenue by Subscription Type
* Average Revenue Per User (ARPU)
* Average Customer Tenure
* Revenue at Risk
* Escalation Rate
* Average Complaints per User
* Escalation vs Churn Correlation

---

## 🗄️ SQL Analysis

The cleaned data was also analyzed using SQL to answer business questions.

SQL analysis focuses on:

* Customer segmentation
* Churn analysis
* Subscription performance
* Revenue analysis
* Customer-support performance
* Aggregations and grouping
* Filtering and sorting
* Joins
* Business KPIs

SQL queries are included in the project repository.

---

## 📊 Data Visualization

Python visualizations were created using **Matplotlib and Seaborn** to explore customer churn patterns.

One of the analyses tracks **monthly churn trends** using cancellation dates, allowing churn behavior to be examined over time.

---

## 📈 Statistical Analysis

Statistical tests were used to investigate relationships between churn and customer characteristics.

### Contract Type vs Churn

A Chi-square test was performed to examine whether churn is associated with contract type.

### Plan Type vs Churn

A Chi-square test was also used to examine whether churn depends on plan type.

### Monthly Charges vs Churn

A Mann–Whitney U test was used to compare monthly charges between active and churned customers.

### Churn Score vs Churn Status

A Mann–Whitney U test was used to determine whether churn scores differ between active and churned customers.

---

## 📊 Power BI Dashboard

An interactive **Power BI dashboard** was created to present the analysis in a business-friendly format.

### Dashboard Includes

* Total Customers
* Churned Customers
* Active Customers
* Churn Rate
* Retention Rate
* Revenue at Risk
* Churn Trends
* Churn by Plan Type
* Churn by Contract Type
* Customer Support Analysis
* Escalation Analysis
* Churn Risk Segmentation
* Interactive Slicers and Filters

> Add your Power BI dashboard screenshot here.

```text
![Customer Churn Dashboard](images/customer_churn_dashboard.png)
```

---

## 📌 Key Results & Business Insights

### Customer Churn

The overall churn rate is **23.8%**, with **357 out of 1,500 customers churned**, while 76.2% remain active.

### Revenue at Risk

Churned customers represent approximately **Rs. 5,645.43K in monthly revenue at risk**.

### Customer Support & Churn

The analysis identified a **0.63 correlation between escalations and churn**, indicating a notable relationship between customer support escalations and churn behavior.

### Customer Complaints

Customers generated an average of **0.52 complaints per user**, with an overall escalation rate of **13.13%**.

### Customer Revenue

The calculated **ARPU is 15.69**, providing an overview of average monthly revenue per customer.

### Churn Risk

Customers were categorized into **Low, Medium, and High churn-risk groups** using churn scores. This segmentation can help prioritize customer-retention activities.

---

## 📑 Report

A detailed project report was created covering:

* Business Problem
* Data Understanding
* Data Cleaning
* Exploratory Data Analysis
* Feature Engineering
* SQL Analysis
* Statistical Analysis
* Power BI Dashboard
* Business Insights
* Recommendations

---

## 🎤 Presentation

A professional presentation was created using **Gamma** to communicate the project:

* Business objective
* Analytical approach
* Key KPIs
* Major findings
* Dashboard
* Business recommendations

---

## 📂 Project Structure

```text
Customer-Churn-Analysis/
│
├── data/
│   └── customer_churn_large.db
│
├── notebooks/
│   └── Customer_Churn_analysis.ipynb
│
├── sql/
│   └── churn_analysis.sql
│
├── dashboard/
│   └── Customer_Churn_Dashboard.pbix
│
├── report/
│   └── Customer_Churn_Report.pdf
│
├── presentation/
│   └── Customer_Churn_Presentation.pdf
│
├── images/
│   └── customer_churn_dashboard.png
│
└── README.md
```

---

## ▶️ How to Run

### 1. Clone the Repository

```bash
git clone <your-repository-url>
cd Customer-Churn-Analysis
```

### 2. Install Required Libraries

```bash
pip install pandas numpy matplotlib seaborn scipy
```

### 3. Run the Jupyter Notebook

```bash
jupyter notebook
```

Open:

```text
Customer_Churn_analysis.ipynb
```

### 4. Database

Place the SQLite database inside:

```text
data/customer_churn_large.db
```

The notebook connects to the database and loads the customer, subscription, and support tables.

### 5. SQL Analysis

Import the cleaned data into **MySQL/PostgreSQL** if reproducing the SQL analysis, then execute the queries provided in the `sql` folder.

### 6. Power BI

Open the `.pbix` file using Power BI Desktop and refresh the data connection if required.

---

## 🎯 Skills Demonstrated

* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn
* SQLite
* SQL
* Exploratory Data Analysis
* Data Cleaning
* Feature Engineering
* Statistical Analysis
* Power BI
* Data Visualization
* Business Intelligence
* Business Analytics
* Data Storytelling

---

👤 Author

Zaufigan

Data Analytics | Python | SQL | Power BI
