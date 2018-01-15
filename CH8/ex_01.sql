use my_guitar_shop;
SELECT 
    list_price,
    FORMAT(list_price, 1),
    CAST(list_price AS SIGNED),
    CONVERT( list_price , SIGNED)
FROM
    products
