USE my_guitar_shop;

CREATE OR REPLACE VIEW order_item_products AS
	SELECT  orders.order_id, order_date, tax_amount, ship_date,
		 item_price, discount_amount, (item_price - discount_amount) AS final_price, quantity, 
         (item_price - discount_amount) * quantity AS item_total, product_name
    FROM orders JOIN order_items ON orders.order_id = order_items.order_id
					JOIN products ON order_items.product_id = products.product_id
	ORDER BY order_id;

-- SELECT * FROM order_item_products
    