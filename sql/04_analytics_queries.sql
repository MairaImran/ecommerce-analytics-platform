-- Revenue by Payment Type
SELECT 
    payment_type,
    SUM(payment_value) AS total_revenue
FROM olist_order_payments_dataset
GROUP BY payment_type
ORDER BY total_revenue DESC;

-- Orders by State
SELECT 
    c.customer_state,
    COUNT(o.order_id) AS total_orders
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;

-- Orders per Month
SELECT 
    EXTRACT(YEAR FROM order_purchase_timestamp) AS year,
    EXTRACT(MONTH FROM order_purchase_timestamp) AS month,
    COUNT(*) AS orders_per_month
FROM olist_orders_dataset
GROUP BY year, month
ORDER BY year, month;

-- Monthly revenue
SELECT 
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    SUM(p.payment_value) AS revenue
FROM olist_orders_dataset o
JOIN olist_order_payments_dataset p
ON o.order_id = p.order_id
GROUP BY month
ORDER BY month;

-- Customer revenue ranking - Top 10
WITH customer_revenue AS (
    SELECT
        c.customer_unique_id,
        SUM(p.payment_value) AS revenue
    FROM olist_customers_dataset c
    JOIN olist_orders_dataset o
        ON c.customer_id = o.customer_id
    JOIN olist_order_payments_dataset p
        ON o.order_id = p.order_id
    GROUP BY c.customer_unique_id)
SELECT
    customer_unique_id,
    revenue,
    RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
FROM customer_revenue
LIMIT 10;

-- Monthly revenue, Previous month's revenue, Revenue growth amount
WITH sales AS (
    SELECT 
        DATE_TRUNC('month', o.order_purchase_timestamp) AS months,
        SUM(p.payment_value) AS monthly_revenue
    FROM olist_orders_dataset o
    JOIN olist_order_payments_dataset p
        ON o.order_id = p.order_id
    GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
)

SELECT 
    months,
    monthly_revenue,
    LAG(monthly_revenue) OVER (ORDER BY months) AS previous_revenue,
    monthly_revenue 
        - LAG(monthly_revenue) OVER (ORDER BY months) 
        AS revenue_change
FROM sales
ORDER BY months;







