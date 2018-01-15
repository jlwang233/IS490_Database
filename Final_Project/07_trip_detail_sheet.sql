USE www;

SELECT destination_name, trip_type_name, trip_number, trip_date, 
CONCAT(first_name, ' ', last_name) AS guide_name, 
mobile_phone AS guide_mobile_phone, '414-555-1212' AS "Wilma's_Wild_Wisconsin_Office_Phone",
latest_guest_arrival_time, departure_time, estimated_return_time, gathering_point_description
FROM destination
JOIN trip ON destination.destination_code = trip.destination_code
JOIN trip_type ON trip.trip_type_code = trip_type.trip_type_code
JOIN employee ON employee.employee_id = trip.guide_employee_id
JOIN gathering_point ON trip.gathering_point_id = gathering_point.gathering_point_id
ORDER BY destination_name, trip_type_name, trip_date
