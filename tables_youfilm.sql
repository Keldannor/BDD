Drop table if exists Appartenir;
Drop table if exists Jouer;
Drop table if exists Realiser;
Drop table if exists Artiste;
Drop table if exists Commande;
Drop table if exists Distributeur;
Drop table if exists Location;
Drop table if exists Travail;
Drop table if exists Personnel;
Drop table if exists Stock;
Drop table if exists Magasin;
Drop table if exists Exemplaire;
Drop table if exists Film;
Drop table if exists DVD;
Drop table if exists Client;



create table Client
(NumClient INT PRIMARY KEY AUTO_INCREMENT,
Nom  char(20),
Prenom char(20),
Ville char(20),
Adresse char(50),
Solde float );


Create table Artiste
(NumArtiste INT PRIMARY KEY AUTO_INCREMENT,
Nom char(20),
Prenom char(20),
Activite char(20) ) ;

Create table Personnel
(NumPersonnel INT PRIMARY KEY AUTO_INCREMENT,
Nom char(20),
Prenom char(20),
Statut char(20) );

Create table DVD
(NumDVD INT PRIMARY KEY AUTO_INCREMENT);

 
Create table Film
(NumFilm INT PRIMARY KEY AUTO_INCREMENT,
Titre Char(50),
Synopsis Char(250),
Noteclient FLOAT,
NoteIMDB FLOAT,
Annee INT,
Duree INT,
Pays Char(50),
Langue Char(50),
Auteur Char (30),
Realisateur Char(30),
Sous_titre char(50) );

Create table Distributeur
(NumDistributeur INT PRIMARY KEY AUTO_INCREMENT,
Nom char(20),
Adresse char(50),
Ville char(20)
);

Create table Magasin
(NumMagasin INT PRIMARY KEY AUTO_INCREMENT,
Adresse char(50),
Ville char(20));

Create table Realiser
(IDArtiste INT,
IDFilm INT,
CONSTRAINT pk_Realiser PRIMARY KEY (IDArtiste,IDFilm),
Constraint fk_Realiser_Artiste FOREIGN KEY (IDArtiste) REFERENCES Artiste(NumArtiste) ON DELETE CASCADE,
CONSTRAINT fk_Realiser_Film FOREIGN KEY (IDFilm) REFERENCES Film(NumFilm)ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE Jouer
(IDArtiste INT,
IDFilm INT,
CONSTRAINT pk_Jouer PRIMARY KEY (IDArtiste,IDFilm),
Constraint fk_Jouer_Artiste FOREIGN KEY (IDArtiste) REFERENCES Artiste(NumArtiste) ON DELETE CASCADE,
CONSTRAINT fk_Jouer_Film FOREIGN KEY (IDFilm) REFERENCES Film(NumFilm)ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE Location
(DateSortie DATE,
DateRetour  DATE,
IDClient INT,
NumEx INT, 
IDMagasin INT,
NumLoc INT,
IDFilm INT,
CONSTRAINT pk_Location PRIMARY KEY (IDClient,NumEx),
CONSTRAINT fk_Location_Client FOREIGN KEY (IDClient) REFERENCES CLient(NumClient)ON DELETE CASCADE,
CONSTRAINT fk_Location_DVD FOREIGN KEY (NumEx) REFERENCES DVD(NumDVD)ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE Commande
(IDFilm INT,
IDDistributeur INT,
CONSTRAINT pk_Commande PRIMARY KEY (IDFilm,IDDistributeur),
Constraint fk_Commande_Film FOREIGN KEY (IDFilm) REFERENCES Film(NumFilm)ON DELETE CASCADE,
CONSTRAINT fk_Commande_Distributeur FOREIGN KEY (IDDistributeur) REFERENCES Distributeur(NumDistributeur)ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE Appartenir
(NumEx INT,
IDMagasin INT,
CONSTRAINT pk_Appartenir PRIMARY KEY (NumEx,IDMagasin),
Constraint fk_Appartenir_DVD FOREIGN KEY (NumEx) REFERENCES DVD(NumDVD)ON DELETE CASCADE,
CONSTRAINT fk_Appartenir_Magasin FOREIGN KEY (IDMagasin) REFERENCES Magasin(NumMagasin)ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE Travail
(IDPersonnel INT,
IDMagasin INT,
CONSTRAINT pk_Travail PRIMARY KEY (IDPersonnel,IDMagasin),
Constraint fk_Travail_Personnel FOREIGN KEY (IDPersonnel) REFERENCES Personnel(NumPersonnel)ON DELETE CASCADE,
CONSTRAINT fk_Travail_Magasin FOREIGN KEY (IDMagasin) REFERENCES Magasin(NumMagasin)ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE Exemplaire
(NumEx INT,
IDFilm INT,
CONSTRAINT pk_Exemplaire PRIMARY KEY (NumEx,IDFilm),
CONSTRAINT fk_Exemplaire_DVD FOREIGN KEY (NumEx) references DVD(NumDVD)ON DELETE CASCADE,
CONSTRAINT fk_Exemplaire_Film FOREIGN KEY (IDFilm) REFERENCES Film(NumFilm)ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE Stock
(IDMagasin INT,
IDFilm INT,
QteT INT,
QteR INT,
CONSTRAINT pk_Stock PRIMARY KEY (IDFilm,IDMagasin),
CONSTRAINT fk_Stock_Magasin FOREIGN KEY (IDMagasin) references Magasin(NumMagasin)ON DELETE CASCADE,
CONSTRAINT fk_Stock_Film FOREIGN KEY (IDFilm) REFERENCES Film(NumFilm)ON DELETE CASCADE
)ENGINE=INNODB;
