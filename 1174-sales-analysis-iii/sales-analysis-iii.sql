# Write your MySQL query statement below
select p.product_id, p.product_name from Product p
inner join Sales s
on p.product_id = s.product_id
group by product_id
Having Min(s.sale_date)>='2019-01-01'
And Max(s.sale_date)<='2019-03-31';