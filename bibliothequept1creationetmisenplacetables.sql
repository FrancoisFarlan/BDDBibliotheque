CREATE TABLE genres( 
code char(5) CONSTRAINT pk_genres PRIMARY KEY, 
libelle varchar2(80) not null);

CREATE TABLE ouvrages( 
  isbn number(10) CONSTRAINT pk_ouvrages PRIMARY KEY, 
  titre varchar2(200)not null, 
  auteur varchar2(80), 
  genre char(5) not null 
  CONSTRAINT fk_ouvrages_genres REFERENCES genres(code), 
  editeur varchar2(80) 
);

CREATE TABLE exemplaires( 
  isbn number(10), 
  numero number(3), 
  etat char(5), 
  CONSTRAINT pk_exemplaires PRIMARY KEY(isbn, numero), 
  CONSTRAINT fk_exemplaires_ouvrages 
    FOREIGN KEY(isbn) references ouvrages(isbn), 
  CONSTRAINT ck_exemplaires_etat CHECK 
    (etat in('NE','BO','MO','MA')) 
);

CREATE TABLE membres( 
  numero number(6) CONSTRAINT pk_membres PRIMARY KEY, 
  nom varchar2(80) not null, 
  prenom varchar2(80) not null, 
  adresse varchar2(200) not null, 
  telephone char(10) not null, 
  adhesion date not null, 
  duree number(2) not null, 
  CONSTRAINT ck_membres_duree CHECK (duree>=0) 
);

CREATE TABLE emprunts( 
numero number(10) CONSTRAINT pk_emprunts PRIMARY KEY, 
membre number(6) CONSTRAINT fk_emprunts_membres REFERENCES MEMBRES(numero), 
creele date default sysdate);

CREATE TABLE detailsemprunts( 
emprunt number(10) CONSTRAINT fk_details_emprunts REFERENCES 
emprunts(numero), 
numero number(3), 
isbn number(10), 
exemplaire number(3), 
rendule date, 
CONSTRAINT pk_detailsemprunts PRIMARY KEY (emprunt, numero), 
CONSTRAINT fk_detailsemprunts_exemplaires FOREIGN KEY(isbn, exemplaire) 
REFERENCES exemplaires(isbn, numero));

CREATE SEQUENCE seq_membre START WITH 1 INCREMENT BY 1;

ALTER TABLE membres ADD CONSTRAINT uq_membres UNIQUE (nom, prenom, 
telephone);

ALTER TABLE membres ADD mobile char(10); 
ALTER TABLE membres ADD CONSTRAINT ck_membres_mobile CHECK 
(mobile LIKE '06%' OR mobile LIKE '07%');

ALTER TABLE membres DROP CONSTRAINT uq_membres;

ALTER TABLE membres SET UNUSED (telephone);

ALTER TABLE membres DROP UNUSED columns;

ALTER TABLE membres ADD CONSTRAINT uq_membres UNIQUE (nom, prenom, mobile);

CREATE INDEX idx_ouvrages_genre ON ouvrages(genre); 
CREATE INDEX idx_emplaires_isbn ON exemplaires(isbn); 
CREATE INDEX idx_emprunts_membre ON emprunts(membre); 
CREATE INDEX idx_details_emprunt ON detailsemprunts(emprunt); 
CREATE INDEX idx_details_exemplaire ON detailsemprunts(isbn, exemplaire);
 
ALTER TABLE detailsemprunts DROP CONSTRAINT fk_details_emprunts;

ALTER TABLE detailsemprunts ADD CONSTRAINT  
fk_details_emprunts FOREIGN KEY(emprunt) REFERENCES  
emprunts(numero) ON DELETE CASCADE;

ALTER TABLE exemplaires MODIFY ( 
etat char(2) default 'NE');

CREATE SYNONYM abonnes FOR membres;

RENAME detailsemprunts TO details;