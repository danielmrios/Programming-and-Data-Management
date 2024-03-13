/*
Project 1: Excelsior Mobile Report
Daniel Rios
*/

USE el23wq_Excelsior

--1
--A
SELECT CONCAT(FirstName, ' ', LastName) AS Customers, Minutes AS 'Minute Usage', DataInMB, Texts, Total AS 'Bill Total'
FROM Subscriber S
	JOIN LastMonthUsage L
	ON S.MIN = L.MIN
	JOIN Bill B
	ON S.MIN = B.MIN
ORDER BY FirstName, LastName;

--B
SELECT City, AVG(Minutes) AS 'AVG Minutes', AVG(DataInMB) AS 'AVG Data', AVG(Texts) AS 'AVG Texts', AVG(Total) AS 'AVG Bill'
FROM LastMonthUsage L
	JOIN Subscriber S
	ON L.MIN = S.MIN 
	JOIN BILL B
	ON L.MIN = B.MIN 
GROUP BY City;

--C
SELECT City, SUM(Minutes) AS 'Minute Usage', SUM(DataInMB) AS Data, SUM(Texts) AS Texts, SUM(Total) AS 'Bill Total'
FROM LastMonthUsage L
	JOIN Subscriber S
	ON L.MIN = S.MIN 
	JOIN BILL B
	ON L.MIN = B.MIN 
GROUP BY City;

--D
SELECT PlanName, AVG(Minutes) AS 'AVG Minutes', AVG(DataInMB) AS 'AVG Data', AVG(Texts) AS 'AVG Texts', AVG(Total) AS 'AVG Bill'
FROM LastMonthUsage L
	JOIN Subscriber S
	ON L.MIN = S.MIN 
	JOIN BILL B
	ON L.MIN = B.MIN 
GROUP BY PlanName;

--E
SELECT PlanName, SUM(Minutes) AS 'Minute Usage', SUM(DataInMB) AS Data, SUM(Texts) AS Texts, SUM(Total) AS 'Bill Total'
FROM LastMonthUsage L
	JOIN Subscriber S
	ON L.MIN = S.MIN 
	JOIN BILL B
	ON L.MIN = B.MIN 
GROUP BY PlanName;
