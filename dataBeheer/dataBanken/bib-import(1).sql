-- !!! OPGELET !!!
-- Als er reeds een database met de naam "bib" bestaat op je MySQL-server,
-- dan zal deze VERWIJDERD en OVERSCHREVEN worden.

DROP DATABASE IF EXISTS bib;

-- Dit script werd enkel getest op een MySQL-server.
-- Voor andere databases (Oracle, Microsoft SQL Server, PostgreSQL, ...)
-- zijn er mogelijks enkele kleine aanpassingen nodig.

CREATE DATABASE bib;
USE bib;

CREATE TABLE auteurs (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  naam VARCHAR(20) NOT NULL,
  geboortedatum DATE,
  PRIMARY KEY (id)
);
CREATE TABLE categorien (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  label VARCHAR(20) NOT NULL,
  PRIMARY KEY (id)
);
CREATE TABLE uitgevers (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  naam VARCHAR(20) NOT NULL,
  website VARCHAR(50),
  PRIMARY KEY (id)
);
CREATE TABLE boeken (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  titel VARCHAR(50) NOT NULL,
  auteur_id INT UNSIGNED,
  publ_jaar INT,
  cat_id INT UNSIGNED,
  uitg_id INT UNSIGNED,
  PRIMARY KEY (id),
  FOREIGN KEY (auteur_id) REFERENCES auteurs(id),
  FOREIGN KEY (cat_id) REFERENCES categorien(id),
  FOREIGN KEY (uitg_id) REFERENCES uitgevers(id)
);
CREATE TABLE klanten (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  naam VARCHAR(30) NOT NULL,
  woonplaats VARCHAR(30),
  PRIMARY KEY (id)
);
CREATE TABLE uitleningen (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  boek_id INT UNSIGNED NOT NULL,
  uitl_datum DATE NOT NULL,
  klant_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (boek_id) REFERENCES boeken(id),
  FOREIGN KEY (klant_id) REFERENCES klanten(id)
);
INSERT INTO auteurs (id,naam,geboortedatum) VALUES
(18,'Herman Brusselmans','1957-10-09'),
(15,'John Paul Mueller',NULL),
(16,'J.K. Rowling','1965-07-31'),
(17,'Suzanne Collins','1962-08-10'),
(19,'J.R.R. Tolkien','1892-01-03'),
(20,'George Orwell','1903-06-25'),
(21,'William Shakespeare','1564-04-23'),
(1,'Willem Elsschot','1882-05-07'),
(2,'Louis Paul Boon','1912-03-15'),
(3,'Hugo Claus','1929-04-05'),
(4,'Tom Lanoye','1958-08-27'),
(5,'Zinzen',NULL),
(6,'Tuchman',NULL),
(7,'Agatha Christie','1890-09-15'),
(8,'Bilzen',NULL),
(9,'Pauwels',NULL),
(10,'Konrad',NULL),
(11,'Breemeersch',NULL),
(12,'Jennings',NULL),
(13,'Meyer',NULL),
(14,'Jordan',NULL),
(22,'Peter Kent',NULL);
INSERT INTO categorien (id,label) VALUES
(1,'non-fictie'),
(2,'fictie'),
(3,'poëzie'),
(4,'toneel');
INSERT INTO uitgevers (id,naam,website) VALUES
(9,'BBNC Uitgevers','www.bbnc.nl'),
(10,'De Harmonie','www.deharmonie.nl'),
(11,'Scholastic','scholastic.com/home'),
(12,'Allen & Unwin','www.allenandunwin.com'),
(13,'Boekerij','www.boekerij.nl'),
(14,'Secker & Warburg',NULL),
(1,'Hadewijch',NULL),
(2,'Lannoo','www.lannoo.be'),
(4,'Querido',NULL),
(5,'Arbeiderspers',NULL),
(6,'De Bezige Bij',NULL),
(7,'Prometheus',NULL),
(8,'QUE',NULL);
INSERT INTO boeken (id,auteur_id,publ_jaar,titel,cat_id,uitg_id) VALUES
(101,17,2008,'The Hunger Games',2,11),
(102,19,1954,'The Lord of the Rings',2,12),
(103,19,1960,'De Hobbit',2,13),
(104,22,1996,'Cryptovaluta minen voor dummies',1,9),
(105,15,2017,'Programmeren met Python voor dummies',1,9),
(106,16,1998,'Harry Potter en de Steen der Wijzen',2,10),
(107,16,1999,'Harry Potter en de Geheime Kamer',2,10),
(108,20,1945,'Animal Farm',2,14),
(109,20,1949,'1984',2,14),
(110,21,1600,'Hamlet',4,NULL),
(112,14,NULL,'Gestructureerde Analyse',1,9),
(113,14,1992,'OO software ontwerp',1,9),
(114,12,1997,'   Compleet handboek Access 97',1,8),
(115,12,1999,'Compleet handboek Access 2000   ',1,8),
(117,11,1999,'Tuinieren voor beginners',1,7),
(118,11,1999,'Tuinieren voor gevorderden',1,6),
(116,12,1995,'Compleet handboek Access 95',1,8),
(119,11,1998,'Japanse tuinen',1,6),
(181,1,1953,'Kaas',2,4),
(182,2,1962,'Jan De Lichte',2,5),
(183,2,1964,'Geuzenboek',2,5),
(184,3,1983,'Het verdriet van België',2,6),
(194,3,1996,'De geruchten',2,6),
(196,3,1970,'De koele minnaar',2,6),
(197,4,1993,'Kartonnen dozen',2,7);
INSERT INTO klanten (id,naam,woonplaats) VALUES
(1,'Maertens','Brugge'),
(2,'Deblaere','Gent'),
(3,'Vanzever','Brugge'),
(4,'Vermander','Brugge'),
(5,'Willems','Gent'),
(6,'Peeters','Brugge'),
(7,'Peeters','Oostende'),
(10,'Arnolds','Blankenberge'),
(8,'Holvoet','Oostende'),
(9,'De Coninck','Brugge');
INSERT INTO uitleningen (id,boek_id,uitl_datum,klant_id) VALUES
(1,183,'2013-12-31',3),
(2,182,'2015-5-1',3),
(3,103,'2015-5-3',1),
(4,184,'2015-5-3',1),
(5,197,'2015-5-6',2),
(6,114,'2015-9-1',9),
(7,115,'2015-9-1',9),
(8,118,'2015-9-5',10),
(9,112,'2015-9-12',7),
(52,118,'2022-5-2',2),
(53,118,'2023-5-2',2),
(54,118,'2024-5-2',2),
(55,118,'2025-5-2',2),
(56,118,'2026-5-2',2),
(57,118,'2027-5-2',2),
(58,118,'2028-5-2',2),
(59,118,'2029-5-2',2),
(44,116,'2017-5-2',9),
(11,104,'2016-9-9',8),
(10,104,'2015-9-9',8),
(77,110,'2015-10-30',4),
(12,104,'2016-9-9',9);
