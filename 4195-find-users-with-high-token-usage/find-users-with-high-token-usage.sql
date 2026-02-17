/* Write your T-SQL query statement below */
WITH cte AS(SELECT user_id, COUNT(prompt) AS prompt_count,
ROUND(AVG(CAST(tokens AS FLOAT)), 2) AS avg_tokens, MAX(tokens) AS max_token
 FROM prompts
GROUP BY user_id)
SELECT user_id, prompt_count, avg_tokens FROM cte WHERE
prompt_count >= 3 AND max_token > avg_tokens
ORDER BY avg_tokens DESC, user_id

