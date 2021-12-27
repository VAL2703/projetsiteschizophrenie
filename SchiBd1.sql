CREATE TABLE Membre_(
   Id_Membre_ INT IDENTITY,
   civilte VARCHAR(10)  NOT NULL,
   prenom VARCHAR(50)  NOT NULL,
   nom VARCHAR(50)  NOT NULL,
   pseudo VARCHAR(50)  NOT NULL,
   date_de_naissance DATE NOT NULL,
   email VARCHAR(50)  NOT NULL,
   mot_de_passe VARCHAR(50)  NOT NULL,
   role VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_Membre_)
);

CREATE TABLE Post(
   Id_Post INT IDENTITY,
   sujet_ VARCHAR(50) ,
   date_depot DATE NOT NULL,
   PRIMARY KEY(Id_Post)
);

CREATE TABLE mot(
   Id_mot INT IDENTITY,
   libelle VARCHAR(50)  NOT NULL,
   definition VARCHAR(255)  NOT NULL,
   PRIMARY KEY(Id_mot)
);

CREATE TABLE Liv(
   Id_Liv INT IDENTITY,
   titre VARCHAR(250)  NOT NULL,
   auteur VARCHAR(50)  NOT NULL,
   resume VARCHAR(255)  NOT NULL,
   lien VARCHAR(255)  NOT NULL,
   PRIMARY KEY(Id_Liv)
);

CREATE TABLE evenement(
   Id_evenement INT IDENTITY,
   nom VARCHAR(50)  NOT NULL,
   date_depot DATE NOT NULL,
   PRIMARY KEY(Id_evenement)
);

CREATE TABLE media(
   Id_media INT IDENTITY,
   nom VARCHAR(50)  NOT NULL,
   type VARCHAR(50)  NOT NULL,
   url VARCHAR(255)  NOT NULL,
   PRIMARY KEY(Id_media)
);

CREATE TABLE Categorie(
   Id_Categorie INT IDENTITY,
   nom VARCHAR(50)  NOT NULL,
   Id_Post INT NOT NULL,
   PRIMARY KEY(Id_Categorie),
   FOREIGN KEY(Id_Post) REFERENCES Post(Id_Post)
);

CREATE TABLE Article_(
   Id_Article_ INT IDENTITY,
   titre VARCHAR(50)  NOT NULL,
   extrait VARCHAR(255)  NOT NULL,
   url VARCHAR(50)  NOT NULL,
   Id_Categorie INT NOT NULL,
   PRIMARY KEY(Id_Article_),
   FOREIGN KEY(Id_Categorie) REFERENCES Categorie(Id_Categorie)
);

CREATE TABLE temoignage(
   Id_temoignage INT IDENTITY,
   contenu VARCHAR(380)  NOT NULL,
   date_temoi DATE NOT NULL,
   Id_Membre_ INT NOT NULL,
   Id_Categorie INT NOT NULL,
   PRIMARY KEY(Id_temoignage),
   FOREIGN KEY(Id_Membre_) REFERENCES Membre_(Id_Membre_),
   FOREIGN KEY(Id_Categorie) REFERENCES Categorie(Id_Categorie)
);

CREATE TABLE illustrer(
   Id_Article_ INT,
   Id_media INT,
   PRIMARY KEY(Id_Article_, Id_media),
   FOREIGN KEY(Id_Article_) REFERENCES Article_(Id_Article_),
   FOREIGN KEY(Id_media) REFERENCES media(Id_media)
);

CREATE TABLE Commenter(
   Id_Membre_ INT,
   Id_Post INT,
   PRIMARY KEY(Id_Membre_, Id_Post),
   FOREIGN KEY(Id_Membre_) REFERENCES Membre_(Id_Membre_),
   FOREIGN KEY(Id_Post) REFERENCES Post(Id_Post)
);

CREATE TABLE reagir(
   Id_Membre_ INT,
   Id_temoignage INT,
   PRIMARY KEY(Id_Membre_, Id_temoignage),
   FOREIGN KEY(Id_Membre_) REFERENCES Membre_(Id_Membre_),
   FOREIGN KEY(Id_temoignage) REFERENCES temoignage(Id_temoignage)
);

CREATE TABLE vérifier(
   Id_Membre_ INT,
   Id_Post INT,
   PRIMARY KEY(Id_Membre_, Id_Post),
   FOREIGN KEY(Id_Membre_) REFERENCES Membre_(Id_Membre_),
   FOREIGN KEY(Id_Post) REFERENCES Post(Id_Post)
);
