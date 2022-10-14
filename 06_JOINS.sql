USE Northwind;

SELECT * FROM Orders; --EmployeeID
SELECT * FROM Employees; --Datensätze kombinieren über EmployeeID

SELECT * FROM Orders
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID; --Spalten auswählen die in beiden Tabellen sind

SELECT 
Orders.EmployeeID, --Ambiguous column name: Eine Tabelle auswählen aus der die Spalte entnommen wird
FirstName + ' ' + LastName AS FullName,
Freight,
ShipName,
ShipAddress
FROM Orders
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID;

SELECT 
o.EmployeeID,
e.FirstName + ' ' + e.LastName AS FullName,
o.Freight,
o.ShipName,
o.ShipAddress
FROM Orders o
INNER JOIN Employees e
ON o.EmployeeID = e.EmployeeID; --Aliases: Tabelle einen Kurznamen geben um weniger Code zu tippen

SELECT * FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID; --Orders und Customer joinen

SELECT 
o.OrderID,
o.OrderDate,
o.RequiredDate,
o.ShippedDate,
c.CompanyName,
c.ContactName,
CONCAT_WS(' ', c.Address, c.City, c.PostalCode, c.Country)
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID; --Sinnvolle Spalten auswählen

SELECT * FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID; --Tabellen im FROM und im JOIN vertauschen um Ausgabe anzupassen (Customer links, Orders rechts)

--JOIN mit mehr als 2 Tabellen
SELECT * FROM Orders o --Orders als Basistabelle
INNER JOIN Customers c ON o.CustomerID = c.CustomerID --Erster JOIN
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID --Zweiter JOIN

SELECT 
o.OrderID,
o.Freight,
o.RequiredDate,
o.ShippedDate,
e.FirstName + ' ' + e.LastName,
c.CompanyName,
c.ContactName
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID

SELECT * FROM Orders o
RIGHT JOIN Customers c
ON o.CustomerID = c.CustomerID; --832 Rows (Zeile 189)

SELECT * FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID; --830 Rows (Customer ohne Order fallen weg)

SELECT * FROM Customers c
LEFT JOIN Orders o
ON o.CustomerID = c.CustomerID; --Customer und Order vertauschen damit Customer links sind

SELECT * FROM Customers c
LEFT JOIN Orders o
ON o.CustomerID = c.CustomerID
WHERE o.OrderID IS NULL; --Finde alle Kunden die keine Orders getätigt haben bisher

SELECT * FROM Orders CROSS JOIN Customers; --Bildet ein Kreuzprodukt (alle Kombinationen) zwischen beiden Tabellen