#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: filière
#------------------------------------------------------------

CREATE TABLE filiere(
        idFiliere Int  Auto_increment  NOT NULL ,
        nom       Varchar (50) NOT NULL
	,CONSTRAINT filiere_PK PRIMARY KEY (idFiliere)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: groupe
#------------------------------------------------------------

CREATE TABLE groupe(
        idGroupe  Int  Auto_increment  NOT NULL ,
        nom       Varchar (50) NOT NULL ,
        idFiliere Int NOT NULL
	,CONSTRAINT groupe_PK PRIMARY KEY (idGroupe)

	,CONSTRAINT groupe_filiere_FK FOREIGN KEY (idFiliere) REFERENCES filiere(idFiliere)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: sousGroupe
#------------------------------------------------------------

CREATE TABLE sousGroupe(
        idSousGroupe  Int  Auto_increment  NOT NULL ,
        nomSousGroupe Varchar (50) NOT NULL ,
        idGroupe      Int NOT NULL
	,CONSTRAINT sousGroupe_PK PRIMARY KEY (idSousGroupe)

	,CONSTRAINT sousGroupe_groupe_FK FOREIGN KEY (idGroupe) REFERENCES groupe(idGroupe)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: cours
#------------------------------------------------------------

CREATE TABLE cours(
        idCours         Int  Auto_increment  NOT NULL ,
        nomCours        Varchar (50) NOT NULL ,
        nbrHeures       TinyINT NOT NULL ,
        videoprojecteur Bool NOT NULL ,
        machines        Bool NOT NULL ,
        enceintes       Bool NOT NULL ,
        CM              Bool NOT NULL ,
        nbrH_CM         TinyINT ,
        TD              Bool NOT NULL ,
        nbrH_TD         TinyINT ,
        TP              Bool NOT NULL ,
        nbrH_TP         TinyINT
	,CONSTRAINT cours_PK PRIMARY KEY (idCours)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: enseignant
#------------------------------------------------------------

CREATE TABLE enseignant(
        idEnseignant  Int  Auto_increment  NOT NULL ,
        nomEnseignant Varchar (50) NOT NULL
	,CONSTRAINT enseignant_PK PRIMARY KEY (idEnseignant)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: site
#------------------------------------------------------------

CREATE TABLE site(
        idSite  Int  Auto_increment  NOT NULL ,
        nomSite Varchar (20) NOT NULL
	,CONSTRAINT site_PK PRIMARY KEY (idSite)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: batiment
#------------------------------------------------------------

CREATE TABLE batiment(
        idBatiment     Int  Auto_increment  NOT NULL ,
        nomBatiment    Varchar (50) NOT NULL ,
        heureOuverture Time NOT NULL ,
        heureFermeture Time NOT NULL ,
        idSite         Int NOT NULL
	,CONSTRAINT batiment_PK PRIMARY KEY (idBatiment)

	,CONSTRAINT batiment_site_FK FOREIGN KEY (idSite) REFERENCES site(idSite)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: salle
#------------------------------------------------------------

CREATE TABLE salle(
        idSalle         Int  Auto_increment  NOT NULL ,
        nomSalle        Varchar (20) NOT NULL ,
        nbrPlace        TinyINT NOT NULL ,
        enceintes       Bool NOT NULL ,
        videoprojecteur Bool NOT NULL ,
        machines        Bool NOT NULL ,
        nbrMachines     TinyINT NOT NULL ,
        idBatiment      Int NOT NULL
	,CONSTRAINT salle_PK PRIMARY KEY (idSalle)

	,CONSTRAINT salle_batiment_FK FOREIGN KEY (idBatiment) REFERENCES batiment(idBatiment)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: user
#------------------------------------------------------------

CREATE TABLE user(
        idUsers  Int  Auto_increment  NOT NULL ,
        email    Varchar (50) NOT NULL ,
        password Varchar (50) NOT NULL
	,CONSTRAINT user_PK PRIMARY KEY (idUsers)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: etudiant
#------------------------------------------------------------

CREATE TABLE etudiant(
        idEtudiant    Int  Auto_increment  NOT NULL ,
        nom           Varchar (50) NOT NULL ,
        prenom        Varchar (50) NOT NULL ,
        dateNaissance Date NOT NULL ,
        idFiliere     Int NOT NULL ,
        idGroupe      Int NOT NULL ,
        idSousGroupe  Int NOT NULL
	,CONSTRAINT etudiant_PK PRIMARY KEY (idEtudiant)

	,CONSTRAINT etudiant_filiere_FK FOREIGN KEY (idFiliere) REFERENCES filiere(idFiliere)
	,CONSTRAINT etudiant_groupe0_FK FOREIGN KEY (idGroupe) REFERENCES groupe(idGroupe)
	,CONSTRAINT etudiant_sousGroupe1_FK FOREIGN KEY (idSousGroupe) REFERENCES sousGroupe(idSousGroupe)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: enseigner
#------------------------------------------------------------

CREATE TABLE enseigner(
        idEnseignant Int NOT NULL ,
        idCours      Int NOT NULL ,
        type         Char (50) NOT NULL
	,CONSTRAINT enseigner_PK PRIMARY KEY (idEnseignant,idCours)

	,CONSTRAINT enseigner_enseignant_FK FOREIGN KEY (idEnseignant) REFERENCES enseignant(idEnseignant)
	,CONSTRAINT enseigner_cours0_FK FOREIGN KEY (idCours) REFERENCES cours(idCours)
)ENGINE=InnoDB;

