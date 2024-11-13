-- O-O-O
-- KOUASSEU TAMAYEU CHARLY SOREL (GL-C)

-- Exercice 2 : centre de formation

-- Question 1: création de la base de donnée.
CREATE DATABASE IF NOT EXIStS centre_formation;

-- Question 2: creation des tables
USE centre_formation;
-- la table Etudiant:
CREATE TABLE Etudiant(
    NumCNIEtu int primary key NOT NULL,
    nomEtu varchar(255),
    prenomEtu varchar(255),
    dateNaissance date,
    adresseEtu varchar(255),
    villeEtu varchar(255),
    niveauEtu varchar(255) 
);

-- la table Formation :
CREATE TABLE Formation(
    codeForm int primary key not null,
    titreForm varchar(255),
    dureeForm int,
    prixForm float
);

-- la table Session :
CREATE TABLE Session(
    codeSess int primary key NOT NULL,
    nomSess varchar(255),
    dateDebut date,
    dateFin date,
    codeForm int,
    FOREIGN KEY (codeForm) REFERENCES Formation(codeForm)
);

-- la table Inscription :
CREATE TABLE Inscription(
    NumCINEtu int NOT NULL,
    codeSess int NOT NULL,
    TypeCours varchar(255),
    primary key (NumCINEtu, codeSess),
    FOREIGN KEY (NumCINEtu) REFERENCES Etudiant(NumCINEtu),
    FOREIGN KEY (codeSess) REFERENCES Session(codeSess)
);

-- la table Specialite :
CREATE TABLE Specialite(
    codeSpec int primary key not null,
    nomSpec varchar(255),
    descSpec varchar(255)
);

-- la table Appartenir :
CREATE TABLE Appartenir(
    codeSpec int not null,
    codeForm int not null,
    primary key (codeForm, codeSpec),
    FOREIGN KEY (codeSpec) REFERENCES Specialite(codeSpec),
    FOREIGN KEY (codeForm) REFERENCES Formation(codeForm)
);


-- Question 3 : ajouter une contrainte NOT NULL sur typeCours de la table inscription
ALTER TABLE Inscription
MODIFY TypeCours int not null;

-- Question 4 : ajouter unne contrainte CHECK dans la table Session : dateFin doit etre superieure à dateDebut.
ALTER TABLE Session
ADD CONSTRAINT check_date
CHECK (dateDebut < dateFin);

-- Question 5 : ajouter une colonne Active sur la table Specialite
ALTER TABLE specialite
ADD COLUMN active boolean;

--        OU 
-- ALTER TABLE specialite
-- ADD COLUMN active ENUM("1", "0");

