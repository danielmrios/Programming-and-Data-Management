/*
SQL Lab #3
Daniel Rios 
*/

USE el23wq_CapeCodd

--1
--return all uses of Scuba in SKU_Description 
SELECT *
FROM INVENTORY
WHERE SKU_Description LIKE '%SCUBA%';

--2 
--Return SKU numbers that start with 10
SELECT OrderNumber, SKU 
FROM ORDER_ITEM
WHERE SKU LIKE '10%';

--3
--return warehouse cities that end in o or e 
SELECT *
FROM WAREHOUSE 
WHERE WarehouseCity LIKE '%[oe]';

--4
--return SKU Descriptions from non Camping departments and Alias the result as Item
SELECT SKU_Description AS Item
FROM CATALOG_SKU_2015
WHERE Department NOT LIKE 'Camping';

--5 
--Return SKU, Quantity On Hand (Alias AS 'In Stock'), Quantity On Order (Alias AS 'Forthcoming') and filter for SKU's that include '12' using the LIKE clause
SELECT SKU, QuantityOnHand AS 'In Stock', QuantityOnOrder AS 'Forthcoming'
FROM INVENTORY
WHERE SKU LIKE '%12%';

--6
--return SKU descriptions grouped by sku_description name
SELECT SKU_Description
FROM INVENTORY
GROUP BY SKU_Description;

--7
--return the years and months from our retail orders and Alias them as'Year' and 'Month' 
SELECT OrderYear AS 'Year', OrderMonth AS 'Month'
FROM RETAIL_ORDER
GROUP BY OrderYear, OrderMonth;

--8 
--return the department, DateOnWebsite AS Pubdate and group by DateOnWebsite and Department
SELECT Department, DateOnWebSite AS Pubdate
FROM CATALOG_SKU_2014
GROUP BY DateOnWebSite, Department;

--9
--return OrderNumber and Number of SKU's in each order AS NumberOfSingleItems
SELECT OrderNumber, COUNT(SKU) AS NumberOfSingleItems
FROM ORDER_ITEM
GROUP BY OrderNumber 
HAVING COUNT(SKU) > 1;

--10
--return the order number, and SUM of Extended Price AS TotalCost for Order Items with more than 1 quantity and SKU count 
SELECT OrderNumber, SUM(ExtendedPrice) AS TotalCost
FROM ORDER_ITEM
WHERE Quantity > 1
GROUP BY OrderNumber
HAVING COUNT(SKU) > 1;