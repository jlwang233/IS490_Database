USE www;

SELECT nickname, CONCAT(first_name, ' ', last_name) AS employee_name, availability_notes
FROM employee ORDER BY nickname