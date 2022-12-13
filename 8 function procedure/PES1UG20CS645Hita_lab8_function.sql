DELIMITER $$
CREATE FUNCTION final_func(user varchar(20))
RETURNS varchar(20)
BEGIN
DECLARE res varchar(20);
DECLARE tot_count int;
SET tot_count = (SELECT COUNT(*) FROM ticket NATURAL JOIN ticket_passenger WHERE ticket.pnr=pnr AND
MONTH(ticket.travel_date)=MONTH(CURRENT_DATE) GROUP BY ticket.pnr);
IF tot_count > 3 THEN
SET res = "NOT ELIGIBLE";
ELSE
SET res = "ELIGIBLE";
END IF;
RETURN res;
END;$$
DELIMITER ;
SELECT final_func(pnr),pnr from ticket;
