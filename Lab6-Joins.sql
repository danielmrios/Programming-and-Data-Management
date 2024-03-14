/*
SQL Lab #6
Daniel Rios
*/

USE el23wq_CapeCodd

--1
--Return all data from Inventory and Order Items next to eachother.
--Find the data from our Order Items that correspond with Inventory data.
SELECT *
FROM INVENTORY AS I, ORDER_ITEM AS OI
WHERE I.SKU = OI.SKU;

--2
--Return the store number and the quantity on order associated with it.
--What store is generating the most orders?
SELECT StoreNumber, SUM(QuantityOnOrder) AS 'Order Quantity'
FROM Retail_Order AS RO
LEFT OUTER JOIN ORDER_ITEM AS OI
	ON RO.OrderNumber = OI.OrderNumber
LEFT OUTER JOIN INVENTORY AS I
	ON OI.SKU = I.SKU
GROUP BY StoreNumber;

--3
--Return the QuantityOnHand multiplied by the Price for each disntinct SKU and ORDER BY WarehouseID.
--What is the value of our quantity on hand and what warehouse does it reside in?
SELECT DISTINCT(I.SKU), WarehouseID, QuantityOnOrder, Price, QuantityOnOrder*Price AS 'Total Cost'
FROM INVENTORY AS I
LEFT OUTER JOIN ORDER_ITEM AS OI
	ON OI.SKU = I.SKU
ORDER BY WarehouseID;

--4
--Same as #1 with explicit join.
SELECT *
FROM INVENTORY AS I
	JOIN ORDER_ITEM AS OI
		ON I.SKU = OI.SKU;

--5
--Return Warehouse ID, Date On Website, Price of each item, and Quantity On Hand Group by the same order. 
--We want to see our 2014 Product data and prices. 
SELECT WarehouseID, DateOnWebsite, Price, QuantityOnHand
FROM INVENTORY AS I
	JOIN CATALOG_SKU_2014 AS C
		ON I.SKU = C.SKU
	JOIN ORDER_ITEM AS OI
		ON I.SKU = OI.SKU
GROUP BY WarehouseID, DateOnWebsite, Price, QuantityOnHand;

--6
--Return the Warehouse IDs, WarehouseCiity, and SKU Descriptions for products in Inventory.
--We want to know which products are stored in each Warehouse.
--There is a NULL value for the Warehouse in San Francisco becuase there are no products in the inventory listed as being stored there.
/*The results differ in Right, Left, and Inner join because what's returned is changing dependant on which records are selected
as table A and table B. With Table A selected on a left join it will only return values from B that meet the condition and vice 
versa for a right join. In the case of an inner join both tables meet the condition */
SELECT W.WarehouseID, WarehouseCity, SKU_Description
FROM WAREHOUSE as W
	INNER JOIN INVENTORY AS I
		ON I.WarehouseID = W.WarehouseID;
