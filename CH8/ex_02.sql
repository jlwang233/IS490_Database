use my_guitar_shop;
SELECT 
    date_added,
    CAST(date_added AS DATE),
    CAST(CAST(date_added AS DATE) AS CHAR (7)),
    CAST(date_added AS TIME)
FROM
    products