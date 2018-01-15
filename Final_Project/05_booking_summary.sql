USE www;

SELECT destination_name, trip_type_name, trip.trip_number, trip_date, CONCAT(first_name, ' ', last_name) AS guide_name,
capacity, COUNT(guest_id) AS guest_booked, (capacity - COUNT(guest_id)) AS positions_available 
FROM destination 
JOIN trip ON destination.destination_code = trip.destination_code
JOIN trip_type ON trip.trip_type_code = trip_type.trip_type_code
JOIN employee ON employee.employee_id = trip.guide_employee_id
JOIN reservation ON trip.trip_number = reservation.trip_number
GROUP BY trip.trip_number
ORDER BY destination_name, trip_type_name, trip_date, trip.trip_number