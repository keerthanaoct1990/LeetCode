CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* This subquery finds all unique ranks */
        SELECT TOP 1 salary
        FROM (
            SELECT salary, 
                   DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
            FROM Employee
        ) AS SubQuery
        WHERE rnk = @N
    );
END