use my_guitar_shop;
SELECT 
    product_name,
    list_price,
    discount_percent,
    list_price * discount_percent / 100 AS discount_amount,
    list_price - list_price * discount_percent / 100 AS discount_price
FROM
    products
ORDER BY discount_price DESC
LIMIT 0, 5