create view cp as select ticket.PNR,ticket.Train_no,ticket.Departure,ticket.Arrival,route_info.distance,fare_table.fare_per_km from ticket,route_info,fare as fare_table where (ticket.train_no=route_info.train_no and ticket.Departure = route_info.From_station_name and  ticket.Arrival = route_info.To_station_name and fare_table.Train_type = ticket.Train_type and  fare_table.compartment_type = ticket.compartment_type);

create view pv as select pnr, count(pnr) as number from ticket_passenger group by pnr;

update payment_info as p INNER JOIN cp on p.pnr = cp.pnr INNER JOIN pv on cp.pnr = pv.pnr set p.price = cp.distance * cp.fare_per_km * pv.number;
-- Natural join
select source, destination, distance from train natural join route_info where source=from_station_name and destination=to_station_name;

-- Inner join
select firstname, lastname from train_user inner join (select * from ticket natural join payment_info where ticket.pnr=payment_info.pnr) as i where user_id=i.passenger_id and i.price > 500;

select train_no from train inner join compartment where source="Bengaluru" and destination="Chennai" and train_no=train_number and compartment.availability>10;

-- Left outer join

select firstname, lastname, dob, pnr from train_user left outer join ticket on user_id=passenger_id;

select firstname, lastname, dob, pnr from train_user left outer join ticket on user_id=passenger_id where pnr is null;

-- Right outer join

select pnr, train_no, travel_date, firstname, lastname from ticket right outer join train_user on user_id=passenger_id;

select distinct user_id, train_no, train_name from user_train right outer join train on train_id=train_no;

-- Nested queries
select train_no, train_name from train where destination!="Mangaluru" and train_no not in ( select route_info.train_no from route_info left outer join ticket on route_info.train_no=ticket.train_no where distance < 100 and departure and departure_time=TIME('8:30:00') union select route_info.train_no from route_info right outer join ticket on route_info.train_no=ticket.train_no where distance < 100 and departure and departure_time=TIME('8:30:00') );

select passenger_id from ticket join payment_info on ticket.pnr=payment_info.pnr where payment_info.price>(select AVG(payment_info.price) from payment_info);
