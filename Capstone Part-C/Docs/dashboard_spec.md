# Dashboard Specification

## Data Source

Data source: data/orders_clean.csv

| Column | Type |
|----------|----------|
| order_id | Dimension |
| order_month | Dimension |
| clean_first_name | Dimension |
| clean_last_name | Dimension |
| region | Dimension |
| rep_name | Dimension |
| item | Dimension |
| category | Dimension |
| status | Dimension |
| unit_price | Measure |
| quantity | Measure |
| amount | Measure |
| revenue_calc | Measure |

## KPI Cards

### Total Revenue

Field:
SUM(amount)

Value:
346200 INR

This KPI equals Part A q05 total_revenue (346200).

### Total Units Sold

Field:
SUM(quantity)

Value:
106 units

## Revenue by Region

Chart Type: Bar Chart

Rows Shelf:
region

Columns Shelf:
SUM(amount)

Colour Shelf:
region

Justification:
A bar chart is appropriate for comparing revenue across regions.

| Region | Revenue |
|----------|----------:|
| North | 119300 |
| South | 82500 |
| West | 74900 |
| East | 69500 |
| Total | 346200 |

## Revenue by Category

Chart Type: Bar Chart

Rows Shelf:
category

Columns Shelf:
SUM(amount)

Colour Shelf:
category

Justification:
A bar chart clearly compares category performance.

| Category | Revenue |
|-----------|----------:|
| Electronics | 142300 |
| Home | 126400 |
| Apparel | 77500 |
| Total | 346200 |

## Revenue Trend by Month and Category

Chart Type: Line Chart

Rows Shelf:
SUM(amount)

Columns Shelf:
order_month

Colour Shelf:
category

Justification:
A line chart is suitable for showing change over time and comparing category trends by month.

| Month | Apparel | Electronics | Home | Total |
|--------|---------:|------------:|------:|-------:|
| 2026-09 | 26600 | 26100 | 45600 | 98300 |
| 2026-10 | 14700 | 37700 | 40700 | 93100 |
| 2026-11 | 36200 | 78500 | 40100 | 154800 |
| Total | 77500 | 142300 | 126400 | 346200 |

## Region x Category Detail

Chart Type: Text Table

Rows Shelf:
region

Columns Shelf:
category

Text:
SUM(amount)

Justification:
A text table provides exact values for detailed analysis.

| Category | East | North | South | West | Grand Total |
|-----------|------:|------:|------:|------:|------:|
| Apparel | 10600 | 19400 | 10000 | 37500 | 77500 |
| Electronics | 21400 | 73400 | 28700 | 18800 | 142300 |
| Home | 37500 | 26500 | 43800 | 18600 | 126400 |
| Grand Total | 69500 | 119300 | 82500 | 74900 | 346200 |

## Dashboard Layout

Top to bottom layout:

1. KPI Cards
2. Category Filter
3. Revenue Trend by Month and Category
4. Revenue by Region
5. Revenue by Category
6. Region x Category Detail

Containers:

- Vertical container for overall dashboard layout
- Horizontal container for KPI cards
- Horizontal container for Revenue by Region and Revenue by Category
- Vertical container for charts and detail table

Filter:

- Category filter placed directly below KPI cards
- Applied to all worksheets using the same data source

Use as Filter Behaviour:

When a user clicks a region bar in Revenue by Region with "Use as Filter" enabled, all other charts and the detail table update to display information only for the selected region.

## Visualization Summary

The dashboard summarizes completed-order performance across regions, categories and months. It provides KPI visibility, category comparisons, regional comparisons and month-over-month revenue trends using data from orders_clean.csv.

## Summary Analysis

1. North generated the highest revenue at 119300 INR, significantly higher than East at 69500 INR. This indicates North is the strongest performing region.

2. Electronics generated 142300 INR, making it the highest revenue category, outperforming Apparel at 77500 INR by 64800 INR.

3. Revenue increased from 98300 INR in September to 154800 INR in November, representing the strongest monthly performance and indicating improved sales activity toward the end of the period.

## Recommendations

1. North Region - Expand promotional activity and inventory support for Electronics because North generated 119300 INR revenue. Success metric: monthly revenue growth in North.

2. East Region - Launch targeted promotional campaigns because East generated only 69500 INR, the lowest regional revenue. Success metric: increase in revenue and units sold from East.

3. Electronics Category - Prioritize stock availability and marketing investment because Electronics generated 142300 INR, the largest category revenue. Success metric: category revenue and quantity sold per month.

## Reconciliation

| Source | Revenue |
|----------|----------:|
| Total Revenue KPI | 346200 |
| Revenue by Region Total | 346200 |
| Revenue by Category Total | 346200 |
| Part B Pivot Grand Total | 346200 |

All values reconcile successfully and match.