DROP TABLE IF EXISTS silver.customers;

CREATE TABLE silver.customers AS
SELECT 
	customer_id
	,customer_unique_id
	,CAST(customer_zip_code_prefix as VARCHAR) as customer_zip_code_prefix
	,INITCAP(TRIM(customer_city)) as customer_city
	,UPPER(customer_state) as customer_state
FROM staging.customers;


