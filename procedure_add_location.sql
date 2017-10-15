DELIMITER $

DROP PROCEDURE add_location$

CREATE PROCEDURE add_location(in ptitre char(20), in pannee int, in pClient int, in psortie date )
BEGIN
      IF ((SELECT COUNT(titre) from film where film.titre=ptitre and film.annee=pannee)=1) THEN  
	    IF ((SELECT COUNT(QteR) from stock where stock.QteR>0)=1) then 
		  IF((SELECT COUNT(NumClient) from client where client.NumClient=pClient)=1)then
		     IF((SELECT COUNT(Solde) from client where client.Solde>=3)=1)then       
					 UPDATE client
					 SET
					 Solde  = solde - 3
					 WHERE client.NumClient=pClient;
					 
					 UPDATE stock
					 SET 
					 QteR = QteR - 1
					 WHERE stock.QteR;
				
		         INSERT INTO location(DateSortie) values (psortie);
				 
				 
		      ELSE 
		         SELECT 'Vous n avez pas assez de solde';
			     END IF;
	      ELSE
		         SELECT 'Le client n existe pas ';
			     END IF;
        ELSE	
               SELECT 'Il n y aucun exemplaire disponible';
			   END IF;
      ELSE 		
              SELECT 'Il n y aucun film correspondant à la recherche';	  
		      END IF;  
END;
$
DELIMITER ;