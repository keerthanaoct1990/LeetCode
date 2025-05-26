# Write your MySQL query statement below
SELECT user_id, 
    ROUND(AVG(CASE WHEN activity_type = 'free_trial' then activity_duration ELSE NULL END), 2)AS trial_avg_duration,
    ROUND(AVG(CASE WHEN activity_type = 'paid' then activity_duration ELSE NULL END), 2)AS paid_avg_duration
FROM UserActivity
group by user_id
having paid_avg_duration is not null
order by user_id