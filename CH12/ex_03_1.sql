USE my_guitar_shop;

UPDATE customer_addresses
SET ship_line1 = '1990 Westwood Blvd.'
WHERE customer_id = 8

-- Error: Incorrect usage of UPDATE and ORDER BY.
-- Can be resolved by deleting ORDER BY in ex_01, or
-- using the method in ex_03_2 to UPDATE.