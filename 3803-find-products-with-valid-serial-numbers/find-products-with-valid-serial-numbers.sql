SELECT *
FROM products
WHERE ' ' + description + ' ' COLLATE Latin1_General_CS_AS
    LIKE '% SN[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9] %'
ORDER BY product_id;