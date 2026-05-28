DROP TABLE IF EXISTS silver.order_reviews;

CREATE TABLE silver.order_reviews AS
SELECT review_id
	,order_id
	,CAST(review_score as INTEGER) AS review_score
	,COALESCE(review_comment_title, 'N/A') as review_comment_title
	,COALESCE(review_comment_message, 'N/A') as review_comment_message
	,CAST(review_creation_date as TIMESTAMP) as review_creation_date
	,CAST(review_answer_timestamp as TIMESTAMP) as review_answer_timestamp
FROM staging.order_reviews;

