WITH ride_data AS (
    SELECT t.request_at, t.status
    FROM Trips t
    JOIN Users c 
        ON t.client_id = c.users_id AND c.banned = 'No'
    JOIN Users d 
        ON t.driver_id = d.users_id AND d.banned = 'No'
    WHERE t.request_at BETWEEN '2013-01-19' AND '2013-10-03'
),

total_requests AS (
    SELECT 
        request_at,
        COUNT(*) AS total_req
    FROM ride_data
    GROUP BY request_at
),

total_cancels AS (
    SELECT 
        request_at,
        COUNT(*) AS total_cancel
    FROM ride_data
    WHERE status IN ('cancelled_by_driver', 'cancelled_by_client')
    GROUP BY request_at
)

SELECT 
    tr.request_at AS Day,
    ROUND(
        COALESCE(tc.total_cancel, 0) * 1.0 / tr.total_req,
        2
    ) AS "Cancellation Rate"
FROM total_requests tr
LEFT JOIN total_cancels tc
    ON tr.request_at = tc.request_at
ORDER BY tr.request_at;
