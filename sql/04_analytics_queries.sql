-- Monthly revenue
SELECT 
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    SUM(p.payment_value) AS revenue
FROM olist_orders_dataset o
JOIN olist_order_payments_dataset p
ON o.order_id = p.order_id
GROUP BY month
ORDER BY month;

-- Customer revenue ranking
SELECT
    c.customer_unique_id,
    SUM(p.payment_value) AS revenue,
    RANK() OVER (ORDER BY SUM(p.payment_value) DESC) AS rnk
FROM olist_customers_dataset c
JOIN olist_orders_dataset o ON c.customer_id = o.customer_id
JOIN olist_order_payments_dataset p ON o.order_id = p.order_id
GROUP BY c.customer_unique_id;
