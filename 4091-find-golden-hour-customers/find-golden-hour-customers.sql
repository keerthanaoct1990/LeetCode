/* Write your T-SQL query statement below */
WITH cte AS(
    SELECT customer_id, 
    COUNT(payment_method) AS total_orders,
    COUNT(order_rating) AS total_rating, 
    ROUND(AVG(CAST(order_rating AS DECIMAL)), 2) AS average_rating,
    COUNT(CASE 
        WHEN CAST(order_timestamp AS TIME)  BETWEEN CAST ('11:00' AS TIME) AND CAST ('14:00' AS TIME)
        OR  CAST(order_timestamp AS TIME)  BETWEEN CAST ('18:00' AS TIME) AND CAST ('21:00' AS TIME)
        THEN 1 END) AS peak_hours
    FROM restaurant_orders
    GROUP BY customer_id
)
SELECT customer_id, total_orders,ROUND((peak_hours*1.0/total_orders)*100, 0) AS peak_hour_percentage, average_rating
    FROM cte
        WHERE total_orders >= 3
        AND  average_rating >= 4.0
         AND (total_rating* 1.0)/total_orders >= 0.5
         AND (peak_hours * 1.0) / total_orders >= 0.6
    ORDER BY average_rating DESC, customer_id DESC