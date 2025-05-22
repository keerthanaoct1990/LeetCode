# Write your MySQL query statement below
select U.name,  CASE 
    WHEN r.user_id IS NULL THEN 0
    ELSE SUM(r.distance)
  END AS travelled_distance
from Users u left join Rides r
on u.id = r.user_id
group by u.id
order by travelled_distance desc, name