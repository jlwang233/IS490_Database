use my_guitar_shop;
SELECT 
    first_name, last_name, line1, city, state, zip_code
FROM
    customers
        JOIN
    addresses ON customers.customer_id = addresses.customer_id
WHERE
    email_address = 'allan.sherwood@yahoo.com'
