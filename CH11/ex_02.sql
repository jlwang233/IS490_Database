-- create new database
DROP DATABASE IF EXISTS my_web_db;
CREATE DATABASE my_web_db CHARSET utf8 COLLATE utf8_general_ci;

-- select the database
USE my_web_db;

-- create the tables
CREATE TABLE users
(
	user_id 		INT UNSIGNED 	PRIMARY KEY,
	email_address 	VARCHAR(100) 	NOT NULL,
	first_name 		VARCHAR(45) 	NOT NULL,
	last_name 		VARCHAR(45) 	NOT NULL
)
ENGINE = InnoDB;
CREATE UNIQUE INDEX email_address_idx_un on users (email_address);

CREATE TABLE products
(
	product_id 		INT UNSIGNED 	PRIMARY KEY,
	product_name 	VARCHAR(45) 	NOT NULL
)
ENGINE = InnoDB;
CREATE UNIQUE INDEX product_name_idx_un on products (product_name);

CREATE TABLE downloads
(
	download_id 	INT UNSIGNED 	PRIMARY KEY,
	user_id 		INT UNSIGNED 	NOT NULL,
    download_date 	DATETIME 		NOT NULL,
    filename 		VARCHAR(50)	NOT NULL,
	product_id 		INT UNSIGNED 	NOT NULL,
	CONSTRAINT downloads_fk_users
		FOREIGN KEY (user_id)
		REFERENCES users (user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT downloads_fk_products
		FOREIGN KEY (product_id)
		REFERENCES products (product_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)
ENGINE = InnoDB;
CREATE INDEX user_id_idx ON downloads (user_id);
CREATE INDEX product_id_idx ON downloads(product_id);
