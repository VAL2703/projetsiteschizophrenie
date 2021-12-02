USE schiBD
go

CREATE TABLE adhérent(
   Id_adhérent INT IDENTITY,
   nom VARCHAR(50)  NOT NULL,
   prénom VARCHAR(50)  NOT NULL,
   pseudo VARCHAR(50)  NOT NULL,
   date_de_naissance VARCHAR(50)  NOT NULL,
   mot_de_passe DECIMAL(6,0)   NOT NULL,
   adresse_mail VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_adhérent)
);

CREATE TABLE formulaire(
   Id_formulaire INT IDENTITY,
   nom VARCHAR(50)  NOT NULL,
   prénom VARCHAR(50)  NOT NULL,
   pseudo VARCHAR(50)  NOT NULL,
   date_de_naissance DATE NOT NULL,
   mot_de_passe VARCHAR(50)  NOT NULL,
   Id_adhérent INT NOT NULL,
   PRIMARY KEY(Id_formulaire),
   FOREIGN KEY(Id_adhérent) REFERENCES adhérent(Id_adhérent)
);

CREATE TABLE forum_de_témoignages(
   Id_forum_de_témoignages INT IDENTITY,
   adhérents VARCHAR(50)  NOT NULL,
   des_themes VARCHAR(50)  NOT NULL,
   date_dépôt_du_témoignage DATE NOT NULL,
   témoignages VARCHAR(280)  NOT NULL,
   PRIMARY KEY(Id_forum_de_témoignages)
);

CREATE TABLE Forum_de_discussions(
   Id_Forum_de_discussions INT IDENTITY,
   un_theme VARCHAR(50)  NOT NULL,
   des_adhérents VARCHAR(50)  NOT NULL,
   médiateur_s_ VARCHAR(50)  NOT NULL,
   des_questions VARCHAR(200)  NOT NULL,
   des_réponses VARCHAR(200)  NOT NULL,
   des_catégories VARCHAR(110)  NOT NULL,
   Date_de_la_question DATE NOT NULL,
   Date_de_la_réponse DATE NOT NULL,
   PRIMARY KEY(Id_Forum_de_discussions)
);

CREATE TABLE modérateur(
   Id_modérateur INT IDENTITY,
   adresse_mail_adhérent VARCHAR(50)  NOT NULL,
   Pseudo VARCHAR(50) ,
   question_réponse VARCHAR(50)  NOT NULL,
   article VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_modérateur)
);

CREATE TABLE Lexique_abécedaire(
   Id_Lexique_abécedaire INT IDENTITY,
   mots VARCHAR(50) ,
   lettres VARCHAR(1) ,
   Définition_des_mots VARCHAR(50) ,
   PRIMARY KEY(Id_Lexique_abécedaire)
);

CREATE TABLE Labell(
   Id_Labell INT IDENTITY,
   Définition VARCHAR(50) ,
   PRIMARY KEY(Id_Labell)
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
   valider BIT,
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
   valider BIT NOT NULL,
   bannir BIT,
   PRIMARY KEY(Id_Forum_de_discussions, Id_modérateur),
   FOREIGN KEY(Id_Forum_de_discussions) REFERENCES Forum_de_discussions(Id_Forum_de_discussions),
   FOREIGN KEY(Id_modérateur) REFERENCES modérateur(Id_modérateur)
);

CREATE TABLE Asso_7(
   Id_Lexique_abécedaire INT,
   Id_Labell INT,
   PRIMARY KEY(Id_Lexique_abécedaire, Id_Labell),
   FOREIGN KEY(Id_Lexique_abécedaire) REFERENCES Lexique_abécedaire(Id_Lexique_abécedaire),
   FOREIGN KEY(Id_Labell) REFERENCES Labell(Id_Labell)
);
go