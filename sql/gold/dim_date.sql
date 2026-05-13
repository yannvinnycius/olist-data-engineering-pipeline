DROP TABLE IF EXISTS gold.dim_date;

CREATE TABLE gold.dim_date AS
SELECT DISTINCT
	DATE(order_purchase_timestamp) as full_date
	,EXTRACT(YEAR FROM order_purchase_timestamp ) as year
	,EXTRACT(MONTH FROM order_purchase_timestamp ) as month
	,EXTRACT(DAY FROM order_purchase_timestamp ) as day
	,TRIM(TO_CHAR(order_purchase_timestamp, 'Month')) as month_name
	,EXTRACT(QUARTER FROM order_purchase_timestamp ) as quarter
	,EXTRACT(WEEK FROM order_purchase_timestamp) as week_number
	,TRIM(TO_CHAR(order_purchase_timestamp, 'Day')) as day_name
FROM silver.orders
WHERE order_purchase_timestamp IS NOT NULL;
	