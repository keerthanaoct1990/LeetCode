# Write your MySQL query statement below
with score_card as (
SELECT
    student_id,
    subject,
    FIRST_VALUE(score) OVER(PARTITION BY student_id,subject ORDER BY exam_date) AS first_score,
    FIRST_VALUE(score) OVER(PARTITION BY student_id,subject ORDER BY exam_date DESC) AS latest_score
    FROM Scores
)
select * from score_card
where first_score < latest_score
group by student_id, subject
order by student_id, subject