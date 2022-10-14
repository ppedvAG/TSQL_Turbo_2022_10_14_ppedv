USE Northwind;

--Kommentar

/*
Mehrzeilige
Kommentare
*/

SELECT 100; --Einzelnen Wert ausgeben

SELECT 'Test'; --Markieren, Strg + E: einzelnen Statement ausführen

SELECT 100 * 3; --Berechnung

SELECT '100 * 3';

--Strg + R: Ergebnis schließen

SELECT 'Test' AS Text; --AS: Spalte einen Namen geben

SELECT 100, 'Test'; --Mit Beistrich getrennt mehrere Spalten ausgeben

SELECT 10.5; --Kommazahl mit Punkt statt mit Beistrich

--Strg + K, C: Ausgewählte Zeilen auskommentieren
--Strg + K, U: Ausgewählte Zeilen einkommentieren
--Alt + Pfeiltaste: Derzeitige Zeile bewegen

SELECT * FROM Customers; --Alle Daten aus der Tabelle holen mit *

SELECT CompanyName FROM Customers; --Einzelne Spalte auswählen

SELECT CompanyName, ContactName FROM Customers; --Mehrere Spalten auswählen

SELECT Freight * 2 AS FreightMal2 FROM Orders; --Auf Spalte Berechnungen ausführen, wird auf jede Zeile angewandt

SELECT CompanyName + Address + City + PostalCode + Country FROM Customers; --Spalten verbinden (unschön)

SELECT CompanyName + ' ' + Address + ' ' + City + ', ' + PostalCode + ' ' + Country AS [Volle Adresse] FROM Customers; --Strings verbinden mit Leerzeichen dazwischen
--Namen mit Leerzeichen drinnen müssen mit [] umgeben sein oder mit ""

SELECT cd.CustomerDesc FROM CustomerDemographics AS cd; --Tabellenalias