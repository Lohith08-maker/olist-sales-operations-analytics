-- Olist Sales & Operations Analytics
-- Sales Value = item price + freight value

-- 1. Overall KPIs
WITH order_sales AS (
    SELECT o.order_id, SUM(oi.price + oi.freight_value) AS sales_value
    FROM olist_orders o
    JOIN olist_order_items oi ON o.order_id = oi.order_id
    GROUP BY o.order_id
)
SELECT ROUND(SUM(sales_value),2) AS total_sales_value,
       COUNT(*) AS total_orders,
       ROUND(AVG(sales_value),2) AS average_order_value
FROM order_sales;

-- 2. Monthly sales performance
WITH order_sales AS (
    SELECT o.order_id, o.order_purchase_timestamp,
           SUM(oi.price + oi.freight_value) AS sales_value
    FROM olist_orders o
    JOIN olist_order_items oi ON o.order_id = oi.order_id
    GROUP BY o.order_id, o.order_purchase_timestamp
)
SELECT DATE_TRUNC('month', order_purchase_timestamp) AS month,
       ROUND(SUM(sales_value),2) AS sales_value,
       COUNT(*) AS orders,
       ROUND(AVG(sales_value),2) AS aov
FROM order_sales
GROUP BY 1 ORDER BY 1;

-- 3. Top product categories
SELECT COALESCE(t.product_category_name_english,p.product_category_name,'Unknown') AS category,
       ROUND(SUM(oi.price + oi.freight_value),2) AS sales_value
FROM olist_order_items oi
JOIN olist_products p ON oi.product_id=p.product_id
LEFT JOIN product_category_name_translation t
  ON p.product_category_name=t.product_category_name
GROUP BY 1 ORDER BY sales_value DESC LIMIT 10;

-- 4. Sales by customer state
SELECT c.customer_state,
       ROUND(SUM(oi.price + oi.freight_value),2) AS sales_value,
       COUNT(DISTINCT o.order_id) AS orders
FROM olist_orders o
JOIN olist_customers c ON o.customer_id=c.customer_id
JOIN olist_order_items oi ON o.order_id=oi.order_id
GROUP BY c.customer_state ORDER BY sales_value DESC;

-- 5. Payment method distribution
SELECT payment_type,
       COUNT(DISTINCT order_id) AS orders,
       ROUND(SUM(payment_value),2) AS payment_value
FROM olist_order_payments
GROUP BY payment_type ORDER BY orders DESC;

-- 6. Delivery performance
SELECT COUNT(*) FILTER (WHERE order_status='delivered') AS delivered_orders,
       ROUND(AVG(EXTRACT(EPOCH FROM
          (order_delivered_customer_date-order_purchase_timestamp))/86400.0)
          FILTER (WHERE order_status='delivered'
          AND order_delivered_customer_date IS NOT NULL),2) AS avg_delivery_days
FROM olist_orders;

-- 7. Repeat customers
-- customer_unique_id is the persistent customer identifier.
WITH customer_orders AS (
    SELECT c.customer_unique_id,
           COUNT(DISTINCT o.order_id) AS order_count
    FROM olist_customers c
    JOIN olist_orders o ON c.customer_id=o.customer_id
    GROUP BY c.customer_unique_id
)
SELECT COUNT(*) AS unique_customers,
       COUNT(*) FILTER (WHERE order_count>1) AS repeat_customers,
       ROUND(100.0*COUNT(*) FILTER (WHERE order_count>1)/COUNT(*),2)
          AS repeat_customer_rate_pct
FROM customer_orders;

-- 8. Seller performance
SELECT seller_id,
       COUNT(DISTINCT order_id) AS orders,
       ROUND(SUM(price + freight_value),2) AS sales_value
FROM olist_order_items
GROUP BY seller_id ORDER BY sales_value DESC LIMIT 20;
