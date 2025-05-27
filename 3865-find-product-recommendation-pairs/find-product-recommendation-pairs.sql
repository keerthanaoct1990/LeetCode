# Write your MySQL query statement below
with cte as(
select p1.*, p2.category
from ProductPurchases p1
left join ProductInfo p2
on p1.product_id = p2.product_id)

select c1.product_id as product1_id, c2.product_id as product2_id, c1.category as product1_category,
       c2.category as product2_category, count(distinct c1.user_id) as customer_count 
from cte c1
inner join cte c2
on c1.user_id = c2.user_id and c1.product_id < c2.product_id
group by product1_id,product2_id, product1_category,product2_category 
having customer_count>=3
order by customer_count desc, product1_id , product2_id 
