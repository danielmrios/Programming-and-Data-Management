/*
SQL Lab #2
Daniel Rios
*/
USE el23wq_CapeCodd
--1
--Select the SKU Descriptions and filter using WHERE to only show results from the Water Sports department
SELECT SKU_Description
FROM CATALOG_SKU_2014
WHERE Department = 'Water Sports';

--2
--Show the SKU and SKU Description of products put on the 2015 catalog on April 1st 2015
SELECT SKU, SKU_Description
FROM CATALOG_SKU_2015
WHERE DateOnWebSite = '2015-04-01';

--3
--Cities where the Warehouse Square Fotage is greater than 150,000
SELECT WarehouseCity
FROM WAREHOUSE
WHERE SquareFeet > 150000;

--4
-- Information for Inventory where the Warehouse ID is 300 and the Quantity On Hand is greater than 300
SELECT *
FROM INVENTORY
WHERE WarehouseID = '300'
	AND QuantityOnHand > '300';

--5
--Find Data from 2013 Catalog with over 30 pages OR Null catalog pages
SELECT *
FROM CATALOG_SKU_2013 
WHERE CatalogPage > '30' 
	OR CatalogPage IS NULL
ORDER BY Department;

--6
--Return data where quantity of an order item is 1 and the price is not 300
SELECT *
FROM ORDER_ITEM
WHERE Quantity = '1'
	AND Price <> 300;

--7
--Return data from Inventory in which the Quantity On Hand is less than 200 and Order Quantity is 0
SELECT *
FROM INVENTORY
WHERE QuantityOnHand < 200 
	AND QuantityOnOrder = 0;

--8
--Use NOT IN clause to find information from Warehouse Cities not in Atlanta, Chicago, or Seattle 
SELECT *
FROM WAREHOUSE
WHERE WarehouseCity NOT IN ('Atlanta', 'Chicago', 'Seattle');

--9
--Use Between clause to find information from 2013 catalog pages between 20 and 45, ordered by catalog page 
SELECT *
FROM CATALOG_SKU_2013
WHERE CatalogPage BETWEEN 20 AND 45
ORDER BY CatalogPage;

--10 
--Filter for data in the 2014 catalog that does not have a catalog page associated with it using IS NULL 
SELECT SKU, SKU_Description
FROM CATALOG_SKU_2014
WHERE CatalogPage IS NULL;
