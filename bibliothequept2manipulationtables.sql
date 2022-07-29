INSERT INTO genres(code, libelle) VALUES ('REC','Récit'); 
INSERT INTO genres(code, libelle) VALUES ('POL','Policier'); 
INSERT INTO genres(code, libelle) VALUES ('BD','Bande Dessinée'); 
INSERT INTO genres(code, libelle) VALUES ('INF','Informatique'); 
INSERT INTO genres(code, libelle) VALUES ('THE','Théâtre'); 
INSERT INTO genres(code, libelle) VALUES ('ROM','Roman');

INSERT INTO ouvrages (isbn, titre, auteur, genre, editeur) 
VALUES (2203314168, 'LEFRANC-L''ultimatum', 'Martin, Carin', 'BD', 'Casterman'); 
INSERT INTO ouvrages (isbn, titre, auteur, genre, editeur) 
VALUES (2746021285, 'HTML entraînez-vous pour maîtriser le code source',  
'Luc Van Lancker', 'INF', 'ENI'); 
INSERT INTO ouvrages (isbn, titre, auteur, genre, editeur) 
VALUES (2746026090, ' Oracle 12c SQL, PL/SQL, SQL*Plus', ' J. Gabillaud',  
'INF', 'ENI'); 
INSERT INTO ouvrages (isbn, titre, auteur, genre, editeur) 
VALUES (2266085816, 'Pantagruel', 'François RABELAIS', 'ROM', 'POCKET'); 
INSERT INTO ouvrages (isbn, titre, auteur, genre, editeur) 
VALUES (2266091611, 'Voyage au centre de la terre', 'Jules Verne', 'ROM',  
'POCKET'); 
INSERT INTO ouvrages (isbn, titre, auteur, genre, editeur) 
VALUES (2253010219, 'Le crime de l''Orient Express', 'Agatha Christie',  
'POL', 'Livre de Poche'); 
INSERT INTO ouvrages (isbn, titre, auteur, genre, editeur) 
VALUES (2070400816, 'Le Bourgeois gentilhomme', 'Moliere', 'THE', 'Gallimard'); 
INSERT INTO ouvrages (isbn, titre, auteur, genre, editeur) 
VALUES (2070367177, 'Le curé de Tours', 'Honoré de Balzac', 'ROM', 'Gallimard'); 
INSERT INTO ouvrages (isbn, titre, auteur, genre, editeur) 
VALUES (2080720872, 'Boule de suif', 'Guy de Maupassant', 'REC', 'Flammarion'); 
INSERT INTO ouvrages (isbn, titre, auteur, genre, editeur) 
VALUES (2877065073, 'La gloire de mon père', 'Marcel Pagnol', 'ROM', 'Fallois'); 
INSERT INTO ouvrages (isbn, titre, auteur, genre, editeur) 
VALUES (2020549522, ' L''aventure des manuscrits de la mer morte ', default,  
'REC', 'Seuil'); 
INSERT INTO ouvrages (isbn, titre, auteur, genre, editeur) 
VALUES (2253006327, ' Vingt mille lieues sous les mers ', ' Jules Verne ',  
'ROM', 'LGF'); 
INSERT INTO ouvrages (isbn, titre, auteur, genre, editeur) 
VALUES (2038704015, 'De la terre à la lune', ' Jules Verne', 'ROM', 'Larousse');

INSERT INTO exemplaires(isbn, numero, etat) SELECT isbn, 1,'BO' FROM ouvrages; 
INSERT INTO exemplaires(isbn, numero, etat) SELECT isbn, 2,'MO' FROM ouvrages;

DELETE FROM exemplaires WHERE isbn=2746021285 AND numero=2;

UPDATE exemplaires SET etat='MO' WHERE isbn=2203314168 AND numero=1; 
UPDATE exemplaires SET etat='BO' WHERE isbn=2203314168 AND numero=2; 
INSERT INTO exemplaires(isbn, numero, etat) VALUES (2203314168,3,'NE');

