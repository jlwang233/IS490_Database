use my_guitar_shop;
SELECT 
    CONCAT(first_name, ', ', last_name) AS full_name
FROM
    customers
WHERE
    last_name BETWEEN 'M' AND 'Z'
ORDER BY last_name ASC