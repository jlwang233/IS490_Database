use www;

SELECT employee_id, nickname, CONCAT(first_name, ' ', last_name) AS employee_name,
mobile_phone, home_phone FROM employee ORDER BY nickname;