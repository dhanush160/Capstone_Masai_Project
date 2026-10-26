# Part D – AI-Assisted Analysis with Human-in-the-Loop Verification

## Task 1 – Five-Part Prompt for Part A q13

### Role
You are an experienced SQL analyst working with SQLite sales databases.

### Task
Write a SQL query to calculate completed-order revenue for each sales representative and assign a performance tier based on revenue.

### Context

Database Tables:

**reps**
- rep_id
- rep_name
- region
- monthly_target

**customers**
- customer_id
- first_name
- last_name
- city
- region
- age
- rep_id

**orders**
- order_id
- customer_id
- item
- quantity
- amount
- status
- order_month

SQL Dialect: SQLite

### Constraints

- Use completed orders only (`status = 'completed'`)
- Revenue must be calculated using `SUM(amount)`
- Tier thresholds:
  - Gold: revenue >= 100000
  - Silver: revenue >= 70000 and < 100000
  - Bronze: revenue < 70000
- Do not use WITH clauses
- Do not use stored procedures

### Format

Return raw SQL only.
Include inline comments explaining major sections of the query.

---

## Task 2 – Inspect Scenario D1

| Defect | Classification | Problem | Correct Fix |
|----------|----------|----------|----------|
| sales table does not exist | Fake method/function | Query references a non-existent table | Use orders joined with customers |
| region_name column does not exist | Fake method/function | No such column exists in the schema | Use customers.region |
| total_sales column does not exist | Fake method/function | No such column exists in the schema | Use amount |
| Aggregate function SUM(total_sales) used inside WHERE clause | Logic Error | Aggregates cannot be filtered in WHERE | Use HAVING SUM(amount) > 80000 |
| "North revenue grew 38%" claim | Phantom Statistic | No supporting calculation or evidence | Verify using actual monthly revenue values |

---

## Task 3 – Verify Scenario D1

### Corrected Query (sql/d1_corrected.sql)

```sql
SELECT
    c.region,
    SUM(o.amount) AS revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.status = 'completed'
GROUP BY c.region
HAVING SUM(o.amount) > 80000
ORDER BY revenue DESC;
```

### Query Result

| Region | Revenue |
|----------|----------:|
| North | 119300 |
| South | 82500 |

### North Month-over-Month Revenue Change

Revenue (2026-09):

```text
56400
```

Revenue (2026-10):

```text
43500
```

Calculation:

```text
((43500 - 56400) / 56400) * 100
```

Result:

```text
-22.8%
```

### Comparison with Assistant Claim

Assistant Claim:

```text
North revenue grew 38%
```

Verified Result:

```text
North revenue declined by 22.8%
```

Conclusion:

The assistant's 38% growth claim is contradicted by the actual data.

---

## Task 4 – Human-in-the-Loop Protocol

### Specification

The objective was to identify regions whose completed-order revenue exceeds 80000 and verify whether the assistant's regional revenue and growth claims were accurate.

### Execution

The assistant-generated query was reviewed against the actual database schema. A corrected query was written using the real tables and columns available in the database.

### Inspection

The original answer contained schema errors, invalid SQL logic, and an unsupported statistical claim. Each issue was documented and corrected before accepting any conclusion.

### Verification

The corrected query was executed successfully and returned two regions:

- North: 119300
- South: 82500

Month-over-month analysis showed that North's revenue changed by -22.8% from September to October.

### Decision

Reject the original assistant answer because it contains non-existent tables, non-existent columns, invalid SQL logic, and a false statistical claim. Accept the corrected version because it runs successfully on the actual schema and all results are supported by verified calculations.

---

## Task 5 – Prompt for Scenario D2

### Role

You are an Excel troubleshooting specialist.

### Task

Determine why a VLOOKUP formula returns a "value not found" error.

### Context

Formula:

```excel
=VLOOKUP(G2,$A$2:$C$10,3,FALSE)
```

Cell G2 contains:

```text
 Smart Watch
```

(leading space before the first letter)

Products table:

```text
A1:C10
```

- Column A contains item names.
- Column C contains unit prices.

Expected result:

```text
4500
```

### Constraints

- Use the provided formula and cell contents.
- Identify the actual root cause.
- Recommend a corrected formula.

### Format

Provide:
1. Root cause
2. Corrected formula
3. Explanation

### Root Cause

The lookup value contains a leading space before "Smart Watch".

Because VLOOKUP is using exact matching (`FALSE`), `" Smart Watch"` does not match `"Smart Watch"` stored in the products table.

### Repaired Formula

```excel
=VLOOKUP(TRIM(G2),$A$2:$C$10,3,FALSE)
```

---

## Task 6 – Skeptical Analyst Check on Part C

### Prompt

#### Role

Act as a skeptical business analyst.

#### Task

Challenge the recommendation:

"Increase Electronics marketing investment in the North region."

Identify unstated assumptions, missing evidence, and places where correlation may have been mistaken for causation.

#### Context

- North revenue = 119300
- Electronics revenue = 142300

#### Format

List assumptions and describe evidence needed to validate each one.

### Unstated Assumptions

#### Assumption 1

North Electronics demand is not already saturated.

**Verification Check:**
Review month-over-month Electronics revenue growth in North.

#### Assumption 2

Additional marketing causes additional sales.

**Verification Check:**
Compare sales results before and after previous marketing campaigns.

#### Assumption 3

Inventory levels can support increased demand.

**Verification Check:**
Review stock availability, fulfilment rate, and back-order levels.

#### Assumption 4

Electronics generates strong profitability, not just high revenue.

**Verification Check:**
Compare profit margins across product categories.
