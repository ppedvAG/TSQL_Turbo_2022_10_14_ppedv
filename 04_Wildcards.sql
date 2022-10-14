USE Northwind;

SELECT * FROM Customers WHERE Country LIKE 'A%'; --Alle Customer in L�ndern die mit A anfangen (A und danach beliebig viele Zeichen)

SELECT * FROM Customers WHERE Country LIKE 'a%'; --Case-Insensitive (selbes Ergebnis wie oben)

SELECT * FROM Customers WHERE Country LIKE '%A'; --L�nder finden die mit A enden

SELECT * FROM Customers WHERE Country LIKE '%A%'; --Alle L�nder mit A drinnen

SELECT * FROM Customers WHERE Country LIKE '%A%A%'; --Alle L�nder mit zwei A drinnen

SELECT * FROM Customers WHERE CustomerID LIKE 'AN%'; --Mehrere Zeichen in den Wildcardstring

SELECT * FROM Customers WHERE City LIKE '_�nchen'; --Genau ein Zeichen suchen

SELECT * FROM Customers WHERE PostalCode LIKE '____'; --Alle Vierstelligen Postleitzahlen finden (Suche genau 4 beliebige Zeichen)

SELECT * FROM Customers WHERE PostalCode LIKE '1___'; --Alle Postleitzahlen finden die mit einer 1 anfangen und danach genau 3 Zeichen haben

SELECT * FROM Customers WHERE Country LIKE '[abc]%'; --Alle L�nder die mit A, B oder C anfangen

SELECT * FROM Customers WHERE Country LIKE '[a-d]%'; --Alle L�nder von A bis D

SELECT * FROM Customers WHERE ContactName LIKE '[^a-d]%' ORDER BY ContactName; --Alle Kunden die NICHT mit A bis D anfangen

SELECT * FROM Customers WHERE ContactName LIKE '[a-d|x-z]%' ORDER BY ContactName; --Alle Kunden die mit A bis D oder X bis Z anfangen

SELECT * FROM Customers WHERE CompanyName LIKE '%[%]%'; --Sonderfall: Prozent im Namen suchen mit [%]

SELECT * FROM Customers WHERE CompanyName LIKE '%['']%'; --Sonderfall: Hochkomma im Namen suchen mit ['']