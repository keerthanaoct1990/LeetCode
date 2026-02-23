

with cte as (
select user_id
,first_value(event_date) over (partition by user_id order by event_date asc ) as first_login
,first_value(plan_name) over (partition by user_id order by event_date desc ) current_plan
,first_value(monthly_amount) over (partition by user_id order by event_date desc ) current_monthly_amount
,first_value(event_date) over (partition by user_id order by event_date desc ) as last_ogin
,count(case when event_type ='downgrade' then 1 end) over (partition by user_id) as cnt_upgrade
,count(case when event_type ='cancel' then 1 end)over (partition by user_id) as cnt_cancel
,row_number() over (partition by user_id order by event_date desc) as rn 
,max(monthly_amount) over (partition by user_id) as max_historical_amount
from subscription_events )

select user_id
,current_plan,current_monthly_amount 
,max_historical_amount
,datediff(day,first_login,last_ogin) as days_as_subscriber
from cte 
where rn=1 and cnt_upgrade >0 and cnt_cancel = 0
and datediff(day,first_login,last_ogin) >=60 
and current_monthly_amount<0.5*max_historical_amount 
order by days_as_subscriber desc ,user_id asc 