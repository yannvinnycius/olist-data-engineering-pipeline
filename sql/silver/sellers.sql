DROP TABLE IF EXISTS silver.sellers;

CREATE TABLE silver.sellers AS
SELECT
	seller_id
	,CAST(seller_zip_code_prefix AS VARCHAR) as seller_zip_code_prefix
	,INITCAP(TRIM(seller_city)) as seller_city
	,UPPER(TRIM(seller_state)) as seller_state
FROM staging.sellers;