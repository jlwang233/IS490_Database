USE my_web_db;

ALTER TABLE users MODIFY first_name VARCHAR(20) NOT NULL;

UPDATE users
SET first_name = null
WHERE user_id = 1;

UPDATE users
SET first_name = "thisisaverylongnamewith30chars"
WHERE user_id = 1
