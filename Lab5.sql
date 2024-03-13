/*
SQL Lab #5
Daniel Rios
*/

USE el23wq_CapeCodd

--1
--Return the total quantity ordered for 'Dive Mask, Small Clear'
--Complete a record of inventory
SELECT SUM(Quantity) AS 'AmtItems'
FROM ORDER_ITEM
WHERE SKU IN (
	SELECT SKU
	FROM INVENTORY
	WHERE SKU_Description = 'Dive Mask, Small Clear');

--2
--Return the Warehouse IDs associated with items listed between page 24 and 70 on the 2014 catalog page with no duplicate values
--This could be to find where specific products are stored if theres defects or quality control. 
SELECT DISTINCT(WarehouseID) AS MidBookWarehouseIDs
FROM INVENTORY
WHERE SKU IN (
	SELECT SKU
	FROM CATALOG_SKU_2014
	WHERE CatalogPage > 24 AND CatalogPage < 70);

--3 
--Return the Name of the Manager, City, and State that a Warehouse is in for Camping Department Items
--We need to know what Warehouse and Manager the Camping products came from because of issues with packaging
SELECT Manager, WarehouseCity, WarehouseState
FROM WAREHOUSE
WHERE WarehouseID IN (
	SELECT WarehouseID
	FROM INVENTORY
	WHERE SKU_Description IN (
		SELECT SKU_Description
		FROM SKU_DATA
		WHERE Department = 'Camping'));

--4
--Return the Buyer Name, SKU, and SUM of quantity on order for the combination of the buyer and SKU.
--We want to keep track of how much a product each Buyer purchased to fulfill orders.
SELECT Buyer, SKU, 
	(SELECT SUM(QuantityOnOrder)
	FROM INVENTORY
	WHERE SKU_DATA.SKU = INVENTORY.SKU)
FROM SKU_DATA
ORDER BY Buyer;