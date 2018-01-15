USE www;

SELECT destination_name, trip_type_name, trip.trip_number, trip_date, 
CONCAT(employee.first_name, ' ', employee.last_name) AS guide_name, 
CONCAT(guest.first_name, ' ', guest.last_name) AS guest_name, 
experience_name, age, weight, isSwimmer, guest.mobile_phone AS guest_mobile_phone
FROM destination
JOIN trip ON destination.destination_code = trip.destination_code
JOIN trip_type ON trip.trip_type_code = trip_type.trip_type_code
JOIN employee ON employee.employee_id = trip.guide_employee_id
JOIN reservation ON trip.trip_number = reservation.trip_number
JOIN guest ON reservation.guest_id = guest.guest_id
JOIN experience ON guest.experience_code = experience.experience_code
ORDER BY destination_name, trip_type_name, trip_date, guest_name
