# Olist Sales & Operations Analytics

## Project Overview
Sales and operations analytics project using the **Brazilian E-Commerce Public Dataset by Olist**, a real commercial dataset anonymized for privacy. The data covers Brazilian marketplace orders from 2016–2018 across relational tables for orders, customers, order items, products, sellers and payments.

## Tools
- **Excel** — KPI dashboard, monthly sales trend and product-category analysis
- **SQL** — joins, CTE-style analysis, aggregations, customer/state/category/payment/seller analysis

## KPI Definition
**Sales Value = item price + freight value**

## Verified Snapshot
- Total Sales Value: **R$15.84M**
- Orders: **99,441**
- Order Items: **112,650**
- Average Order Value: **R$159.33**
- Delivered Orders: **96,478**
- Peak sales month: **November 2017 (~R$1.18M)**
- Leading product category: **Health & Beauty (~R$1.44M)**

## Data Modeling Note
Use `customer_unique_id` for repeat-customer analysis. `customer_id` is order-specific and should not be treated as a persistent customer identity.

## Repository Files
- `Olist_Real_Sales_Operations_Analytics.xlsx` — Excel dashboard and analysis
- `sql/olist_sales_operations_analysis.sql` — SQL analysis queries

## Dataset
Brazilian E-Commerce Public Dataset by Olist: https://www.kaggle.com/olistbr/brazilian-ecommerce

## Portfolio Integrity
This project uses real anonymized commercial data and is **not synthetic**. Very small edge-period volumes should be interpreted cautiously.
