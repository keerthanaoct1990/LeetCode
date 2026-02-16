/* Write your T-SQL query statement below */
WITH cte AS(
    SELECT user_id, time_stamp,
ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY time_stamp DESC) AS rn
FROM Logins 
WHERE YEAR(time_stamp)=2020)
SELECT user_id, time_stamp AS last_stamp
FROM cte WHERE rn = 1

