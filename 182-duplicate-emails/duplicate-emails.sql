/* Write your T-SQL query statement below */
WITH cte AS(SELECT *,
RANK() OVER (PARTITION BY email ORDER BY id) AS rn
FROM Person)
SELECT email FROM cte WHERE rn=2