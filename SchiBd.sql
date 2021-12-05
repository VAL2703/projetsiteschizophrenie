use Schiprojet

go

CREATE TABLE adh�rent(
   Id_adh�rent INT IDENTITY,
   nom VARCHAR(50)  NOT NULL,
   pr�nom VARCHAR(50)  NOT NULL,
   pseudo VARCHAR(50)  NOT NULL,
   date_de_naissance DATE NOT NULL,
   mot__passe DECIMAL(6,0)   NOT NULL,
   adresse_mail VARCHAR(50)  NOT NULL,
   Type_ad VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_adh�rent)
);

CREATE TABLE forum_de_t�moignages(
   Id_forum_de_t�moignages INT IDENTITY,
   Pseudo VARCHAR(50)  NOT NULL,
   Mot_passe DECIMAL(6,0)   NOT NULL,
   Date_d�pot DATE NOT NULL,
   Titre VARCHAR(50)  NOT NULL,
   T�moignage VARCHAR(380)  NOT NULL,
   Valide BIT NOT NULL,
   Banni BIT NOT NULL,
   Date_ajout DATE NOT NULL,
   PRIMARY KEY(Id_forum_de_t�moignages)
);

CREATE TABLE Forum_de_discussions(
   Id_Forum_de_discussions INT IDENTITY,
   Pseudo VARCHAR(50)  NOT NULL,
   Mot_passe VARCHAR(50) ,
   Cat�gorie VARCHAR(50)  NOT NULL,
   Th�me VARCHAR(50)  NOT NULL,
   Question VARCHAR(200)  NOT NULL,
   R�ponse VARCHAR(200)  NOT NULL,
   Date_question DATE NOT NULL,
   Date__r�ponse DATE NOT NULL,
   Valide BIT NOT NULL,
   Banni BIT NOT NULL,
   PRIMARY KEY(Id_Forum_de_discussions)
);

CREATE TABLE mod�rateur(
   Id_mod�rateur INT IDENTITY,
   Pseudo VARCHAR(50) ,
   Mot_passe DECIMAL(6,0)   NOT NULL,
   Adresse_mail VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_mod�rateur)
);

CREATE TABLE Lexique_ab�cedaire(
   Id_Lexique_ab�cedaire INT IDENTITY,
   mots VARCHAR(50) ,
   lettres VARCHAR(1) ,
   PRIMARY KEY(Id_Lexique_ab�cedaire)
);

CREATE TABLE Labell(
   Id_Labell INT IDENTITY,
   D�finition VARCHAR(50) ,
   PRIMARY KEY(Id_Labell)
);

CREATE TABLE Visiteur(
   Id_Visiteur INT IDENTITY,
   PRIMARY KEY(Id_Visiteur)
);

CREATE TABLE video(
   Id_video INT IDENTITY,
   intitul� VARCHAR(50) ,
   lien_video VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_video)
);

CREATE TABLE image(
   Id_image INT IDENTITY,
   intitul� VARCHAR(50)  NOT NULL,
   lien_image VARCHAR(50)  NOT NULL,
   position_image VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_image)
);

CREATE TABLE participer(
   Id_adh�rent INT,
   Id_Forum_de_discussions INT,
   PRIMARY KEY(Id_adh�rent, Id_Forum_de_discussions),
   FOREIGN KEY(Id_adh�rent) REFERENCES adh�rent(Id_adh�rent),
   FOREIGN KEY(Id_Forum_de_discussions) REFERENCES Forum_de_discussions(Id_Forum_de_discussions)
);

CREATE TABLE V�rifier(
   Id_forum_de_t�moignages INT,
   Id_mod�rateur INT,
   PRIMARY KEY(Id_forum_de_t�moignages, Id_mod�rateur),
   FOREIGN KEY(Id_forum_de_t�moignages) REFERENCES forum_de_t�moignages(Id_forum_de_t�moignages),
   FOREIGN KEY(Id_mod�rateur) REFERENCES mod�rateur(Id_mod�rateur)
);

CREATE TABLE d�poser(
   Id_adh�rent INT,
   Id_forum_de_t�moignages INT,
   PRIMARY KEY(Id_adh�rent, Id_forum_de_t�moignages),
   FOREIGN KEY(Id_adh�rent) REFERENCES adh�rent(Id_adh�rent),
   FOREIGN KEY(Id_forum_de_t�moignages) REFERENCES forum_de_t�moignages(Id_forum_de_t�moignages)
);

CREATE TABLE Contr�ler(
   Id_Forum_de_discussions INT,
   Id_mod�rateur INT,
   PRIMARY KEY(Id_Forum_de_discussions, Id_mod�rateur),
   FOREIGN KEY(Id_Forum_de_discussions) REFERENCES Forum_de_discussions(Id_Forum_de_discussions),
   FOREIGN KEY(Id_mod�rateur) REFERENCES mod�rateur(Id_mod�rateur)
);

CREATE TABLE contenir(
   Id_Lexique_ab�cedaire INT,
   Id_Labell INT,
   PRIMARY KEY(Id_Lexique_ab�cedaire, Id_Labell),
   FOREIGN KEY(Id_Lexique_ab�cedaire) REFERENCES Lexique_ab�cedaire(Id_Lexique_ab�cedaire),
   FOREIGN KEY(Id_Labell) REFERENCES Labell(Id_Labell)
);

CREATE TABLE rechercher(
   Id_Lexique_ab�cedaire INT,
   Id_Visiteur INT,
   PRIMARY KEY(Id_Lexique_ab�cedaire, Id_Visiteur),
   FOREIGN KEY(Id_Lexique_ab�cedaire) REFERENCES Lexique_ab�cedaire(Id_Lexique_ab�cedaire),
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