INSERT INTO membres (numero, nom, prenom, adresse, mobile, adhesion, duree) 
VALUES (seq_membre.nextval, 'ALBERT', 'Anne', '13 rue des alpes', 
'0601020304', sysdate-60, 1); 
INSERT INTO membres (numero, nom, prenom, adresse, mobile, adhesion, duree) 
VALUES (seq_membre.nextval, 'BERNAUD', 'Barnabé', '6 rue des bécasses', 
'0602030105', sysdate-10, 3); 
INSERT INTO membres (numero, nom, prenom, adresse, mobile, adhesion, duree) 
VALUES (seq_membre.nextval, 'CUVARD', 'Camille', '52 rue des cerisiers', 
'0602010509', sysdate-100, 6); 
INSERT INTO membres (numero, nom, prenom, adresse, mobile, adhesion, duree) 
VALUES (seq_membre.nextval, 'DUPOND', 'Daniel', '11 rue des daims', 
'0610236515', sysdate-250, 12); 
INSERT INTO membres (numero, nom, prenom, adresse, mobile, adhesion, duree) 
VALUES (seq_membre.nextval, 'EVROUX', 'Eglantine', '34 rue des elfes',  
'0658963125', sysdate-150, 6); 
INSERT INTO membres (numero, nom, prenom, adresse, mobile, adhesion, duree) 
VALUES (seq_membre.nextval, 'FREGEON', 'Fernand', '11 rue des Francs',  
'0602036987', sysdate-400, 6); 
INSERT INTO membres (numero, nom, prenom, adresse, mobile, adhesion, duree) 
VALUES (seq_membre.nextval, 'GORIT', 'Gaston', '96 rue de la glacerie ',  
'0684235781', sysdate-150, 1); 
INSERT INTO membres (numero, nom, prenom, adresse, mobile, adhesion, duree) 
VALUES (seq_membre.nextval, 'HEVARD', 'Hector', '12 rue haute', '0608546578', 
sysdate-250, 12); 
INSERT INTO membres (numero, nom, prenom, adresse, mobile, adhesion, duree) 
VALUES (seq_membre.nextval, 'INGRAND', 'Irène', '54 rue des iris', 
'0605020409', sysdate-50, 12); 
INSERT INTO membres (numero, nom, prenom, adresse, mobile, adhesion, duree) 
VALUES (seq_membre.nextval, 'JUSTE', 'Julien', '5 place des Jacobins',  
'0603069876', sysdate-100, 6);
 
START "C:\Users\franc\Desktop\ENI\Cours\PL SQL\AjouterInformations.sql";

SELECT * FROM emprunts;
SELECT * FROM details;
SELECT * FROM exemplaires;
SELECT * FROM genres;
SELECT * FROM membres;
SELECT * FROM ouvrages;

--activation de l'historique des tables membres et détails

ALTER TABLE membres ENABLE ROW MOVEMENT; 
ALTER TABLE details ENABLE ROW MOVEMENT;

--ajout colonne etat à emprunts

ALTER TABLE emprunts ADD (etat CHAR(2) DEFAULT 'EC');
ALTER TABLE emprunts ADD CONSTRAINT ck_emprunts_etat CHECK (etat in('EC', 'RE')); 

--Mise à jour conditionnelle

INSERT INTO details(emprunt, numero, isbn, exemplaire, rendule) VALUES  
(7,2,2038704015,1,sysdate-136); 
INSERT INTO details(emprunt, numero, isbn, exemplaire, rendule) VALUES  
(8,2,2038704015,1,sysdate-127); 
INSERT INTO details(emprunt, numero, isbn, exemplaire, rendule) VALUES  
(11,2,2038704015,1,sysdate-95); 
INSERT INTO details(emprunt, numero, isbn, exemplaire, rendule) VALUES 
(15,2,2038704015,1,sysdate-54); 
INSERT INTO details(emprunt, numero, isbn, exemplaire, rendule) VALUES  
(16,3,2038704015,1,sysdate-43); 
INSERT INTO details(emprunt, numero, isbn, exemplaire, rendule) VALUES  
(17,2,2038704015,1,sysdate-36); 
INSERT INTO details(emprunt, numero, isbn, exemplaire, rendule) VALUES  
(18,2,2038704015,1,sysdate-24); 
INSERT INTO details(emprunt, numero, isbn, exemplaire, rendule) VALUES  
(19,2,2038704015,1,sysdate-13); 
INSERT INTO details(emprunt, numero, isbn, exemplaire, rendule) VALUES  
(20,3,2038704015,1,sysdate-3);

UPDATE exemplaires SET etat='NE' WHERE isbn=2038704015 AND numero=1;

CREATE TABLE tempoExemplaires AS SELECT isbn, exemplaire, COUNT(*) AS locations 
FROM details 
GROUP BY isbn, exemplaire;

MERGE INTO exemplaires e 
USING (SELECT isbn, exemplaire, locations 
FROM tempoexemplaires) t 
ON (t.isbn=e.isbn and t.exemplaire=e.numero) 
WHEN MATCHED THEN 
  UPDATE SET etat='BO' WHERE t.locations BETWEEN 11 and 25 
  DELETE WHERE t.locations>60;
  
DROP TABLE tempoExemplaires;

--supprimer exemplaires dont l'état est mauvais
INSERT INTO exemplaires(isbn, numero, etat) 
  VALUES (2203314168,4,'MA'); 
INSERT INTO exemplaires(isbn, numero, etat) 
  VALUES (2746021285,3,'MA');
  
DELETE FROM exemplaires WHERE etat='MA';

-- Liste des ouvrages de la bibliothèque
SELECT * FROM ouvrages;

--Membres ayant empruntés un oubrage depuis plus de 2 semaines + titre de l'ouvrage

SELECT membres.*, ouvrages.titre, sysdate - creele as "durée en jours" 
FROM membres INNER JOIN emprunts ON emprunts.membre=membres.numero 
  INNER JOIN details ON details.emprunt=emprunts.numero 
  INNER JOIN ouvrages ON details.isbn=ouvrages.isbn 
