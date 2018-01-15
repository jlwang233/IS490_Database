use my_guitar_shop;
SELECT 
    email_address, SUM(quantity) AS distinct_products
FROM
    orders
        JOIN
    customers USING (customer_id)
        LEFT JOIN
    order_items USING (order_id)
GROUP BY email_address
HAVING SUM(quantity) > 1