# Write your MySQL query statement below
select u.name, sum(amount) as balance from Users u
inner join Transactions T
on u.account = t.account
group by u.name
having balance > 10000