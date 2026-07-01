SELECT COUNT(*) FROM olist_customers_dataset;
SELECT COUNT(*) FROM olist_orders_dataset;
SELECT COUNT(*) FROM olist_order_items_dataset;
SELECT COUNT(*) FROM olist_products_dataset;
SELECT COUNT(*) FROM olist_order_payments_dataset;

-- Null checks
SELECT * FROM olist_orders_dataset WHERE order_id IS NULL;

-- Orphan check
-- Orders without customers
SELECT o.*
FROM olist_orders_dataset o
LEFT JOIN olist_customers_dataset c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

--Order items without orders
SELECT oi.*
FROM olist_order_items_dataset oi
LEFT JOIN olist_orders_dataset o
ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

-- Payments without orders
SELECT p.*
FROM olist_order_payments_dataset p
LEFT JOIN olist_orders_dataset o
ON p.order_id = o.order_id
WHERE o.order_id IS NULL;
