WITH cte AS (
    SELECT 
        CASE
            WHEN MONTH(s.sale_date) IN (12, 1, 2) THEN 'Winter'
            WHEN MONTH(s.sale_date) IN (3, 4, 5) THEN 'Spring'
            WHEN MONTH(s.sale_date) IN (6, 7, 8) THEN 'Summer'
            WHEN MONTH(s.sale_date) IN (9, 10, 11) THEN 'Fall'
        END AS season, 
        p.category, 
        s.quantity, 
        s.price
    FROM sales s
    INNER JOIN products p ON s.product_id = p.product_id
),
aggregated_sales AS (
    SELECT 
        season, 
        category, 
        SUM(quantity) AS total_quantity, 
        SUM(quantity * price) AS total_revenue
    FROM cte
    GROUP BY season, category
),
ranked_categories AS (
    SELECT 
        season, 
        category, 
        total_quantity, 
        total_revenue,
        RANK() OVER (
            PARTITION BY season 
            ORDER BY total_quantity DESC, total_revenue DESC
        ) AS rnk
    FROM aggregated_sales
)
SELECT 
    season, 
    category, 
    total_quantity, 
    total_revenue
FROM ranked_categories
WHERE rnk = 1;
