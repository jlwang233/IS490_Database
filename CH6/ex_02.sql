use my_guitar_shop;
SELECT 
    category_name,
    COUNT(*) AS product_qty,
    MAX(list_price) AS most_expensive_product
FROM
    categories
        JOIN
    products ON categories.category_id = products.category_id
GROUP BY category_name
ORDER BY product_qty DESC	