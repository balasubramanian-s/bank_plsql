CREATE DEFINER=`root`@`localhost` PROCEDURE `transfer`(from_mob varchar(13),amount varchar(6), _bal varchar(10),to_mob varchar(10))
BEGIN
set autocommit=0;
select current_balance into _bal from _account a,customer b where  b.mobile=from_mob AND a.cif_no=b.cif_no;

	if(_bal<amount)then
		select 'Insufficient Balance';
     
	else
		UPDATE _account a,customer b SET a.current_balance= a.current_balance-amount where  b.mobile=from_mob AND a.cif_no=b.cif_no;
        UPDATE _account a,customer b SET a.current_balance= a.current_balance+amount where b.mobile=to_mob AND a.cif_no=b.cif_no;
        
        select 'Transaction Successful';
        select 'From';
        select a.ac_no,a.ac_name,a.current_balance from _account a,customer b where b.mobile=from_mob AND a.cif_no=b.cif_no;
        select 'To';
         select a.ac_no,a.ac_name,a.current_balance from _account a,customer b where b.mobile=to_mob AND a.cif_no=b.cif_no;
	end if;
 
END