/* Write your T-SQL query statement below */
SELECT user_id, email
FROM Users
WHERE
    -- exactly one @ symbol
    email LIKE '%_@_%'
    AND email NOT LIKE '%@%@%'
    
    -- ends with .com
    AND email LIKE '%.com'
    
    -- only allowed characters before @
    AND LEFT(email, CHARINDEX('@', email) - 1) NOT LIKE '%[^A-Za-z0-9_]%'
    
    -- only letters in domain name
    AND SUBSTRING(
        email,
        CHARINDEX('@', email) + 1,
        LEN(email) - CHARINDEX('@', email) - 4
    ) NOT LIKE '%[^A-Za-z]%'

ORDER BY user_id;
