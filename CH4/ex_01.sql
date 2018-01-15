use my_guitar_shop;
SELECT 
    category_name, product_name, list_price
FROM
    categories
        JOIN
    products ON categories.category_id = products.category_id
ORDER BY category_name , product_name ASC;