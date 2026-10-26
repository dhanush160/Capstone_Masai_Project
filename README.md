# Sales Performance Analysis and Dashboard Project

## Project Overview

This project analyzes sales transactions across multiple regions, customers, products, and sales representatives. The objective is to perform SQL-based data analysis, spreadsheet-based data cleaning and enrichment, dashboard specification design, and AI-assisted analysis with human verification.

The project consists of four parts:

- Part A: SQL Data Analysis
- Part B: Spreadsheet Data Cleaning and Enrichment
- Part C: Dashboard Specification and Business Insights
- Part D: AI-Assisted Analysis with Human-in-the-Loop Verification

---

# Tools Used

## SQL Compiler and Dialect

- SQL Engine: SQLite
- SQL Dialect: SQLite SQL

## Spreadsheet Tool

- Microsoft Excel

## Dashboard Tool

- Tableau Public was **not used to build the dashboard**
- A complete dashboard specification was created in `docs/dashboard_spec.md` so that another analyst can recreate the dashboard in Tableau Public.

---

# Three Most Important Findings

1. The North region generated the highest revenue at **119,300 INR**, outperforming all other regions and indicating strong sales performance.

2. Electronics was the strongest product category with **142,300 INR revenue**, contributing more revenue than Home (**126,400 INR**) and Apparel (**77,500 INR**).

3. Revenue grew significantly during November 2026, reaching **154,800 INR**, making it the highest-performing month and demonstrating increased sales activity toward the end of the reporting period.

---

# Repository Structure and File Index

## Part A – SQL Analysis

| File | Description |
|--------|--------|
| sql/q01.sql | SQL Query 1 |
| sql/q02.sql | SQL Query 2 |
| sql/q03.sql | SQL Query 3 |
| sql/q04.sql | SQL Query 4 |
| sql/q05.sql | SQL Query 5 |
| sql/q06.sql | SQL Query 6 |
| sql/q07.sql | SQL Query 7 |
| sql/q08.sql | SQL Query 8 |
| sql/q09.sql | SQL Query 9 |
| sql/q10.sql | SQL Query 10 |
| sql/q11.sql | SQL Query 11 |
| sql/q12.sql | SQL Query 12 |
| sql/q13.sql | SQL Query 13 |
| results/query_results.md | Results produced from Part A SQL queries |

---

## Part B – Spreadsheet Cleaning and Enrichment

| File | Description |
|--------|--------|
| data/orders_enriched.csv | Enriched order dataset |
| data/orders_clean.csv | Cleaned dataset used for dashboarding |
| docs/spreadsheet_notes.md | Cleaning process, formulas and spreadsheet notes |

---

## Part C – Dashboard Specification

| File | Description |
|--------|--------|
| docs/dashboard_spec.md | Complete dashboard specification, KPI definitions, charts, layout, insights and recommendations |

---

## Part D – AI-Assisted Analysis

| File | Description |
|--------|--------|
| sql/d1_corrected.sql | Corrected SQL query for Scenario D1 |
| docs/ai_log.md | AI prompts, verification process, human-in-the-loop analysis and conclusions |

---

# Dataset Summary

The project uses four source tables:

### reps

Contains sales representative information including:
- Representative ID
- Representative Name
- Region
- Monthly Revenue Target

### customers

Contains customer information including:
- Customer ID
- Name
- City
- Region
- Assigned Representative

### products

Contains product information including:
- Product Name
- Category
- Unit Price

### orders

Contains transactional information including:
- Order ID
- Customer ID
- Product
- Quantity
- Revenue
- Order Status
- Order Month

---

# Assumptions

1. Only orders with status = `completed` are included in revenue analysis unless a question explicitly requires all orders.

2. Revenue calculations use the `amount` field after cleaning and validation.

3. Missing revenue values were calculated using:

```text
quantity × unit_price
```

4. The dashboard revenue KPI is based on completed orders only and reconciles to the SQL analysis.

5. The dashboard specification was prepared for recreation in Tableau Public, but Tableau Public itself was not used during submission preparation.

6. Product categories were treated as:
   - Electronics
   - Apparel
   - Home

---

# Results Summary

- Total Revenue: **346,200 INR**
- Total Units Sold: **106**
- Highest Revenue Region: **North**
- Highest Revenue Category: **Electronics**
- Best Performing Month: **November 2026**

---

# Author

Dhanush Selvakumar

Capstone Project Submission
