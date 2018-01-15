use my_guitar_shop;
SELECT 
    COUNT(*) AS number_of_orders, SUM(tax_amount) AS total_tax
FROM
    orders
