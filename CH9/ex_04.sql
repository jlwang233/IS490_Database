use my_guitar_shop;

SELECT 
order_id,
order_date,
DATE_ADD(order_date, INTERVAL 2 DAY) AS approx_ship_date,
ship_date,
DATEDIFF(ship_date, order_date) AS days_to_ship
FROM
Orders
WHERE
order_date >= '2015-04-01'