DROP TABLE IF EXISTS silver.order_payments;


CREATE TABLE silver.order_payments AS
SELECT 
	order_id
	,payment_sequential
	,payment_type
	,payment_installments
	,payment_value
from staging.order_payments;