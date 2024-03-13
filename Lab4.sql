/*
SQL Lab #4
Daniel Rios
*/

USE el23wq_CapeCodd

--1
--Return months that retail orders were made but only the first 3 letters of each month.
--Find the months where orders are most frequently made.
SELECT LEFT(OrderMonth, 3) Month
FROM RETAIL_ORDER;

--2
--Return Warehouse cities with a size greater than 130,000 square feet.
--What Warehouses have the capacity to hold a large amount of inventory?
SELECT UPPER(WarehouseCity) AS CapitalCity
FROM WAREHOUSE
WHERE SquareFeet > 130000;

--3
--Return the number of rows in the 2013 catalog that have page #s.
--Find the number of rows that have a page # associated with it so we can reference to the amount that are null. 
SELECT COUNT(CatalogPage)
FROM Catalog_SKU_2013
WHERE CatalogPage IS NOT NULL;

--4 
--Return the total extended prices from our orders .
--Determine the total value of our orders.
SELECT SUM(ExtendedPrice)
FROM ORDER_ITEM;

--5 
--Return the Average of the extended prices from our orders when the price is over 100.
--Find the average total value of higher priced orders.
SELECT AVG(ExtendedPrice)
FROM ORDER_ITEM
WHERE Price > 100;

--6
--Return the max and min price from our orders.
--What is the variation in our order prices?
SELECT MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice
FROM ORDER_ITEM;

--7
--Return Warehouse IDs and their respective Cities and States.
--Get a concise table of information of each of our warehouses. 
SELECT WarehouseID, (CONCAT(RTRIM(WarehouseCity), ', ', WarehouseState))
FROM WAREHOUSE;

--8
--Return a string with QuantityOnHand, SKU Description, and Warehouse ID.
--Get a readable statement of our quantity on hand for each SKU Description and what Warehouse it's in for superiors. 
SELECT CONCAT('We have ', QuantityOnHand, ' of the ', RTRIM(SKU_Description), ' in Warehouse ', WarehouseID)
FROM INVENTORY;

--9 
--Return the current year.
--Apply the current date to an order.
SELECT DATEPART(year, GETDATE()) AS CurrentYear;

--10
--Return the date in a month from now.
--Determine the length of a contract.
SELECT DATEADD(month, 1, GetDate());