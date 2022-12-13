delimiter $$

create trigger comp_check
before insert
on compartment for each row
begin
declare c int;
declare msg varchar(255);
set msg=('Compartments available in train exceeds 4');
if (select count(*)
from compartment
where train_number=new.train_number)>=4 then
SIGNAL sqlstate '45001'
set message_text=msg;
end if;
end$$
delimiter ;



insert into COMPARTMENT (compartment_no,compartment_type,capacity,availability,train_number) values
('F01','III Class','12','8','62621');

insert into COMPARTMENT ((compartment_no,compartment_type,capacity,availability,train_number) values
('F01','I Class','12','8','62620');

insert into COMPARTMENT (compartment_no,compartment_type,capacity,availability,train_number) values
('G01','II Class','5','8','62620');

insert into COMPARTMENT (compartment_no,compartment_type,capacity,availability,train_number) values
('S01','III Class','14','8','62620');

