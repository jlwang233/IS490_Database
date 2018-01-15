use my_guitar_shop;
SELECT 
    last_name,
    first_name,
    order_date,
    product_name,
    item_price,
    discount_amount,
    quantity
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
        JOIN
    order_items oi ON o.order_id = oi.order_id
        JOIN
    products p ON oi.product_id = p.product_id
ORDER BY last_name , order_date , product_name