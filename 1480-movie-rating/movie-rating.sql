WITH TopUser AS (
    SELECT TOP 1 u.name AS results
    FROM users u
    JOIN movierating m ON u.user_id = m.user_id
    GROUP BY u.name
    ORDER BY COUNT(m.user_id) DESC, u.name ASC
),
TopMovie AS (
    SELECT TOP 1 mo.title AS results
    FROM movies mo
    JOIN movierating m ON mo.movie_id = m.movie_id
    WHERE m.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY mo.title
    ORDER BY AVG(m.rating*1.0) DESC, mo.title
)
SELECT results FROM TopUser
UNION ALL
SELECT results FROM TopMovie;