DROP TABLE IF EXISTS gold.dim_customers;

CREATE TABLE gold.dim_customers AS

SELECT DISTINCT
	customer_id
    ,customer_unique_id
    ,customer_zip_code_prefix
    ,customer_city
    ,customer_state
FROM silver.customers;

