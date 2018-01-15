USE www;

INSERT INTO trip
VALUES ('666', '2014-08-02', '7', '07:30:00', '08:15:00', '16:00:00', 
(SELECT destination_code FROM destination WHERE destination_name = 'Upper Wisconsin River'),
(SELECT trip_type_code FROM trip_type WHERE trip_type_name = 'Kayak'),
(SELECT employee_id FROM employee WHERE nickname = 'Pat' AND last_name = 'Patterson'),
NULL,
(SELECT gathering_point_id FROM gathering_point WHERE gathering_point_description = 'Omar\'s Live Bait and Bridal Salon; 3421 Highway KZ; Casino Springs; WI 54776'));