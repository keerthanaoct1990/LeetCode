# Write your MySQL query statement below
with all_friends as (select requester_id from RequestAccepted
union all
select accepter_id from RequestAccepted)
select requester_id as id, count(requester_id) as num
from all_friends
group by requester_id
order by num desc
limit 1