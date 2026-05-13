DROP TABLE IF EXISTS gold.dim_sellers;

CREATE TABLE gold.dim_sellers AS

SELECT DISTINCT
	seller_id
	,seller_zip_code_prefix
	,seller_city
	,seller_state
FROM silver.sellers;
