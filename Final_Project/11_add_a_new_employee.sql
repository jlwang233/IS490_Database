USE www;

INSERT INTO employee (first_name, last_name, nickname, mobile_phone, home_phone, availability_notes)
VALUES ('Patrick L.', 'Patterson', 'Pat', '847-555-9706', NULL, 'All Saturdays and Sundays in June, July, and August');

INSERT INTO plays_role VALUES (@@Identity, (SELECT role_code FROM role WHERE role_name='Guide')), 
(@@Identity, (SELECT role_code FROM role WHERE role_name='Gear'));

INSERT INTO can_guide  VALUES (@@Identity, (SELECT trip_type_code FROM trip_type WHERE trip_type_name='Kayak')),
(@@Identity, (SELECT trip_type_code FROM trip_type WHERE trip_type_name='Canoe')), 
(@@Identity, (SELECT trip_type_code FROM trip_type WHERE trip_type_name='Raft'));
