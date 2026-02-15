/* Write your T-SQL query statement below */
with cte as (select * ,
rank() over (partition by product_id order by year) as rn
from Sales)
select product_id, year as first_year, quantity, price from cte
where rn = 1