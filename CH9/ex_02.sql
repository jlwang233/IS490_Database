use my_guitar_shop;

SELECT
order_date,
DATE_FORMAT(order_date, '%Y') AS order_year,
DATE_FORMAT(order_date, '%b-%d-%Y') AS order_day,
DATE_FORMAT(order_date,'%l:%i %p') AS order_time,
DATE_FORMAT(order_date, '%m/%d/%y %H:%i') AS order_detail
FROM
orders