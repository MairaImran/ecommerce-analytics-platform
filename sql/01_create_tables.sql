
 -- 1. Customers Dataset
DROP TABLE IF EXISTS olist_customers_dataset CASCADE;
CREATE TABLE olist_customers_dataset (
    customer_id TEXT PRIMARY KEY NOT NULL,
    customer_unique_id TEXT,
    customer_zip_code_prefix TEXT,
    customer_city TEXT,
    customer_state TEXT
);

-- 2. Orders Dataset
DROP TABLE IF EXISTS olist_orders_dataset CASCADE;
CREATE TABLE olist_orders_dataset (
    order_id TEXT PRIMARY KEY NOT NULL,
    customer_id TEXT REFERENCES olist_customers_dataset (customer_id),
    order_status TEXT,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

-- 3. Order Items Dataset
DROP TABLE IF EXISTS olist_order_items_dataset CASCADE;
CREATE TABLE olist_order_items_dataset (
    order_id TEXT REFERENCES olist_orders_dataset (order_id),
    order_item_id INTEGER,
    product_id TEXT REFERENCES olist_products_dataset (product_id),
    seller_id TEXT,
    shipping_limit_date TIMESTAMP,
    price NUMERIC (10,2),
    freight_value NUMERIC (10,2),
	PRIMARY KEY (order_id, order_item_id)
);


-- 4. Products Dataset
DROP TABLE IF EXISTS olist_products_dataset CASCADE;
CREATE TABLE olist_products_dataset (
    product_id TEXT PRIMARY KEY NOT NULL,
    product_category_name TEXT,
    product_name_lenght INTEGER,
    product_description_lenght INTEGER,
    product_photos_qty INTEGER,
    product_weight_g INTEGER,
    product_length_cm INTEGER,
    product_height_cm INTEGER,
    product_width_cm INTEGER
);
-- 5. Order Payments Dataset
DROP TABLE IF EXISTS olist_order_payments_dataset CASCADE;
CREATE TABLE olist_order_payments_dataset (
    order_id TEXT REFERENCES olist_orders_dataset (order_id),
    payment_sequential INTEGER,
    payment_type TEXT,
    payment_installments INTEGER,
    payment_value NUMERIC,
	PRIMARY KEY (order_id, payment_sequential)
);



