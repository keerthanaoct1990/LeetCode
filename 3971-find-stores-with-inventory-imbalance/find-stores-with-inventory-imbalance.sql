WITH ranked_products AS (
    SELECT 
        store_id,
        product_name,
        price,
        quantity,
        ROW_NUMBER() OVER (
            PARTITION BY store_id 
            ORDER BY price DESC
        ) AS expensive_rank,
        ROW_NUMBER() OVER (
            PARTITION BY store_id 
            ORDER BY price ASC
        ) AS cheap_rank,
        COUNT(*) OVER (
            PARTITION BY store_id
        ) AS product_count
    FROM inventory
),

store_quantities AS (
    SELECT
        store_id,

        -- Most expensive product name and quantity
        MAX(CASE WHEN expensive_rank = 1 THEN product_name END) 
            AS most_exp_product,
        MAX(CASE WHEN expensive_rank = 1 THEN quantity END) 
            AS most_expensive_quantity,

        -- Cheapest product name and quantity
        MAX(CASE WHEN cheap_rank = 1 THEN product_name END) 
            AS cheapest_product,
        MAX(CASE WHEN cheap_rank = 1 THEN quantity END) 
            AS cheapest_quantity,

        MAX(product_count) AS product_count
    FROM ranked_products
    GROUP BY store_id
)

SELECT
    s.store_id,
    s.store_name,
    s.location,

    sq.most_exp_product,

    sq.cheapest_product,

    ROUND(
        sq.cheapest_quantity * 1.0 / sq.most_expensive_quantity,
        2
    ) AS imbalance_ratio

FROM store_quantities sq
JOIN stores s
    ON s.store_id = sq.store_id

WHERE sq.product_count >= 3
  AND sq.most_expensive_quantity < sq.cheapest_quantity

ORDER BY imbalance_ratio DESC,
         s.store_name ASC;