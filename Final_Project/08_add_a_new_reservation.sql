USE www;

INSERT INTO guest (first_name, last_name, age, weight, isSwimmer, mobile_phone, experience_code) 
VALUES ('Lilly', 'Ludsen', '25', '120', '1', NULL, '2');

INSERT INTO reservation
VALUES (562, @@Identity);