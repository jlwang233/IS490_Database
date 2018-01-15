use my_guitar_shop;
SELECT 
    product_name,
    SUM((item_price - discount_amount) * quantity) AS total_product_amount
FROM
    products
        JOIN
    order_items ON products.product_id = order_items.product_id
GROUP BY product_name WITH ROLLUP