USE my_web_db;

INSERT INTO users (user_id, email_address, first_name, last_name)
VALUES (1, "johnsmith@gmail.com", "John", "Smith"), (2, "janedoe@gmail.com", "Jane", "Doe");

INSERT INTO products (product_id, product_name)
VALUES (1, "Local Music Vol 2"), (2, "Local Music Vol 1");

INSERT INTO downloads (download_id, user_id, download_date, filename, product_id)
VALUES (1, 1, now(), "pedals_are_falling.mp3", 2),
		(2, 2, now(), "one_horse_town.mp3", 1),
		(3, 2, now(), "turn_signal.mp3", 2);

SELECT email_address, first_name, last_name, download_date, filename, product_name
FROM downloads
JOIN users ON downloads.user_id = users.user_id
JOIN products ON downloads.product_id = products.product_id
ORDER BY email_address DESC, product_name ASC

