/*
Project 1: Excelsior Mobile Report
Daniel Rios
*/

USE el23wq_Excelsior

--1
--A
SELECT TOP 2(City) AS 'Most Customers'
FROM Subscriber
GROUP BY City
ORDER BY COUNT(*) Desc;

--B
SELECT TOP 3(City) AS 'Least Customers'
FROM Subscriber
GROUP BY City
ORDER BY COUNT(FirstName) ASC;

--C
SELECT TOP 1(PlanName) AS 'Plan with Least Customers'
FROM Subscriber
GROUP BY PlanName
ORDER BY COUNT(PlanName) ASC;

--2
--A
SELECT Top 1(Count(Type)) AS Customers, Type AS 'Phone Type'
FROM Device 
GROUP BY Type
ORDER BY Count(Type) DESC;

--B
SELECT CONCAT(FirstName, ' ', LastName) AS LeastUsedPhoneType
FROM Subscriber AS S
	LEFT OUTER JOIN DirNums AS DN
	ON DN.MDN = S.MDN
	LEFT OUTER JOIN Device AS D
	ON D.IMEI = DN.IMEI
WHERE Type = 'Apple';

--C
SELECT CONCAT(FirstName, ' ', Lastname) AS 'Customers', YearReleased
FROM Subscriber AS S
	LEFT OUTER JOIN DirNums AS DN
	ON DN.MDN = S.MDN
	LEFT OUTER JOIN Device AS D
	ON D.IMEI = DN.IMEI
WHERE YearReleased < 2018;

--3
--A
SELECT TOP 3(City) AS 'Cities with Most Data'
FROM LastMonthUsage AS L
	JOIN Subscriber AS S
	ON L.MIN = S.MIN
GROUP BY City
ORDER BY SUM(DataInMB) DESC;

--B
SELECT City AS 'Cities with no Unlimited Plans'
FROM Subscriber
WHERE City NOT IN (
	SELECT City
	FROM Subscriber 
	WHERE PlanName LIKE 'Unl%'
	GROUP BY City
	HAVING COUNT(PlanName) > 0)
GROUP BY City;

--4
--A
SELECT TOP 1(CONCAT(FirstName, ' ', LastName)) AS 'Highest Customer Bill'
FROM Bill AS B
	JOIN Subscriber AS S
	ON S.MIN = B.MIN
ORDER BY Total DESC;

--B
SELECT TOP 1(PlanName) AS 'Highest PlanName Bill'
FROM Bill AS B
	JOIN Subscriber AS S
	ON S.MIN = B.MIN
GROUP BY PlanName
ORDER BY SUM(Total) DESC;

--5 
--A
SELECT Top 1(SUM(Minutes)) AS MostMinutes, ZipCode
FROM LastMonthUsage AS L
	JOIN Subscriber AS S
	ON S.MIN = L.MIN
GROUP BY ZipCode
ORDER BY SUM(Minutes) DESC;

--B
SELECT City AS 'Biggest Minutes Diffrence'
FROM LastMonthUsage AS L
	JOIN Subscriber AS S
	ON S.MIN = L.MIN 
WHERE Minutes NOT BETWEEN 200 AND 700
GROUP BY City
HAVING MAX(Minutes)-MIN(Minutes) > 0
ORDER BY City DESC;
