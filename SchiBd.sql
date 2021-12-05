use Schiprojet

go

CREATE TABLE adhérent(
   Id_adhérent INT IDENTITY,
   nom VARCHAR(50)  NOT NULL,
   prénom VARCHAR(50)  NOT NULL,
   pseudo VARCHAR(50)  NOT NULL,
   date_de_naissance DATE NOT NULL,
   mot__passe DECIMAL(6,0)   NOT NULL,
   adresse_mail VARCHAR(50)  NOT NULL,
   Type_ad VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_adhérent)
);

CREATE TABLE forum_de_témoignages(
   Id_forum_de_témoignages INT IDENTITY,
   Pseudo VARCHAR(50)  NOT NULL,
   Mot_passe DECIMAL(6,0)   NOT NULL,
   Date_dépot DATE NOT NULL,
   Titre VARCHAR(50)  NOT NULL,
   Témoignage VARCHAR(380)  NOT NULL,
   Valide BIT NOT NULL,
   Banni BIT NOT NULL,
   Date_ajout DATE NOT NULL,
   PRIMARY KEY(Id_forum_de_témoignages)
);

CREATE TABLE Forum_de_discussions(
   Id_Forum_de_discussions INT IDENTITY,
   Pseudo VARCHAR(50)  NOT NULL,
   Mot_passe VARCHAR(50) ,
   Catégorie VARCHAR(50)  NOT NULL,
   Thème VARCHAR(50)  NOT NULL,
   Question VARCHAR(200)  NOT NULL,
   Réponse VARCHAR(200)  NOT NULL,
   Date_question DATE NOT NULL,
   Date__réponse DATE NOT NULL,
   Valide BIT NOT NULL,
   Banni BIT NOT NULL,
   PRIMARY KEY(Id_Forum_de_discussions)
);

CREATE TABLE modérateur(
   Id_modérateur INT IDENTITY,
   Pseudo VARCHAR(50) ,
   Mot_passe DECIMAL(6,0)   NOT NULL,
   Adresse_mail VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_modérateur)
);

CREATE TABLE Lexique_abécedaire(
   Id_Lexique_abécedaire INT IDENTITY,
   mots VARCHAR(50) ,
   lettres VARCHAR(1) ,
   PRIMARY KEY(Id_Lexique_abécedaire)
);

CREATE TABLE Labell(
   Id_Labell INT IDENTITY,
   Définition VARCHAR(50) ,
   PRIMARY KEY(Id_Labell)
);

CREATE TABLE Visiteur(
   Id_Visiteur INT IDENTITY,
   PRIMARY KEY(Id_Visiteur)
);

CREATE TABLE video(
   Id_video INT IDENTITY,
   intitulé VARCHAR(50) ,
   lien_video VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_video)
);

CREATE TABLE image(
   Id_image INT IDENTITY,
   intitulé VARCHAR(50)  NOT NULL,
   lien_image VARCHAR(50)  NOT NULL,
   position_image VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_image)
);

CREATE TABLE participer(
   Id_adhérent INT,
   Id_Forum_de_discussions INT,
   PRIMARY KEY(Id_adhérent, Id_Forum_de_discussions),
   FOREIGN KEY(Id_adhérent) REFERENCES adhérent(Id_adhérent),
   FOREIGN KEY(Id_Forum_de_discussions) REFERENCES Forum_de_discussions(Id_Forum_de_discussions)
);

CREATE TABLE Vérifier(
   Id_forum_de_témoignages INT,
   Id_modérateur INT,
   PRIMARY KEY(Id_forum_de_témoignages, Id_modérateur),
   FOREIGN KEY(Id_forum_de_témoignages) REFERENCES forum_de_témoignages(Id_forum_de_témoignages),
   FOREIGN KEY(Id_modérateur) REFERENCES modérateur(Id_modérateur)
);

CREATE TABLE déposer(
   Id_adhérent INT,
   Id_forum_de_témoignages INT,
   PRIMARY KEY(Id_adhérent, Id_forum_de_témoignages),
   FOREIGN KEY(Id_adhérent) REFERENCES adhérent(Id_adhérent),
   FOREIGN KEY(Id_forum_de_témoignages) REFERENCES forum_de_témoignages(Id_forum_de_témoignages)
);

CREATE TABLE Contrôler(
   Id_Forum_de_discussions INT,
   Id_modérateur INT,
   PRIMARY KEY(Id_Forum_de_discussions, Id_modérateur),
   FOREIGN KEY(Id_Forum_de_discussions) REFERENCES Forum_de_discussions(Id_Forum_de_discussions),
   FOREIGN KEY(Id_modérateur) REFERENCES modérateur(Id_modérateur)
);

CREATE TABLE contenir(
   Id_Lexique_abécedaire INT,
   Id_Labell INT,
   PRIMARY KEY(Id_Lexique_abécedaire, Id_Labell),
   FOREIGN KEY(Id_Lexique_abécedaire) REFERENCES Lexique_abécedaire(Id_Lexique_abécedaire),
   FOREIGN KEY(Id_Labell) REFERENCES Labell(Id_Labell)
);

CREATE TABLE rechercher(
   Id_Lexique_abécedaire INT,
   Id_Visiteur INT,
   PRIMARY KEY(Id_Lexique_abécedaire, Id_Visiteur),
   FOREIGN KEY(Id_Lexique_abécedaire) REFERENCES Lexique_abécedaire(Id_Lexique_abécedaire),
   FOREIGN KEY(Id_Visiteur) REFERENCES Visiteur(Id_Visiteur)
);

CREATE TABLE regerder(
   Id_Visiteur INT,
   Id_video INT,
   PRIMARY KEY(Id_Visiteur, Id_video),
   FOREIGN KEY(Id_Visiteur) REFERENCES Visiteur(Id_Visiteur),
   FOREIGN KEY(Id_video) REFERENCES video(Id_video)
);

CREATE TABLE voir(
   Id_Visiteur INT,
   Id_image INT,
   PRIMARY KEY(Id_Visiteur, Id_image),
   FOREIGN KEY(Id_Visiteur) REFERENCES Visiteur(Id_Visiteur),
   FOREIGN KEY(Id_image) REFERENCES image(Id_image)
);

go
