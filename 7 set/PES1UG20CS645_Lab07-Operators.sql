-- 1
Select user_id, user_type, firstname, lastname from ticket, train_user where ticket.passenger_id = train_user.user_id and departure='Bengaluru' and arrival='Chennai' and (travel_date like '2021-10-%' )
UNION
Select user_id, user_type, firstname, lastname from ticket, train_user where ticket.passenger_id = train_user.user_id and departure='Bengaluru' and arrival='Chennai' and (travel_date like '2022-08-%' );


-- 2
Select user_id, user_type, firstname, lastname from ticket, train_user where ticket.passenger_id = train_user.user_id and departure='Bengaluru' and arrival='Chennai' and (travel_date like '2021-10-%')
INTERSECT
Select user_id, user_type, firstname, lastname from ticket, train_user where ticket.passenger_id = train_user.user_id and departure='Bengaluru' and arrival='Chennai' and (travel_date like '2022-08-%');

-- 3 
Select user_id, user_type, firstname, lastname from ticket, train_user where ticket.passenger_id = train_user.user_id and departure='Bengaluru' and arrival='Chennai' and (travel_date like '2022-08-%')
EXCEPT
Select user_id, user_type, firstname, lastname from ticket, train_user where ticket.passenger_id = train_user.user_id and departure='Bengaluru' and arrival='Chennai' and (travel_date like '2021-10-%');

-- 4
Select user_id, user_type, firstname, lastname from ticket as t1, train_user where t1.passenger_id = train_user.user_id and departure='Bengaluru' and arrival='Chennai' and user_id IN
(select user_id from train_user, ticket as t2 where t2.passenger_id = train_user.user_id and arrival='Bengaluru' and t2.travel_date-t1.travel_date <=7);

-- 5
Select user_id, user_type, firstname, lastname from ticket, train_user where ticket.passenger_id = train_user.user_id and departure='Bengaluru' and arrival='Chennai'
EXCEPT
Select user_id, user_type, firstname, lastname from ticket, train_user where ticket.passenger_id = train_user.user_id and arrival='Bengaluru'; 
