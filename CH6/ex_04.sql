use my_guitar_shop;
SELECT 
    email_address,
    COUNT(order_id) AS number_of_orders,
    SUM((item_price - discount_amount) * quantity) AS total_order_amount
FROM
    orders
        JOIN
    customers USING (customer_id)
        LEFT JOIN
    order_items USING (order_id)
GROUP BY email_address
HAVING COUNT(order_id) > 1
ORDER BY SUM((item_price - discount_amount) * quantity) DESC