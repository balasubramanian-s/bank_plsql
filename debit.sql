CREATE DEFINER=`root`@`localhost` PROCEDURE `debit`(mobile_no varchar(13),amount varchar(10), current_bal varchar(10))
BEGIN

select a.current_balance into current_bal from _account a, customer b where b.mobile=mobile_no AND a.cif_no=b.cif_no;
 
	if(current_bal<=amount)then
		select 'Insufficient Balance';
	else
		UPDATE _account a,customer b SET a.current_balance= a.current_balance-amount where b.mobile=mobile_no AND a.cif_no=b.cif_no ;
       
        select 'Debited';
        
        select a.ac_no,a.ac_name,a.current_balance from _account a,customer b where b.mobile=mobile_no AND a.cif_no=b.cif_no;
	end if;
 
END