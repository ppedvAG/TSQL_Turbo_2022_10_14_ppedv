USE Northwind;

--CREATE TABLE <Name> (<Spalte1> <Typ>, ...)
CREATE TABLE Test
(
	--primary key: Prim�rschl�ssel, eindeutige Spalte, kann nicht null sein, h�ufig IDs, mehrere Prim�rschl�ssel m�glich (kombinierter Schl�ssel)
	--identity: Erh�ht die Spalte automatisch um 1 wenn ein neuer Wert geschrieben wird
	--identity(<Startwert>, <Inkrement>): Starte bei <Startwert>, erh�he um <Inkrement>, identity(5, 3) -> 5, 8, 11, 14, 17, ...
	ID int primary key identity, --(5, 3)
	Vorname nvarchar(20),
	Nachname nvarchar(20) not null --Es muss bei jedem Datensatz ein Wert enthalten sein
);

--------------------------------------------------------------------------------------------

--INSERT INTO <Tabelle> VALUES (<Wert1>, <Wert2>, ...), (<Wert1>, <Wert2>, ...)
INSERT INTO Test VALUES
('Max', 'Muster')

--Mehrere Datens�tze gleichzeitig einf�gen
INSERT INTO Test VALUES
('Max', 'Muster'),
('Test', 'Test')

--Nur bestimmte Spalten in die Tabelle schreiben
INSERT INTO Customers (CustomerID, CompanyName, ContactName) VALUES
('PPEDV', 'PPEDV', 'Eine Person')

--Nicht m�glich, da Nachname NOT NULL
INSERT INTO Test VALUES
('Max', NULL)
GO

--Ergebnisse von SELECT direkt in eine Tabelle schreiben
INSERT INTO Test
SELECT FirstName, LastName FROM Employees;

--SELECT INTO: Ergebnis einer SELECT Abfrage in eine NEUE Tabelle schreiben
SELECT FirstName, LastName INTO Test
FROM Employees; --funktioniert nicht, da Test bereits existiert

--------------------------------------------------------------------------------------------

--UPDATE <Name> SET <Spaltenname> = <Wert>
UPDATE Test SET Nachname = 'Test';

--WHERE unbedingt verwenden um nicht alle Daten zu ver�ndern
UPDATE Test SET Nachname = 'Test2'
WHERE ID BETWEEN 5 AND 10;

--Spalte kann nach dem = verwendet werden
UPDATE Test SET Nachname = REPLICATE(Nachname, 5);

--------------------------------------------------------------------------------------------

--CREATE SEQUENCE <Name> AS <Typ>
--Standardm��ig (1, 1)
CREATE SEQUENCE TestSeq AS INT;

--CREATE SEQUENCE <Name> AS <Typ>
--START WITH <Start> INCREMENT BY <Increment>
CREATE SEQUENCE TestSeq AS INT
START WITH 230000
INCREMENT BY 1;

--N�chsten Wert aus der Sequenz entnehmen
SELECT NEXT VALUE FOR TestSeq;

--Bei INSERT n�chsten Wert abrufen
INSERT INTO Test VALUES
(CONVERT(varchar(20), NEXT VALUE FOR TestSeq), 'Test');

--Sequenz zur�cksetzen
ALTER SEQUENCE TestSeq RESTART WITH 230000;

--------------------------------------------------------------------------------------------

--DELETE FROM <Tabelle>
--L�scht alle Daten ohne WHERE
DELETE FROM Test;

--WHERE zum Einschr�nken
DELETE FROM Test WHERE ID > 20;

--TRUNCATE l�scht alle Daten aus der Tabelle genauso wie DELETE ohne WHERE
--WHERE nicht m�glich bei TRUNCATE
--Programmiere wollte explizit alle Daten l�schen und hat kein WHERE vergessen
TRUNCATE TABLE Test;

--------------------------------------------------------------------------------------------

--ALTER TABLE <Name> ADD <Name> <Typ>
--Spalte hinzuf�gen
ALTER TABLE Test ADD Seq INT;

--Spalte entfernen
ALTER TABLE Test DROP COLUMN Seq;

--------------------------------------------------------------------------------------------

SELECT * FROM INFORMATION_SCHEMA.TABLES; --Alle Tabellen und Views anzeigen
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'; --Alle Tabellen anzeigen

SELECT * FROM INFORMATION_SCHEMA.COLUMNS; --Alle Spalten aller Tabellen in der Datenbank anzeigen
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Test'; --Eine Tabelle ausw�hlen zum anzeigen

--------------------------------------------------------------------------------------------

--Tabelle l�schen
DROP TABLE Test;