# Write your MySQL query statement below
SELECT P.project_id, round(avg(experience_years),2) as average_years
FROM Project P LEFT JOIN Employee E
on P.employee_id = E.employee_id
group by project_id