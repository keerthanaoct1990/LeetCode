/* Write your T-SQL query statement below */
WITH cte AS(
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
    FROM Person
)
DELETE FROM cte WHERE rn>1