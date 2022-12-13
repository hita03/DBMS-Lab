-- 1.Find the average distance between subsequent stations for every train
SELECT AVG(distance), train_no FROM route_info GROUP BY train_no;

-- 2. Find the average distance between subsequent stations for every train and display them in
-- descending order of distance
SELECT AVG(distance), train_no FROM route_info GROUP BY train_no ORDER BY AVG(distance) DESC;


-- 3. Display the list of train numbers and the total distance traveled by each in descending
-- order of the distance traveled
SELECT train.train_no, distance FROM train, route_info WHERE from_station_name = source AND to_station_name = destination ORDER BY distance DESC;

    
-- 4. List those trains that have maximum and minimum number compartments and also display number of compartments they have. (2 queries one to find max and other to find min)
WITH X AS (SELECT train_number, COUNT(*) as compartment_number FROM compartment GROUP BY train_number) SELECT train_number, compartment_number FROM X ORDER BY compartment_number ASC LIMIT 1;
WITH X AS (SELECT train_number, COUNT(*) as compartment_number FROM compartment GROUP BY train_number) SELECT train_number, compartment_number FROM X ORDER BY compartment_number DESC LIMIT 1;


-- 5. Display the number of phone numbers corresponding to the user_id(s) ADM_001, USR_006, USR_10
SELECT user_id, phone_no FROM user_phone WHERE user_id IN ('ADM_001', 'USR_006', 'USR_010');


-- 6. Find the average fare per km for each train type specified and display the train type and corresponding average fare per km as ‘Avg_Fare’ in decreasing order of Avg_Fare
SELECT train_type, AVG(fare_per_km) FROM fare GROUP BY train_type ORDER BY AVG(fare_per_km) DESC;


-- 7. Retrieve all details of the oldest passenger.
SELECT * from ticket_passenger where Age = (select max(Age) as max_age from ticket_passenger);

-- 8. Count the number of passengers whose name consists of ‘Ullal’. (Hint: Use the LIKE
-- operator)
SELECT COUNT(*) FROM ticket_passenger WHERE name LIKE '%Ullal%';