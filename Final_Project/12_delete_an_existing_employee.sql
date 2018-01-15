use www;
SET SQL_SAFE_UPDATES = 0;

DELETE FROM employee
WHERE nickname = 'Summer' 
AND last_name = 'Simms';

SET SQL_SAFE_UPDATES = 1;