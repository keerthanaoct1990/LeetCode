WITH cte AS(
    SELECT user_id, reaction, SUM(COUNT(1)) OVER(PARTITION BY user_id) total_reaction,
    COUNT(1) total_group_reaction
    FROM reactions
    GROUP BY user_id, reaction
)
SELECT user_id, reaction AS dominant_reaction,
ROUND((total_group_reaction*1.0)/total_reaction, 2) as reaction_ratio 
FROM cte
WHERE total_reaction > 4 AND ROUND((total_group_reaction*1.0)/total_reaction, 2) >= 0.6
ORDER BY reaction_ratio DESC, user_id