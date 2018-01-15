use my_guitar_shop;
SELECT 
    first_name, last_name, line1, city, state, zip_code
FROM
    customers
        JOIN
    addresses ON shipping_address_id = address_id

