DROP TABLE IF EXISTS silver.order_items;

CREATE TABLE silver.order_items AS
SELECT 
	order_id
	,order_item_id
	,product_id
	,seller_id
	,CAST(shipping_limit_date as TIMESTAMP) as shipping_limit_date
	,price
	,freight_value
	,ROUND(CAST(price + freight_value as NUMERIC), 2) as total_item_value
FROM staging.order_items;
