USE my_guitar_shop;

CREATE OR REPLACE VIEW product_summary AS
	SELECT product_name, SUM(quantity) AS order_count, SUM(item_total) AS order_total
    FROM order_item_products
    GROUP BY product_name
    ORDER BY product_name;
    
-- SELECT * FROM product_summary