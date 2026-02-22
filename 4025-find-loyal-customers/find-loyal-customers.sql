/* Write your T-SQL query statement below */
WITH cte AS(
    SELECT customer_id, 
    COUNT(CASE WHEN transaction_type = 'purchase' THEN 1 END) AS purchase_count,
    COUNT(CASE WHEN transaction_type = 'refund' THEN 1 END) AS refund_count,
    COUNT(transaction_type) AS total_count,
    MAX(transaction_date) AS max_trans_date,
    MIN(transaction_date) AS min_trans_date
    FROM customer_transactions
    GROUP BY customer_id
)
SELECT customer_id
FROM cte
    WHERE purchase_count >=3
        AND DATEDIFF(DAY, min_trans_date, max_trans_date) >= 30
         AND (refund_count * 1.0/total_count) < 0.2
        
    