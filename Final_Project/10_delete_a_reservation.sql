use www;

DELETE FROM reservation
WHERE guest_id=(SELECT guest_id
				FROM guest
				WHERE first_name = "Bart Jr." AND last_name = "Samuels" ) 
AND trip_number=562;