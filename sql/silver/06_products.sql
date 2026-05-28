DROP TABLE IF EXISTS silver.products;

CREATE TABLE silver.products AS
SELECT 
	product_id
	,COALESCE(INITCAP(REPLACE(TRIM(p.product_category_name),'_', ' ')),'Sem Categoria') as product_category_name
	,COALESCE(INITCAP(REPLACE(TRIM(t.product_category_name_english),'_', ' ')), 'Uncategorized') as product_category_name_english
	,product_name_lenght
	,product_description_lenght
	,product_photos_qty
	,product_weight_g
	,product_length_cm
	,product_height_cm
	,product_width_cm
FROM staging.products p
LEFT JOIN staging.product_category_name_translation t
	ON p.product_category_name = t.product_category_name;










