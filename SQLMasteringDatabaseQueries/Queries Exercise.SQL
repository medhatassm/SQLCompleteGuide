USE NorthWindDB
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q1 -> Create a report the show CategoryName and Description from the categories table
--       stored by CategoryName

SELECT C.CategoryName , C.Description FROM dbo.Categories AS C ORDER BY C.CategoryName
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q2 -> Create a report that show the ContactName , CompanyName , ContactTitle
--       and PhoneNumber from the Customer table sorted by ContactTitle DESC.

SELECT C.ContactName , C.CompanyName , C.ContactTitle
 FROM Customers AS C ORDER BY C.ContactTitle DESC
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q3 -> Create a report show the Capitalized FirstName and Capitalized LastName 
--       renamed as FirstName and LastName, Respectively and HireDate from the Employee
--       table sorted from newest to the oldest employee.

SELECT UPPER(E.FirstName) AS FirstName , UPPER(E.LastName) AS LastName , E.HireDate 
 FROM Employees AS E
 ORDER BY E.HireDate DESC
 GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q4 -> Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID
--       Freight from the Orders Table sorted by Freight in descnding order

SELECT TOP 10 O.OrderID, O.OrderDate, O.ShippedDate, O.CustomerID, O.Freight
FROM Orders AS O
ORDER BY O.Freight DESC
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q5 -> Create a report that shows all the CustomerID in lowercase
--       letter and renamed as ID from the customers table.

SELECT LOWER(C.CustomerID) AS ID
 FROM Customers AS C
 GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q6 -> Create a report that shows the CompanyName, Fax, Phone, Country, HomePage
--       from the suppliers table sorted by the Country in descending order then by
--       CompanyName in ascending order.

SELECT S.CompanyName, S.Fax, S.Phone, S.Country, S.HomePage
 FROM Suppliers AS S
 ORDER BY S.Country DESC , S.CompanyName ASC
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q7 -> Create a report that shows CompanyName,
-- ContactName of all customers from ‘Buenos Aires' only.

SELECT C.CompanyName, C.ContactName
 FROM Customers AS C WHERE C.City = 'Buenos Aires'
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q8 -> Create a report showing ProductName, UnitPrice, QuantityPerUnit of
--       products that are out of stock.

SELECT P.ProductName,P.UnitPrice,P.QuantityPerUnit FROM Products AS P
WHERE P.UnitsInStock = 0
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q9 -> Create a report showing all the ContactName, Address,
--       City of all customers not from Germany, Mexico, Spain.

SELECT C.ContactName, C.Address, C.City
 FROM Customers AS C
WHERE C.Country Not IN('Germany' , 'Mexico' , 'Spain')
GO
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q10 -> Create a report showing OrderDate, ShippedDate, CustomerID, Freight of
--        all orders placed on 04 Feb 1997.

SELECT OrderDate , ShippedDate, CustomerID, Freight
FROM Orders WHERE OrderDate = '1997-02-04'
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q11 -> Create a report showing FirstName, LastName, Country 
--        from the employees not from United States.

SELECT FirstName,LastName,Country
FROM Employees Where Country <> 'USA'
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q12 -> Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate,
--        ShippedDate from all orders shipped date grater than the required date.

SELECT EmployeeID,OrderID,CustomerID,RequiredDate,ShippedDate
FROM Orders  WHERE ShippedDate > RequiredDate;
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q13 -> Create a report that shows the City, CompanyName,
--        ContactName of Customers from cities starting with A or B

SELECT City, CompanyName, ContactName
FROM Customers WHERE City LIKE '[A B]%'
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q14 -> Create a report showing all the even numbers of OrderID from the Orders table

SELECT OrderID FROM Orders WHERE ORDERID % 2 = 0
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q15 -> Create a report that shows all the Orders where the Freight cost more than $500

SELECT * FROM Orders WHERE Freight > 500
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q16 -> Create a report that shows ProductName, UnitsInStock, UnitsOnOrder,
--        ReorderLevel when inventory items on hand quantity are below the reorder level.

SELECT Productname, UnitsInStock, UnitsOnOrder, ReorderLevel
FROM Products
WHERE UnitsInStock < ReorderLevel
GO 

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q17 -> Create a report that shows the CompanyName, ContactName, FaxNumber
--        of all Customer that have no fax number

SELECT CompanyName, ContactName, Fax
FROM Customers WHERE Fax IS NULL
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q18 -> Create a report that shows the FirstName, LastName
--        of all Employees that do not report to anybody

SELECT FirstName, LastName FROM Employees WHERE ReportsTo IS NULL
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q19 -> Create a report showing Products that we don't sell any more

SELECT * FROM Products WHERE Discontinued = 1
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q20 -> Create a report that shows the CompanyName, ContactName,
--        Fax of all Customers that do not have Fax number AND Live in USA and
--        sorted by ContactName.

SELECT CompanyName, ContactName, Fax
FROM Customers
 WHERE Fax IS NULL AND Country = 'USA'
 ORDER BY ContactName
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q21 -> Create a report that shows the City, CompanyName, ContactName
--        of Customers from cities that has letter L in the name sorted by ContactName.

