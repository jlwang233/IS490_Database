use my_guitar_shop;

SELECT
card_number,
LENGTH(card_number) AS length,
RIGHT(card_number, 4) AS last_4_digits,
CONCAT("XXXX-XXXX-XXXX-", RIGHT(card_number, LENGTH(card_number)-12)) AS card_encrypt
FROM
Orders