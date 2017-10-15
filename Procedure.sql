DELIMITER $


DROP PROCEDURE proc$

create procedure proc(in pnom char(20),out solde_suffisant int)
begin 
	
	declare test int;
	
	select solde into test
	from client
	WHERE client.Nom=pnom;
	
	
	if test>=20
	then
		set solde_suffisant:=1;
	else 
		set solde_suffisant:=0;
	end if;
	

end;
$

DELIMITER ;