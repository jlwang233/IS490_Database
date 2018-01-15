use my_guitar_shop;
SELECT 
    category_name, product_id
FROM
    categories
        LEFT JOIN
    products ON categories.category_id = products.category_id
WHERE
    product_id IS NULL