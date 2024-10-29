DBCC FREEPROCCACHE; -- Remove all element from the plan cach ,
 -- flush plan cache for the entire instance

-- Get Excution time down to milliseconds
SET STATISTICS TIME , IO ON
-- SET STATISTICS TIME , IO OFF

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

USE NorthWindDB
GO

-- Without Index

-- Query 1
SELECT  COUNT(*) FROM Customers;
-- Query 2
SELECT COUNT(*) FROM Customers WHERE CompanyName = 'Blondesddsl père et fils'

-- With Index

CREATE INDEX CompanyNameIndex
 ON Customers(CompanyName);
GO 

DROP INDEX CompanyNameIndex ON Customers;
Go

SELECT COUNT(*) FROM Customers WHERE CompanyName = 'Blondesddsl père et fils' -- 0 ms