WHERE sysdate - creele > 14 
  AND details.rendule is null;
  
--nombre d'ouvrages par genre

SELECT genre, count(*) AS nombre 
FROM exemplaires INNER JOIN ouvrages ON ouvrages.isbn = exemplaires.isbn
GROUP BY genre;

--durée moyenne d'emprunt par membre

SELECT AVG(rendule-creele) AS "Duree moyenne" 
FROM emprunts INNER JOIN details ON emprunts.numero=details.emprunt 
WHERE rendule is not null;
  
--durée moyenne de l'emprunt en fonction du genre du livre

SELECT genre, AVG(rendule-creele) AS "Duree moyenne par genre"
FROM emprunts INNER JOIN details ON emprunts.numero = details.emprunt
INNER JOIN ouvrages ON details.isbn = ouvrages.isbn
WHERE rendule is not null
GROUP BY genre; 

--liste des ouvrages loués plus de 10 fois au cours des 12 derniers mois
SELECT exemplaires.isbn 
FROM emprunts INNER JOIN details ON details.emprunt=emprunts.numero 
INNER JOIN exemplaires ON details.exemplaire=exemplaires.numero 
              AND details.isbn=exemplaires.isbn 
WHERE MONTHS_BETWEEN(emprunts.creele, sysdate)<12 
GROUP BY exemplaireS.isbn 
HAVING COUNT(*)>10;

--liste ouvrages avec numéros d'exemplaires
SELECT ouvrages.*, exemplaires.numero 
FROM ouvrages LEFT OUTER JOIN exemplaires ON 
ouvrages.isbn=exemplaires.isbn;

--vue qui permette de connaitre le nb d'ouvrages empruntés par chaque membre
CREATE OR REPLACE VIEW ouvragesEmpruntes AS 
SELECT emprunts.membre, COUNT(*) AS NombreEmprunts 
FROM emprunts INNER JOIN details ON 
 emprunts.numero=details.emprunt 
 WHERE details.rendule is null 
GROUP BY emprunts.membre;

--vue qui permette de connaitre le nb d'emprunts par ouvrage

CREATE OR REPLACE VIEW NombreEmpruntsParOuvrage AS 
SELECT isbn, COUNT(*) AS NombreEmprunts 
FROM details 
GROUP BY isbn;

--tri des membres
SELECT * FROM membres ORDER BY nom, prenom;

-- obtenir le nombre de locations par titre et le nombre de locations de chaque exemplaire

CREATE GLOBAL TEMPORARY TABLE SyntheseEmprunts ( 
isbn char(10), 
exemplaire number(3), 
nombreEmpruntsExemplaire number(10), 
nombreEmpruntsOuvrage number(10)) 
ON COMMIT PRESERVE ROWS;

INSERT INTO SyntheseEmprunts( 
isbn, exemplaire, nombreEmpruntsExemplaire) 
SELECT isbn, numero, COUNT(*) 
FROM details 
GROUP BY isbn, numero;

UPDATE SyntheseEmprunts 
SET nombreEmpruntsOuvrage=(SELECT COUNT(*) 
FROM details 
WHERE details.isbn=SyntheseEmprunts.isbn);

DELETE FROM SyntheseEmprunts;

--nombre de livres empruntés par genre et par mois. 


CREATE VIEW UnionDetail3Mois AS 
SELECT genre, COUNT(*) AS mois1, 0 AS mois2, 0 AS mois3 
FROM details INNER JOIN ouvrages ON details.isbn=ouvrages.isbn 
WHERE rendule IS NOT NULL 
AND months_between(trunc(sysdate,'MM'), trunc(rendule,'MM'))=0 
GROUP BY genre 
UNION 
SELECT genre, 0 AS mois1, COUNT(*) AS mois2, 0 AS mois3 
FROM details INNER JOIN ouvrages ON details.isbn=ouvrages.isbn 
WHERE rendule IS NOT NULL 
AND months_between(trunc(sysdate,'MM'), trunc(rendule,'MM'))=1 
GROUP BY genre 
UNION 
SELECT genre, 0 AS mois1, 0 AS mois2, COUNT(*) AS mois3 
FROM details INNER JOIN ouvrages ON details.isbn=ouvrages.isbn 
WHERE rendule IS NOT NULL 
AND months_between(trunc(sysdate,'MM'), trunc(rendule,'MM'))=2 
GROUP BY genre;

SELECT genre, SUM(mois1) AS mois1, SUM(mois2) AS mois2, SUM(mois3) AS mois3 
FROM UnionDetail3Mois 
GROUP BY genre;

--Liste des genres et des ouvrages qui appartiennent à chaque genre :

SELECT genres.libelle, ouvrages.titre 
FROM Ouvrages INNER JOIN Genres 
ON genres.code=ouvrages.genre 
ORDER BY genres.libelle, ouvrages.titre;