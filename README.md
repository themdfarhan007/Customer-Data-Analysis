# Customer Data Analysis | SQL & Power BI

![Project](https://img.shields.io/badge/Project-Customer%20Data%20Analysis-blue)
![SQL](https://img.shields.io/badge/SQL-MySQL-orange)
![Visualization](https://img.shields.io/badge/Visualization-Power%20BI-yellow)
![Status](https://img.shields.io/badge/Status-Completed-success)

## Project Overview

This project focuses on analyzing retail customer shopping transactions from shopping malls in Istanbul, Turkey.

The objective is to explore customer purchasing patterns, product category performance, payment preferences, and shopping mall revenue using **MySQL and Microsoft Power BI**.

The analysis transforms raw transaction data into meaningful business insights that can support data-driven decision-making and improve retail business strategies.

## Business Objectives

- Analyze customer shopping behavior based on gender and age groups.
- Identify the most popular product categories.
- Understand customer payment method preferences.
- Compare sales performance across shopping malls.
- Calculate total revenue and products sold.
- Develop an interactive Power BI dashboard to communicate key findings.

## Dataset Overview

| Attribute | Details |
|---|---|
| Dataset | Istanbul Retail Shopping Transactions |
| Total Records | 99,457 |
| Total Columns | 10 |
| Time Period | January 2021 – December 2022 |
| Location | Istanbul, Turkey |
| Currency | Turkish Lira (TL) |

### Dataset Columns

- `invoice_no` – Transaction invoice number
- `customer_id` – Customer identifier
- `gender` – Customer gender
- `age` – Customer age
- `category` – Product category
- `quantity` – Number of products purchased
- `price` – Product unit price
- `payment_method` – Payment method used
- `invoice_date` – Transaction date
- `shopping_mall` – Shopping mall name

## Tools & Technologies

| Tool | Purpose |
|---|---|
| MySQL | Data exploration and SQL analysis |
| MySQL Workbench | Database management and query execution |
| Microsoft Excel | Dataset inspection and export |
| Microsoft Power BI | Dashboard development and visualization |
| DAX | Calculated measures and age group classification |
| Git & GitHub | Version control and project hosting |

## Key Performance Indicators (KPIs)

| KPI | Result |
|---|---:|
| Total Shopping Records | 99,457 |
| Products Sold | 298,712 |
| Total Revenue | 251.51 Million TL |
| Shopping Malls | 10 |

**Revenue Calculation:**

`Total Revenue = SUM(quantity × price)`

## Key Business Insights

### 1. Customer Gender Analysis
- Female customers account for approximately 59.81% of shopping records.
- Female customers contribute approximately 59.72% of total revenue.

### 2. Age Group Analysis
- Customers aged 56–69 generate the highest revenue among the defined age groups.
- This age group contributes approximately 67.10 million TL in revenue.

### 3. Product Category Analysis
- Clothing is the highest-revenue product category.
- Shoes and Technology are also significant contributors to sales.

### 4. Payment Method Analysis
- Cash is the most frequently used payment method.
- Credit Card is the second most preferred method.
- Debit Card has the lowest transaction count.

### 5. Shopping Mall Analysis
- Mall of Istanbul and Kanyon have the highest shopping transaction volumes.
- Shopping activity varies across the ten shopping malls.

## Power BI Dashboard

The interactive dashboard provides an overview of customer behavior and retail performance.

### Dashboard Features

**KPI Cards**
- Total Shopping Records
- Products Sold
- Total Revenue
- Number of Shopping Malls

**Visualizations**
- Shopping Records by Gender
- Products Sold by Gender
- Revenue by Gender
- Revenue by Product Category
- Shopping Records by Payment Method
- Revenue by Shopping Mall
- Revenue by Age Group
- Products Sold by Age Group

**Interactive Filters**
- Gender
- Shopping Mall
- Product Category
- Payment Method

The dashboard allows users to explore different customer segments and compare business performance interactively.

## Business Recommendations

1. **Focus on Clothing:** Maintain strong inventory and promotional strategies for the highest-revenue category.
2. **Customer Segmentation:** Develop targeted marketing campaigns based on customer age groups and purchasing patterns.
3. **Payment Experience:** Continue supporting cash and card payment options to accommodate customer preferences.
4. **Mall Performance:** Study successful shopping locations to identify opportunities for improving performance at other malls.
5. **Customer Engagement:** Develop loyalty programs and personalized promotions to encourage repeat purchases.

## Data Cleaning & Validation

The dataset was examined using SQL to assess data quality.

Key validation activities included:

- Checking total record count.
- Identifying missing values.
- Checking duplicate records.
- Reviewing unique invoice and customer identifiers.
- Validating age, quantity, and price ranges.
- Examining transaction date coverage.

The original dataset contained 99,457 records and no NULL values or exact duplicate rows.

## Project Structure

```text
Customer-Data-Analysis/
│
├── 01_Documentation_and_Final_Report/
│   ├── Customer_Data_Analysis_Final_Report.docx
│   ├── Customer_Data_Analysis_Final_Report.pdf
│   └── Customer_Data_Analysis_Project_Diary.docx
│
├── 02_Dataset/
│   └── Customer_Data_Analysis_Dataset.csv
│
├── 03_SQL_Queries/
│   ├── 00_Database_Setup.sql
│   ├── Day_1_Customer_Data_Analysis.sql
│   └── Day_2_Customer_Data_Analysis.sql
│
├── 04_PowerBI/
│   └── Customer_Data_Analysis_Dashboard.pbix
│
├── 05_Charts/
│   └── Customer_Data_Analysis_Chart.png
│
├── 06_Presentation/
│   └── Customer_Data_Analysis_Presentation.pptx
│
├── 07_Final_Submission/
│   ├── Customer_Data_Analysis_Dashboard.pbix
│   ├── Customer_Data_Analysis_Final_Report.pdf
│   └── Customer_Data_Analysis_Presentation.pptx
│
└── README.md
```

## How to Explore This Project

1. Clone or download this repository.
2. Import the CSV dataset into MySQL.
3. Execute the SQL scripts in the `03_SQL_Queries` folder.
4. Open the Power BI dashboard file in Microsoft Power BI Desktop.
5. Explore the interactive visuals and filters.
6. Refer to the final report for detailed findings and recommendations.

**Note:** Configure your own MySQL connection details when setting up the database. Do not store database passwords or credentials in the repository.

## Limitations

- The dataset covers 2021–2022, although the assignment description references a broader period.
- The analysis is based on transaction records and does not establish causal relationships.
- Age groups were defined for analytical purposes.
- Customer transaction counts should not be interpreted as unique customer counts.
- Revenue is calculated using quantity multiplied by unit price.

## Conclusion

This project demonstrates the use of SQL for data exploration and analysis, alongside Power BI for interactive data visualization.

The analysis identifies important customer purchasing patterns, high-performing product categories, payment preferences, and shopping mall performance.

It showcases an end-to-end data analytics workflow, from dataset validation and SQL querying to dashboard development and business recommendations.

---

**Project Category:** Data Analytics | Retail Analytics | Customer Behavior Analysis

**Tools:** MySQL | Excel | Power BI | DAX | GitHub

**Repository:** [Customer Data Analysis](https://github.com/themdfarhan007/Customer-Data-Analysis)