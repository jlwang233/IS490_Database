use my_guitar_shop;
SELECT 
    email_address,
    SUM(item_price * quantity) AS order_total,
    SUM(discount_amount * quantity) AS discount_total
FROM
    orders
        JOIN
    customers USING (customer_id)
        LEFT JOIN
    order_items USING (order_id)
GROUP BY email_address
ORDER BY SUM(item_price * quantity) DESC