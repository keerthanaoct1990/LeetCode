/* Write your T-SQL query statement below */
WITH first_positive AS (
    SELECT
        patient_id,
        MIN(test_date) AS first_positive_date
    FROM covid_tests
    WHERE result = 'Positive'
    GROUP BY patient_id
),
first_negative_after_positive AS (
    SELECT
        fp.patient_id,
        MIN(ct.test_date) AS first_negative_date
    FROM first_positive fp
    JOIN covid_tests ct
      ON fp.patient_id = ct.patient_id
     AND ct.result = 'Negative'
     AND ct.test_date > fp.first_positive_date
    GROUP BY fp.patient_id
)
SELECT
    p.patient_id,
    p.patient_name,
    p.age,
    DATEDIFF(day, fp.first_positive_date, fn.first_negative_date) AS recovery_time
FROM first_positive fp
JOIN first_negative_after_positive fn
  ON fp.patient_id = fn.patient_id
JOIN patients p
  ON fp.patient_id = p.patient_id
ORDER BY recovery_time ASC, p.patient_name ASC;