SELECT City, CompanyName, ContactName
FROM Customers WHERE City LIKE '%L%'
ORDER BY ContactName
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q22 -> Create a report that shows the FirstName, LastName, BirthDate 
--        of Employees born in the 1950s.

SELECT FirstName,LastName,BirthDate
FROM Employees WHERE BirthDate BETWEEN '1950-01-01' AND '1959-12-31'
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q23 -> Create a report that shows the FirstName, LastName,
--        the year of Birthdate as birth year from the Employees table.

SELECT FirstName, LastName, YEAR(BirthDate) AS [Birth Year]
FROM Employees
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q24 -> Create a report showing OrderID, total number of items in the order
--        as NumberOfItems from the OrderDetails table grouped by OrderID and
--        sorted by NumberOfOrders in descending order.

SELECT OrderId, COUNT(OrderID) AS NumberOfItems
FROM [Order Details] GROUP BY OrderID
ORDEr BY NumberOfItems DESC
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q25 -> Create a report that shows the SupplierID, ProductName, CompanyName
--        from all Product Supplied by Exotic Liquids, Specialty Biscuits, Ltd.
--        , Escargots Nouveaux sorted by the supplier ID.

SELECT P.SupplierId, P.ProductName, S.CompanyName
FROM Products AS P JOIN Suppliers AS S
ON S.SupplierID = P.SupplierID
WHERE S.CompanyName IN ('Exotic Liquids','Specialty Biscuits, Ltd.','Escargots Nouveaux')
ORDER BY S.SupplierID
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q26 -> Create a report that shows the ShipPostalCode, OrderID, OrderDate,
--        RequiredDate, ShippedDate, ShipAddress of all Orders with ShipPostalCode 
--        ends with "00”

SELECT * -- ShipPostalCode,OrderID,OrderDate,RequiredDate,ShippedDate,ShipAddress
FROM Orders WHERE ShipPostalCode LIKE '%00'
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q27 -> Create a report that shows the ContactName, ContactTitle, CompanyName
--        of Customers that the has no "Sales" in their ContactTitle.

SELECT ContactName,ContactTitle, CompanyName FROM Customers
WHERE ContactTitle NOT LIKE '%Sales%'
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q28 -> Create a report that shows the LastName, FirstName, 
--        City of Employees in cities other "Seattle"

SELECT LastName,FirstName,City FROM Employees WHERE CITY NOT IN ('Seattle');
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q29 -> Create a report that shows the CompanyName, ContactTitle, City, Country
--        of all Customers in any city in Mexico or other cities in Spain other than Madrid.

SELECT CompanyName, ContactTitle, City, Country
FROM Customers
WHERE Country IN ('Mexico', 'Spain')
AND City != 'Madrid';
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q30 -> Create a select statement that outputs the following: photo 30

SELECT CONCAT(FirstName,'',LastName,'can be reached at','x',Extension) AS Contactinfo
 FROM Employees
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q31 -> Create a report that shows the ContactName of all customers that do not have
--        letter A as the second alphabet in their ContactName.

SELECT ContactName FROM Customers WHERE ContactName NOT LIKE '_a%'
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q32 -> Create a report that shows the average UnitPrice rounded to the next whole number,
--        total of UnitsInStock and maximum number of pending Orders from the Products table.
--        All saved as AveragePrice, TotalStock and MaxPendingOrders respectively.

SELECT ROUND (AVG(UnitPrice),0) AS AveragePrice,
SUM(UnitsInStock) AS TotalStock,
MAX(UnitsOnOrder) as MaxPendingOrder
FROM Products;
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q33 -> Create a report that shows the SupplierID, CompanyName,
--        CategoryName, ProductName and UnitPrice

SELECT S.SupplierID,S.CompanyName,C.CategoryName,P.ProductName,P.UnitPrice
FROM Suppliers AS S JOIN Products AS P
ON S.SupplierID = P.ProductID
JOIN Categories AS C
ON C.CategoryID = P.CategoryID
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q34 -> Create a report that shows the sum of Freight for each CustomerID,
--        when sum of Freight greater $200.

SELECT CustomerID, SUM(Freight) AS TotalFreight
 FROM Orders GROUP BY CustomerID
HAVING SUM(Freight) > 200
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q35 -> Create a report that shows the OrderID, ContactName, UnitPrice,
--        Quantity with discount given on every purchase.

SELECT od.OrderID, c.ContactName,od.UnitPrice,od.Quantity,od.Discount
 FROM [Order Details] od
  JOIN Orders o 
  ON od.OrderID = o.OrderID
  JOIN Customers c 
  ON c.CustomerID = o.CustomerID
   WHERE od.Discount <> 0;
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q36 -> Create a report that shows the EmployeeID,
--        the LastName and FirstName as employee,
--        and the LastName and FirstName of who they report to as manager sorted by Employee ID

