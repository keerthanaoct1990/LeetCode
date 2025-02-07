# Write your MySQL query statement below
SELECT PS.product_id, IFNULL(ROUND(SUM(US.units * PS.price) / SUM(US.units), 2), 0) as average_price
FROM Prices as PS left join UnitsSold as US
on PS.product_id = US.product_id
AND US.purchase_date BETWEEN PS.start_date AND PS.end_date
group by product_id