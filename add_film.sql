DELIMITER $

DROP PROCEDURE add_film$

create procedure add_film(in ptitre char(20),in pannee int,in pnacteur char(20)) 
begin
	DECLARE idart int;
	DECLARE idfilm int;
	if ((select count(titre) from film where film.titre=ptitre and film.annee=pannee)=0) then 
		if ((select count(nom) from artiste where artiste.nom=pnacteur)=0) then	
			insert into artiste(nom) values(pnacteur);
		end if;
		insert into film(titre,annee) values(ptitre,pannee);
		SELECT Artiste.NumArtiste INTO idart FROM Artiste WHERE Artiste.nom = pnacteur;
		SELECT Film.NumFilm INTO idfilm FROM Film WHERE Film.titre = ptitre;
		insert into jouer(IDArtiste,IDFilm) values(idart,idfilm);
		
	else
		select 'le film existe deja';
	end if;
end;
$

delimiter ;