SELECT a.EmployeeID,
CONCAT (a.LastName, ' ' ,a.FirstName ) AS Employee,
CONCAT (b.LastName,' ', b.FirstName ) AS Manager
FROM Employees a
LEFT JOIN Employees b
ON b.EmployeeID = a.ReportsTo
ORDER BY a.EmployeeID;
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q37 -> Create a report that shows ProductId, 
--        ProductName, Active if discontinued is 0 otherwise InActive and name
--        the column Status.

SELECT ProductId, ProductName,
CASE
	WHEN Discontinued = 0 THEN 'ACTIVE'
	ELSE 'INACTIVE'
END
AS Status
FROM
Products;
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q38 ->  Create a view named CustomerInfo that shows the CustomerID,
--         CompanyName, ContactName, ContactTitle, Address, City, Country, Phone,
--         OrderDate, RequiredDate, ShippedDate.

CREATE VIEW CustomerInfo AS
SELECT C.CustomerID, C.CompanyName, C.ContactName, C.ContactTitle, C.Address,
C.City,C.Country, C.Phone, O.OrderDate, O.RequiredDate, O.ShippedDate
FROM
Customers C
INNER JOIN
Orders O 
ON C.CustomerID = O.CustomerID;
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q39 -> Change the name of the view you created from customerInfo to customer details.

sp_rename @objname = 'dbo.CustomerInfo', @newname = 'CustomerDetails'
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q40 -> Create a view named ProductDetails that shows the ProductID,
--        CompanyName, ProductName, CategoryName, Description, QuantityPerUnit, 
--        UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued

CREATE VIEW ProductDetails AS
SELECT 
P.ProductID, S.CompanyName, P.ProductName, C.CategoryName, 
C.Description, P.QuantityPerUnit, P.UnitPrice, P.UnitsInStock, P.UnitsOnOrder, P.ReorderLevel,
P.Discontinued 
FROM
Products P INNER JOIN
Suppliers S ON S.SupplierId = P.SupplierId
INNER JOIN Categories C ON C.CategoryID = P.CategoryID
GO
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q41 -> Drop the customer info view.

DROP VIEW dbo.CustomerInfo;
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q42 -> Create a report that fetch the first 5 character of categoryName
--        from the category tables and renamed as ShortInfo.

SELECT SUBSTRING(Description, 1, 5) AS ShortInfo
FROM
Categories;
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q43 -> Create a copy of the shipper table as shippers_duplicate. 
--        Then insert a copy of shippers data into the new table 
--        HINT: reate a Table, use the LIKE Statement and INSERT INTO statement.

SELECT * INTO Shippers_Dup FROM Shippers; 

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q44 -> ADD a column to shippers_duplicate table called email of type varchar(150)
--        update each shipper email with random email to each shipper and Display
--        the data in the shippers_duplicate table.

-- ALTER TABLE Shippers_duplicate
--  ADD Email VARCHAR(150);


--  UPDATE Shippers_duplicate SET Email = 'speedyexpress@fake.com' where ShipperId = 1; 
--  UPDATE Shippers_duplicate SET Email = 'unitedpackage@fake.com' where ShipperId = 2;
--  UPDATE Shippers_duplicate SET Email = 'federalshipping@fake.com' where ShipperId = 3;

--  SELECT * FROM Shippers_duplicate;
-- GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q45 -> Create a report that shows the CompanyName and ProductName 
--        from all product in the Seafood category.

SELECT 
S.CompanyName, P.ProductName
FROM 
Products P INNER JOIN Categories C ON C.CategoryID = P.CategoryID
INNER JOIN Suppliers S ON S.SupplierID = P.SupplierID
WHERE C.CategoryName = 'Seafood';
GO



------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q46 -> Create a report that shows most expensive and least expensive
--        Product list (name and unit price)

SELECT 
ProductName, UnitPrice
FROM Products
WHERE UnitPrice = (SELECT MIN(UnitPrice) FROM Products) OR UnitPrice = (SELECT MAX(UnitPrice) FROM Products)
GROUP BY ProductName, UnitPrice;
GO


------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q47 -> Delete the shippers_duplicate table.

-- DROP TABLE Shippers_Duplicate;
--GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q48 -> Create a select statement that outputs the following from the employees table.
--        LastName, FirstName, Title, Age.

SELECT LastName, FirstName, Title,
 CONVERT(int, ROUND(DATEDIFF(hour,BirthDate,GETDATE())/8766.0,0)) AS Age 
 from Employees;
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q49 -> Create a report that the CompanyName and total number of orders by customer
--        renamed as number of orders since December 31, 1994. Show number of Orders
--        greater than 10.

SELECT C.CompanyName, count(C.CustomerID) AS NumberofOrders
FROM Customers C
INNER JOIN Orders o
ON O.CustomerID = C.CustomerID
WHERE O.OrderDate >= '1994-12-31'
GROUP BY C.CustomerID, C.CompanyName
having COUNT(C.CustomerID) > 10;
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- Q50 -> Create a select statement that outputs the following from the product table
--        {ProductName} / is {QuantityPerUnit} and cost ${UnitPrice}

SELECT CONCAT( ProductName,' weighs/is ' , QuantityPerUnit, ' and cost ','$', UnitPrice)
 AS ProductInfo FROM Products;
GO

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------