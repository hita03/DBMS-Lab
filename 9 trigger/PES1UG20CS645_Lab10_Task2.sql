Create table payment_info_backup( transaction_no bigint NOT NULL,
                        price int,
                        card_no long,
                        bank  varchar(255),
                        pnr varchar(255),
                        PRIMARY KEY(transaction_no));
                        
set foreign_key_checks=0;

delimiter $$
create trigger payment_backup
before delete
on ticket for each row
begin
declare tn bigint;
declare prc int;
declare cn long;
declare bnk varchar(255);
declare pnr1 varchar(255);
select * into tn,bnk,cn,prc,pnr1
from payment_info 
where pnr=old.pnr;
insert into payment_info_backup(Transaction_No,Bank,Card_No,Price,pnr)
values (tn,bnk,cn,prc,pnr1);
end$$
delimiter ;

delete from ticket where PNR='PNR005';
select * from payment_info_backup;

drop trigger payment_backup;
drop table payment_info_backup;
