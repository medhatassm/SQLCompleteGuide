USE NorthWindDB
GO

-- Example 1
-- [OrderID] - [ProductId] - [UnitPrice] - [Quantity] - [Discount] - [SubTotal] where OrderID = 10248

SELECT OD.OrderID , OD.ProductID , OD.UnitPrice , OD.Quantity , OD.Discount,
CONVERT(money, (1- OD.Discount) * (OD.UnitPrice * OD.Quantity) , 2) AS [Sub Total]
FROM [Order Details] AS OD WHERE OD.OrderID = 10248
GO

-- Example 2
-- [OrderID] - [CustomerID] - [OrderDate] - [Total] Where OrderID = 10250

SELECT O.OrderID, O.CustomerID , O.OrderDate , CONVERT(money, SUM((1- OD.Discount) * (OD.UnitPrice * OD.Quantity)) , 2) AS Total 
FROM Orders O
INNER JOIN [Order Details] OD
ON O.OrderID = OD.OrderID
WHERE O.OrderID = 10250
GROUP BY O.OrderID, O.CustomerID , O.OrderDate;
GO

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

-- To Solve DRY Probelm in above examples use function

-- FUNCTIONS

-- Scaler Function (Return Single Value)

CREATE OR ALTER FUNCTION dbo.CalculateSubTotal(@quantity int , @unitPrice money , @discount real)
RETURNS money WITH SCHEMABINDING -- Boost Your Performance By this (WITH SCHEMABINDING)
 AS BEGIN
 DECLARE @subTotal money
 SELECT @subTotal = CONVERT(money, (1- @discount) * (@unitPrice * @quantity) , 2)
 RETURN @subTotal
 END;
 GO

-- [OrderID] - [ProductId] - [UnitPrice] - [Quantity] - [Discount] - [SubTotal] where OrderID = 10248

SELECT OD.OrderID , OD.ProductID , OD.UnitPrice , OD.Quantity , OD.Discount,
dbo.CalculateSubTotal(OD.Quantity , OD.UnitPrice , OD.Discount) AS SubTotal
FROM [Order Details] AS OD WHERE OD.OrderID = 10248
GO

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

-- Table Valued Function (Return Table)
CREATE OR ALTER FUNCTION GetOrderDetails(@orderId int)
RETURNS TABLE
AS RETURN (
    SELECT OD.OrderID , OD.ProductID , OD.UnitPrice , OD.Quantity , OD.Discount,
    dbo.CalculateSubTotal(OD.Quantity , OD.UnitPrice , OD.Discount) AS SubTotal
    FROM [Order Details] AS OD WHERE OD.OrderID = @orderId
);
GO

 -- Scaler Function to Use in Table Valued Function
CREATE OR ALTER FUNCTION dbo.CalculateOrderTotal(@OrderId int)
RETURNS money
 AS BEGIN
 DECLARE @total money;
 SELECT @total = SUM(SUBTOTAL) FROM dbo.GetOrderDetails(@OrderId)
 RETURN @total
 END;
 GO
SELECT * FROM GetOrderDetails(10248);
GO

-- Final Function That use all privous function
CREATE OR ALTER FUNCTION GetCustomersOrder(@customerID nvarchar(50))
RETURNS TABLE 
AS Return(
    SELECT O.OrderID, O.CustomerID, O.OrderDate ,
    dbo.CalculateOrderTotal(O.OrderID) AS Total FROM Orders O WHERE O.CustomerID = @customerID
);
GO


SELECT * FROM GetCustomersOrder('ALFKI')
GO
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

-- System Function (Built-in function)

-- Numeric Function
SELECT ABS(-100);
GO

-- Date Function
SELECT GETDATE()
SELECT ISDATE('2000-10-20')
GO

-- String Function
SELECT LEN('Some Text');
SELECT UPPER('Some Text');
GO

-- Conversion Function
SELECT CONVERT(money , 100.29 , 2);
GO

-- and more....

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------