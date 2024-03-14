/* 
SQL LAB #1
Daniel Rios
*/
--1 
--Select all Data from SKU Table
USE el23wq_CapeCodd
SELECT *
FROM SKU_DATA;

--2
--Select the City and State for each Warehouse 
SELECT WarehouseCity, WarehouseState
FROM WAREHOUSE;

--3
--Select the SKU, Department, and Buyer from SKU_Datatable
SELECT SKU, Department, Buyer
FROM SKU_DATA;

--4 
--Return Unique SKU Descriptions from Inventory
SELECT DISTINCT(SKU_DESCRIPTION)
FROM INVENTORY;

--5
--Return unique Departments and SKU Desriptions from the 2013 Catalog
SELECT DISTINCT Department, SKU_Description
FROM CATALOG_SKU_2013;

--6
--Select top 10 rows of Quantity On Hand and SKU from the Inventory table
SELECT TOP 10 
	QuantityOnHand, SKU 
FROM INVENTORY;

--7
-- Select all data from the 2014 Catalog and order by Catalog Page 
SELECT *
FROM CATALOG_SKU_2014
ORDER BY CatalogPage;

--8 
--Select Price and SKU from Order Item table and order by Price in Ascending order 
SELECT Price, SKU
FROM ORDER_ITEM
ORDER BY Price ASC;

--9
--Select the Warehouse City, Manager, and Square Feet from the Warehouse table and order by Square Feet in Descending order 
SELECT WarehouseCity, Manager, SquareFeet
FROM WAREHOUSE
ORDER BY SquareFeet DESC;

--10
--Select the Quantity On Hand, Quantity On Order, and SKU from the Inventory table and order by Quantity On Hand in Ascending order then Quantity On Order in Descending order 
SELECT QuantityOnHand, QuantityOnOrder, SKU
FROM INVENTORY
ORDER BY QuantityOnHand ASC, QuantityOnOrder DESC;
