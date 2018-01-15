use my_web_db;

ALTER TABLE products
	ADD	price		DECIMAL(5,2)	DEFAULT 9.99,
    ADD time_added	DATETIME		DEFAULT now();

SELECT * FROM products