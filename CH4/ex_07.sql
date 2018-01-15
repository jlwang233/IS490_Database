use my_guitar_shop;
SELECT 
    'shipped' AS ship_status, order_id, order_date
FROM
    orders
WHERE
    ship_date IS NOT NULL 
UNION SELECT 
    'unshipped' AS ship_status, order_id, order_date
FROM
    orders
WHERE
    ship_date IS NULL
ORDER BY order_date