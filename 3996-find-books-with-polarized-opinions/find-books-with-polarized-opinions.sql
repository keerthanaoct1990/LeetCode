/* Write your T-SQL query statement below */
with high_low_count AS(
    SELECT book_id, COUNT(session_rating) AS total_sessions,
    MAX(CASE when session_rating >= 4 THEN session_rating END) AS highest_rating,
    MIN(CASE when session_rating <= 2 THEN session_rating END) AS lowest_rating,
    COUNT( CASE WHEN session_rating <=2 OR session_rating >= 4 THEN 1 END) AS extreme_ratings
    FROM reading_sessions
    GROUP BY book_id
    ),
rating_spread AS (
    SELECT *,  highest_rating - lowest_rating AS rating_spread,
    ROUND(extreme_ratings * 1.0 / total_sessions, 2) AS polarization_score 
    FROM high_low_count
        WHERE highest_rating >= 1 AND lowest_rating >= 1  AND total_sessions >= 5
)
SELECT b.book_id, title, author, genre, pages,rating_spread ,polarization_score  FROM rating_spread rs INNER JOIN books b
ON rs.book_id = b.book_id
WHERE polarization_score >= 0.6
ORDER BY polarization_score DESC , title DESC