DELIMITER $$
CREATE procedure age_updation(
IN UID varchar(30),IN DB date, OUT msg varchar(30))
BEGIN
DECLARE age int; IF DB>sysdate() THEN
set msg= 'Invalid DoB';
ELSE
update train_user
set Age=(datediff(sysdate(),DB))/365 where user_id= UID;
update train_user
set DOB=DB where user_id=UID;
set msg='Age updated Successfully';
END IF;
END;$$
DELIMITER ;
CALL age_updation('USR_001','2002-08-26',@A);
SELECT @A;
select * from train_user where user_id='USR_001';
