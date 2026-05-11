DROP TABLE IF EXISTS silver.orders;

CREATE TABLE silver.orders AS
SELECT order_id
,customer_id
,order_status
,CAST(order_purchase_timestamp AS TIMESTAMP) AS order_purchase_timestamp
,CAST(order_approved_at AS TIMESTAMP) AS order_approved_at
,CAST(order_delivered_carrier_date AS TIMESTAMP) AS order_delivered_carrier_date
,CAST(order_delivered_customer_date AS TIMESTAMP) AS order_delivered_customer_date
,CAST(order_estimated_delivery_date AS TIMESTAMP) AS order_estimated_delivery_date
,COALESCE(EXTRACT(DAY FROM(
CAST(order_delivered_customer_date AS TIMESTAMP) -
CAST(order_purchase_timestamp AS TIMESTAMP))
), 0) AS delivery_days
,COALESCE(EXTRACT(DAY FROM(
CAST(order_delivered_customer_date AS TIMESTAMP) -
CAST(order_estimated_delivery_date AS TIMESTAMP))
), 0) AS delay_days
FROM staging.orders;


