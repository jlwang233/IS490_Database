USE my_guitar_shop;

UPDATE customer_addresses ca
	JOIN (
		SELECT * FROM customer_addresses
		WHERE customer_id = 8
    ) AS s
    on ca.customer_id = s.customer_id
	SET ca.ship_line1 = '1990 Westwood Blvd.'