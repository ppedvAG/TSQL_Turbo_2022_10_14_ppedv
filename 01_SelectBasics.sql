USE Northwind;

--Kommentar

/*
Mehrzeilige
Kommentare
*/

SELECT 100; --Einzelnen Wert ausgeben

SELECT 'Test'; --Markieren, Strg + E: einzelnen Statement ausf�hren

SELECT 100 * 3; --Berechnung

SELECT '100 * 3';

--Strg + R: Ergebnis schlie�en

SELECT 'Test' AS Text; --AS: Spalte einen Namen geben

SELECT 100, 'Test'; --Mit Beistrich getrennt mehrere Spalten ausgeben

SELECT 10.5; --Kommazahl mit Punkt statt mit Beistrich

--Strg + K, C: Ausgew�hlte Zeilen auskommentieren
--Strg + K, U: Ausgew�hlte Zeilen einkommentieren
--Alt + Pfeiltaste: Derzeitige Zeile bewegen

SELECT * FROM Customers; --Alle Daten aus der Tabelle holen mit *

SELECT CompanyName FROM Customers; --Einzelne Spalte ausw�hlen

SELECT CompanyName, ContactName FROM Customers; --Mehrere Spalten ausw�hlen

SELECT Freight * 2 AS FreightMal2 FROM Orders; --Auf Spalte Berechnungen ausf�hren, wird auf jede Zeile angewandt

SELECT CompanyName + Address + City + PostalCode + Country FROM Customers; --Spalten verbinden (unsch�n)

SELECT CompanyName + ' ' + Address + ' ' + City + ', ' + PostalCode + ' ' + Country AS [Volle Adresse] FROM Customers; --Strings verbinden mit Leerzeichen dazwischen
--Namen mit Leerzeichen drinnen m�ssen mit [] umgeben sein oder mit ""

SELECT cd.CustomerDesc FROM CustomerDemographics AS cd; --Tabellenalias