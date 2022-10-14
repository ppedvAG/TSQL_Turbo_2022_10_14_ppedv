USE Northwind;

--Datumsfunktionen

SELECT GETDATE(); --Jetztiges Datum, Millisekundengenau

/*
	Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, m = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

SELECT YEAR(GETDATE()); --Jahr von einem Datum zurückgeben
SELECT MONTH(GETDATE()); --Monat von einem Datum zurückgeben
SELECT DAY(GETDATE()); --Tag von einem Datum zurückgeben

SELECT YEAR(HireDate) FROM Employees; --Datumsfunktion auf Datumsspalte anwenden

SELECT DATEPART(HOUR, GETDATE()); --Stundenteil vom heutigen Datum
SELECT DATEPART(YY, GETDATE()); --Alle Intervalle hier möglich
SELECT DATEPART(QQ, GETDATE()); --Quartal vom heutigen Datum

SELECT DATEDIFF(YY, '2000-12-31', GETDATE()); --Schaut nur auf den Jahresteil
SELECT DATEDIFF(DD, '2000-12-31', GETDATE()) / 365.25; --Jahresabstand über Tage berechnen

SELECT DATENAME(MONTH, GETDATE()); --Schöner Name vom heutigen Monat ausgeben
SELECT DATENAME(WEEKDAY, GETDATE()); --Schöner Name vom heutigen Tag ausgeben (hier Weekday benutzen)

--Stringfunktionen

SELECT CompanyName + Address + City + PostalCode + Country FROM Customers;

SELECT CONCAT(CompanyName, Address, City, PostalCode, Country) FROM Customers; --Selbes Ergebnis wie oben nur besser lesbar

SELECT CONCAT_WS(' ', CompanyName, Address, City, PostalCode, Country) FROM Customers; --CONCAT_WS: Concat with Seperator, beliebig viele Spalten mit Seperator verbinden

SELECT TRIM(' Test '); --Abstände links und rechts entfernen
SELECT LTRIM(' Test '); --Abstände links entfernen
SELECT RTRIM(' Test '); --Abstände rechts entfernen

SELECT LOWER('Test'); --Ganzer Text kleingeschrieben
SELECT UPPER('Test'); --Ganzer Text GROßGESCHRIEBEN

SELECT LEN('Test '); --LEN macht automatisch ein RTRIM
SELECT LEN(' Test '); --LEN macht automatisch ein RTRIM
SELECT DATALENGTH(' Test '); --DATALENGTH gibt die Länge ohne TRIM aus

--Konvertierungsfunktionen

SELECT CAST(GETDATE() AS DATE); --Datetime zu Date umwandeln um Zeitteil abzuschneiden

SELECT CAST(GETDATE() AS TIME); --Datetime zu Time umwandeln um Datumsteil abzuschneiden

SELECT HireDate, CAST(HireDate AS date) FROM Employees; --Bei Spalte mit Datum den Zeitteil abschneiden

SELECT '123' + 4; --123 konnte zu einer Zahl umgewandelt werden
SELECT '123.4' + 4; --Nicht möglich, da Kommazahl

SELECT CAST('123.4' AS FLOAT) + 5; --Obiges Beispiel möglich mit Konvertierung

SELECT CAST('14.10.2022' AS DATE); --Heutiges (deutsches) Datum Konvertieren

SELECT CAST('10/14/2022' AS DATE); --Amerikanisches Datum funktioniert hier nicht

SELECT CAST('14/10/2022' AS DATE);

--------------------------------------------------------

SELECT CONVERT(DATE, GETDATE()); --funktioniert genauso wie CAST

--https://learn.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-2017#date-and-time-styles
SELECT CONVERT(VARCHAR, GETDATE(), 4); --Kurzes deutsches Datum
SELECT CONVERT(VARCHAR, GETDATE(), 104); --Langes deutsches Datum

--------------------------------------------------------

/*
	Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, n = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

SELECT FORMAT(GETDATE(), 'yyyy-MM-dd'); --Datumsformatierungen mit FORMAT

SELECT FORMAT(GETDATE(), 'dd.MM.'); --Mit höchster Präzision eine Datumsformatierung machen

SELECT FORMAT(GETDATE(), 'MM'); --10
SELECT FORMAT(GETDATE(), 'MMM'); --Okt
SELECT FORMAT(GETDATE(), 'MMMM'); --Oktober

SELECT FORMAT(GETDATE(), 'dd'); --14
SELECT FORMAT(GETDATE(), 'ddd'); --Fr
SELECT FORMAT(GETDATE(), 'dddd'); --Freitag

SELECT FORMAT(GETDATE(), 'd'); --27.09.2022 (kurzes deutsches Datum)
SELECT FORMAT(GETDATE(), 'D'); --Freitag, 14. Oktober 2022 (langes deutsches Datum)

SELECT FORMAT(GETDATE(), 'dddd, dd. MMMM yyyy hh:mm:ss'); --Schönstes deutsches Datum

------------------------------------------------------------

SELECT HireDate, FORMAT(HireDate, 'D') FROM Employees;