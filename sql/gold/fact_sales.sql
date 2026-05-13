DROP TABLE IF EXISTS gold.fact_sales;

CREATE TABLE gold.fact_sales AS
WITH payments as (
SELECT
	order_id
	,SUM(payment_value) as total_payment_value
FROM silver.order_payments
GROUP BY order_id
)

SELECT
	oi.order_id
	,o.customer_id
	,oi.product_id
	,oi.seller_id
	,DATE(o.order_purchase_timestamp) as purchase_date
	,INITCAP(o.order_status) as order_status
	,oi.price
	,oi.freight_value
	,(oi.price + oi.freight_value) as total_sale_value
	,p.total_payment_value
	,(DATE(o.order_delivered_customer_date) -  DATE(o.order_purchase_timestamp)) as delivery_days
FROM silver.order_items oi

LEFT JOIN silver.orders o
ON oi.order_id = o.order_id

LEFT JOIN payments p
ON oi.order_id = p.order_id;