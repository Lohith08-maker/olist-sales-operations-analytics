# Olist Sales & Operations Analytics

> Excel + SQL portfolio project focused on sales performance, data validation, and operational insights using the Brazilian E-Commerce Public Dataset by Olist.

## Highlights
- **R$15.84M** total sales value across **99,441 orders** and **112,650 order items**
- **November 2017** was the peak sales month at approximately **R$1.18M**
- **Health & Beauty** led product categories at approximately **R$1.44M**
- **São Paulo (SP)** was the largest customer market

## Skills Demonstrated
**Excel • SQL • Data Validation • Data Cleaning • KPI Reporting • Trend Analysis • Quality Checks**

## Methodology
1. Reviewed relational Olist tables covering orders, customers, items, products, sellers and payments.
2. Joined and aggregated the relevant tables in SQL.
3. Defined **Sales Value = item price + freight value**.
4. Validated KPI logic and documented assumptions before reporting.
5. Built an Excel dashboard for KPI, monthly, category and market analysis.

## Verified KPI Snapshot
| KPI | Result |
|---|---:|
| Total Sales Value | R$15.84M |
| Orders | 99,441 |
| Order Items | 112,650 |
| Average Order Value | R$159.33 |
| Delivered Orders | 96,478 |

## Dashboard
![Olist Sales & Operations Analytics Dashboard](./olist_dashboard_preview.png)

## Data Quality Notes
- Use `customer_unique_id` for repeat-customer analysis; `customer_id` is order-specific.
- Raw source files are not stored in this repository.
- Very small edge-period volumes should be interpreted cautiously.

## Repository
- `Olist_Real_Sales_Operations_Analytics.xlsx` — Excel dashboard and analysis
- `sql/olist_sales_operations_analysis.sql` — reproducible SQL analysis

## Reproduce the SQL Analysis
Download the [Olist Brazilian E-Commerce Public Dataset](https://www.kaggle.com/olistbr/brazilian-ecommerce), load the source CSVs into a PostgreSQL-compatible database, and run `sql/olist_sales_operations_analysis.sql`.

## Portfolio Note
Self-initiated analytics portfolio project using real anonymized commercial data. Results are reported with explicit KPI definitions and data-quality assumptions.
