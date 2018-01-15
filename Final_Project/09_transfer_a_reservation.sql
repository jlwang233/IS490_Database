use www;

UPDATE reservation
SET trip_number = 564
WHERE guest_id=(SELECT guest_id
				FROM guest
				WHERE first_name = "Lamar" AND last_name = "Lincoln" ) 
AND trip_number=562;