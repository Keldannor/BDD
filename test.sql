SELECT *
FROM film
INNER JOIN jouer 
ON film.numfilm=jouer.idfilm
INNER JOIN artiste
ON jouer.idartiste=artiste.numartiste