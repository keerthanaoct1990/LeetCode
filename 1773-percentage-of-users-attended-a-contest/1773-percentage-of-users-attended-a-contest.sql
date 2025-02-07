# Write your MySQL query statement below
SELECT R.contest_id, round((count(U.user_id)/(select count(*) from Users))*100,2) AS percentage FROM
Users U RIGHT JOIN Register R
on R.user_id = U.user_id
group by contest_id
order by percentage DESC, contest_id