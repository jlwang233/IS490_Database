USE my_guitar_shop;

CREATE OR REPLACE VIEW customer_addresses AS
	SELECT  c.customer_id, c.email_address, c.last_name, c.first_name,
     a1.line1 AS bill_line1, a1.line2 AS bill_line2, a1.city AS bill_city, a1.state AS bill_state, a1.zip_code AS bill_zip, 
     a2.line1 AS ship_line1, a2.line2 AS ship_line2, a2.city AS ship_city, a2.state AS ship_state, a2.zip_code AS ship_zip 
    FROM customers c, addresses a1, addresses a2
    WHERE c.shipping_address_id = a1.address_id 
		AND c.billing_address_id = a2.address_id
	ORDER BY c.last_name, c.first_name;
