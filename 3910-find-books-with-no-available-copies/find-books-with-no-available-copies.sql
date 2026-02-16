/* Write your T-SQL query statement below */

WITH cte AS(SELECT book_id,
    SUM(CASE WHEN return_date IS NULL THEN 1 ELSE 0 END) AS copies_borrowed
    FROM borrowing_records 
    GROUP BY book_id)
SELECT lb.book_id, title, author, genre,publication_year, copies_borrowed AS current_borrowers 
FROM library_books lb
INNER JOIN cte c
ON lb.book_id = c.book_id
AND total_copies-copies_borrowed = 0
ORDER BY copies_borrowed DESC, title



