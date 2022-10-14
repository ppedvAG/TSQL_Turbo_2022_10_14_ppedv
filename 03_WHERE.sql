USE Northwind;

--<, >, <=, >=: kleiner, größer, kleiner-gleich, größer-gleich
--=, !=, <>: gleich, ungleich, ungleich
--BETWEEN, IN: BETWEEN: zwischen X und Y (Grenzen inkludiert), IN: Liste für valide Werte überprüfen
--AND, OR: Bedingungen kombinieren
--NOT: Bedingungen invertieren

SELECT * FROM Orders WHERE Freight >= 50; --Order mit Freight mindestens 50

SELECT * FROM Orders WHERE Freight <= 50; --Order mit Freight nicht mehr als 50

SELECT * FROM Orders WHERE EmployeeID = 1 AND Freight >= 50; --Beide Bedingungen müssen erfüllt sein

SELECT * FROM Orders WHERE EmployeeID = 1 OR Freight >= 50; --Eine der beiden Bedingungen müssen erfüllt sein

SELECT * FROM Orders WHERE EmployeeID BETWEEN 1 AND 3; --BETWEEN: zwischen zwei Werten (1, 2 und 3 nachdem Grenzen inkludiert)

SELECT * FROM Orders WHERE ShippedDate BETWEEN '19970101' AND '19971231'; --Datumsvergleiche müssen ohne Sonderzeichen gemacht werden (nur numerisch)

SELECT * FROM Orders WHERE YEAR(ShippedDate) = 1996; --Funktionen auch im WHERE möglich

SELECT * FROM Orders WHERE DATEPART(DAY, ShippedDate) = 12; --Eine weitere Funktion hier möglich

SELECT * FROM Orders WHERE ShipCountry = 'Italy' OR ShipCountry = 'Spain' OR ShipCountry = 'UK'; --Lang

SELECT * FROM Orders WHERE ShipCountry IN('Italy', 'Spain', 'UK'); --Obiges Statement verkürzt mit IN(...)

SELECT * FROM Orders WHERE EmployeeID IN(1, 3, 6); --Alle Order von Employees 1, 3 und 6

SELECT * FROM Customers WHERE Country = 'Germany'; --WHERE mit Strings

SELECT * FROM Customers WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Köln') --Bedingung in Klammer wird zuerst ausgewertet

SELECT * FROM Customers WHERE Country = 'Germany' ORDER BY ContactName; --Nach ContactName sortieren

SELECT * FROM Customers WHERE Country = 'Germany' ORDER BY ContactName DESC; --Nach ContactName sortieren (absteigend)

SELECT * FROM Customers WHERE Fax = NULL; --= NULL funktioniert nicht

SELECT * FROM Customers WHERE Fax IS NULL OR Fax = ''; --NULL Vergleiche müssen mit IS NULL gemacht werden

SELECT * FROM Customers WHERE Fax IS NOT NULL; --IS NOT NULL um zu schauen welche Datensätze nicht leer

SELECT * FROM Orders WHERE Freight NOT BETWEEN 50 AND 100; --Mit NOT -> BETWEEN invertieren

SELECT * FROM Orders WHERE EmployeeID NOT IN(1, 3, 8); --Mit NOT -> IN invertieren