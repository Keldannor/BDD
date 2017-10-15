DELIMITER $

DROP PROCEDURE new_client$

create procedure new_client(in username char(20),in password char(10),in pnom char(20),in pprenom char(20),in pville char(20),in padresse char(20), in psolde float) 
sql security invoker
begin
	if ((select count(nom) from client where client.nom=pnom and client.prenom=pprenom)=0) then 
		insert into client(nom,prenom,adresse,ville,solde) values(pnom,pprenom,padresse,pville,psolde);
		create user "default"@"%";/* IDENTIFIED BY "pass1234";*/
		update mysql.user
		set 
		mysql.user.user = username
		where (mysql.user.user = "default") and (mysql.user.host="%");
		update mysql.user
		set 
		mysql.user.password = PASSWORD(password)
		where (mysql.user.user = username) and (mysql.user.host="%");
		
		flush privileges;
	else
		select 'Le client existe deja';
	end if;
end;
$

delimiter ;