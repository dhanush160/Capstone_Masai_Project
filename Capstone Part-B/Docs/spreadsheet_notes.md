# Spreadsheet Notes

## Setup

- Created tabs: orders, products
- Imported 90 rows into orders
- Products tab range: A1:C10
- Applied filter: status = completed
- Applied sort: amount descending (largest to smallest)
- Created completed_orders tab from the filtered data
- XLOOKUP test using "Mystery Item" returned UNKNOWN_ITEM

## Formulas

clean_first_name:

```excel
=PROPER(TRIM(C2))
```

clean_last_name:

```excel
=PROPER(TRIM(D2))
```

category:

```excel
=VLOOKUP(I2,products!$A$2:$C$10,2,FALSE)
```

unit_price:

```excel
=XLOOKUP(I2,products!$A$2:$A$10,products!$C$2:$C$10,"UNKNOWN_ITEM")
```

revenue_calc:

```excel
=K2*L*
```

## Aggregate Results

| Metr*c*| Value |
|----------|----------*|
| COUNT | *3 |
| SUM | 346200 |
|*AVERAGE | 5495.238 |
* MIN | 1100 |
| MAX |*15600 |

## Pivot Table 1

* Category | East | North*| South | West | Grand Total |
|--*--------*------:|------:|------:|*-----:|------:|
| Apparel | *0600 | 19400 | 10000*| 37500 | 77500 |
|*Electronics | 21400 | 73400 |*28700 | 18800 | 142*00 |
| Home | 37500 | *6500 | 43800 | 18600*| 126400 |
| Grand Total | *9500 | 119300 | 82500*| 74900 | 346200 |

##*Pivot Table 2

| Order*Month | Count of Order ID | Sum of*Amount |
|-------------|----------*-------:|--------------:*
| 2026-09 | 19*| 98300 |
| 2026-*0 | 20 | 93100 |
|*2026-11 | 24 | *54800 |
| Grand Total | 63 |*346200 |

## Reconciliation

| Met*ic*| Spreadsheet | Part A q05 | Match*M*smatch |
|----------|----------:|-*--------:|----------|
| COUNT | *3 | 63 | Match |
| SUM |*346200 | *46200 | Match |
| AVERAGE |*5495.24 | 5495.*4 | Match |

## Data Validation

#*# Handling*Missing Amounts

Part A query*q02 identified three records with *issing amounts:

* Order ID 1001
* Order ID 1010
- Order ID*1064

These records were excluded *rom completed*order calculations*because their status was not compl*ted.*Therefore they did not affect the*completed_orders summary,*pivots, reconciliation, or*final export.

### Data Type Valid*tion*
- order_id stored*as numbers
- quantity stored as nu*bers
-*amount stored as numbers
- unit_pr*ce stored as*numbers
- revenue_calc stored as n*mbers
- order_month retained as te*t*values such as 2026-09,*2026-10 and*2026-11

### Duplicate Check

*o duplicate order_id values were i*entified in completed_orders*

### Outlier Review

The largest *mount*is:

```text
156*0
```

Order IDs with the largest *mount*

- 1061
* 1065
- 1069
* 1077

### Documentation Decision
*The*products lookup*ranges were anchored using absolut* references so*formulas can be copied*down safely without lookup-range*drift.