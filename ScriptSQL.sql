USE schiBD
go

CREATE TABLE adh�rent(
   Id_adh�rent INT IDENTITY,
   nom VARCHAR(50)  NOT NULL,
   pr�nom VARCHAR(50)  NOT NULL,
   pseudo VARCHAR(50)  NOT NULL,
   date_de_naissance VARCHAR(50)  NOT NULL,
   mot_de_passe DECIMAL(6,0)   NOT NULL,
   adresse_mail VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_adh�rent)
);

CREATE TABLE formulaire(
   Id_formulaire INT IDENTITY,
   nom VARCHAR(50)  NOT NULL,
   pr�nom VARCHAR(50)  NOT NULL,
   pseudo VARCHAR(50)  NOT NULL,
   date_de_naissance DATE NOT NULL,
   mot_de_passe VARCHAR(50)  NOT NULL,
   Id_adh�rent INT NOT NULL,
   PRIMARY KEY(Id_formulaire),
   FOREIGN KEY(Id_adh�rent) REFERENCES adh�rent(Id_adh�rent)
);

CREATE TABLE forum_de_t�moignages(
   Id_forum_de_t�moignages INT IDENTITY,
   adh�rents VARCHAR(50)  NOT NULL,
   des_themes VARCHAR(50)  NOT NULL,
   date_d�p�t_du_t�moignage DATE NOT NULL,
   t�moignages VARCHAR(280)  NOT NULL,
   PRIMARY KEY(Id_forum_de_t�moignages)
);

CREATE TABLE Forum_de_discussions(
   Id_Forum_de_discussions INT IDENTITY,
   un_theme VARCHAR(50)  NOT NULL,
   des_adh�rents VARCHAR(50)  NOT NULL,
   m�diateur_s_ VARCHAR(50)  NOT NULL,
   des_questions VARCHAR(200)  NOT NULL,
   des_r�ponses VARCHAR(200)  NOT NULL,
   des_cat�gories VARCHAR(110)  NOT NULL,
   Date_de_la_question DATE NOT NULL,
   Date_de_la_r�ponse DATE NOT NULL,
   PRIMARY KEY(Id_Forum_de_discussions)
);

CREATE TABLE mod�rateur(
   Id_mod�rateur INT IDENTITY,
   adresse_mail_adh�rent VARCHAR(50)  NOT NULL,
   Pseudo VARCHAR(50) ,
   question_r�ponse VARCHAR(50)  NOT NULL,
   article VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_mod�rateur)
);

CREATE TABLE Lexique_ab�cedaire(
   Id_Lexique_ab�cedaire INT IDENTITY,
   mots VARCHAR(50) ,
   lettres VARCHAR(1) ,
   D�finition_des_mots VARCHAR(50) ,
   PRIMARY KEY(Id_Lexique_ab�cedaire)
);

CREATE TABLE Labell(
   Id_Labell INT IDENTITY,
   D�finition VARCHAR(50) ,
   PRIMARY KEY(Id_Labell)
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
   valider BIT,
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
   valider BIT NOT NULL,
   bannir BIT,
   PRIMARY KEY(Id_Forum_de_discussions, Id_mod�rateur),
   FOREIGN KEY(Id_Forum_de_discussions) REFERENCES Forum_de_discussions(Id_Forum_de_discussions),
   FOREIGN KEY(Id_mod�rateur) REFERENCES mod�rateur(Id_mod�rateur)
);

CREATE TABLE Asso_7(
   Id_Lexique_ab�cedaire INT,
   Id_Labell INT,
   PRIMARY KEY(Id_Lexique_ab�cedaire, Id_Labell),
   FOREIGN KEY(Id_Lexique_ab�cedaire) REFERENCES Lexique_ab�cedaire(Id_Lexique_ab�cedaire),
   FOREIGN KEY(Id_Labell) REFERENCES Labell(Id_Labell)
);
go