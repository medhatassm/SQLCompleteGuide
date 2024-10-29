## Procedure, Functions And Views

### Functions

- **Scaler Function**
    
    Used when you want to return single value
    
    ```sql
    -- Create Scaler Function (Return Single Value)
    
    CREATE OR ALTER FUNCTION dbo.CalculateSubTotal(@quantity int , @unitPrice money , @discount real)
    RETURNS money WITH SCHEMABINDING -- Boost Your Performance By this (WITH SCHEMABINDING)
     AS BEGIN
     DECLARE @subTotal money
     SELECT @subTotal = CONVERT(money, (1- @discount) * (@unitPrice * @quantity) , 2)
     RETURN @subTotal
     END;
    
    -- [OrderID] - [ProductId] - [UnitPrice] - [Quantity] - [Discount] - [SubTotal] where OrderID = 10248
    
    SELECT OD.OrderID , OD.ProductID , OD.UnitPrice , OD.Quantity , OD.Discount,
    dbo.CalculateSubTotal(OD.Quantity , OD.UnitPrice , OD.Discount) AS SubTotal
    FROM [Order Details] AS OD WHERE OD.OrderID = 10248
    ```
    
    ---
    
- **Table Valued Function**
    
    Used when you want to return table from a query
    
    ```sql
    -- Create Table Valued Function (Return Table)
    CREATE OR ALTER FUNCTION GetOrderDetails(@orderId int)
    RETURNS TABLE
    AS RETURN (
        SELECT OD.OrderID , OD.ProductID , OD.UnitPrice , OD.Quantity , OD.Discount,
        dbo.CalculateSubTotal(OD.Quantity , OD.UnitPrice , OD.Discount) AS SubTotal
        FROM [Order Details] AS OD WHERE OD.OrderID = @orderId
    );
    ```
    
    ```sql
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
    
    -- Final Function That use all privous function
    CREATE OR ALTER FUNCTION GetCustomersOrder(@customerID nvarchar(50))
    RETURNS TABLE 
    AS Return(
        SELECT O.OrderID, O.CustomerID, O.OrderDate ,
        dbo.CalculateOrderTotal(O.OrderID) AS Total FROM Orders O WHERE O.CustomerID = @customerID
    );
    ```
    
    ```sql
    SELECT * FROM GetCustomersOrder('ALFKI')
    ```
    
    ---
    
- **System Function**
    
    Built-in Function in your database, can be used to achieve your goal without creating a function from scratch
    
    ```sql
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
    ```
    
    ---
    

### Procedure

- **Procedure V.S Function**
    
    
    | Functions | Procedure |
    | --- | --- |
    | A SQL function is a pre-written, reusable code block to perform a specific task. It is created and stored in the database and can be called from an SQL statement or another function. | A SQL procedure is a pre-written, reusable code block designed to perform a specific task or set of tasks. It is created and stored in the database and can be called from an SQL statement or another procedure. |
    | Must Return Single Or Table | Return O Single Or Multiply |
    | Transaction Not Allowed | Transaction Allowed |
    | Input Parameter Only | Input / Output Parameter |
    | Function Can’t Call Procedure | Procedure Can Call Function |
    | Can Be Used in Select / Where / Having | Can’t Be Used in Select / Where / Having |
- **Procedure ExampleAlways returns a single value**
    
    ```sql
    CREATE OR ALTER PROCEDURE dbo.SalesByCategoryAndYear (@categoryName nvarchar(15) , @year int)
    AS BEGIN
        SELECT P.ProductName,
        ROUND(SUM(OD.Quantity * (1 - OD.Discount) * OD.UnitPrice),0)AS TotalPurches
        FROM [Order Details]OD
        INNER JOIN Orders O ON O.OrderID = OD.OrderID
        INNER JOIN Products P ON P.ProductID = OD.ProductID
        INNER JOIN Categories C ON C.CategoryID = P.CategoryID
        GROUP BY ProductName
        ORDER BY ProductName
    END;
    GO
    
    EXEC dbo.SalesByCategoryAndYear 'Beverages' , 1996;
    GO
    ```
    
    ---
    

### Views

- **Definition**
    
    In SQL, a view is a virtual table based on the result-set of an SQL statement.
    
    A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.
    
    You can add SQL statements and functions to a view and present the data as if the data were coming from one single table.
    
    ---
    
- **Example**
    
    ```sql
    -- Create View
    CREATE OR ALTER VIEW dbo.ProductWithOrderDetails
    AS 
    SELECT P.ProductID,P.CategoryID,P.ProductName,OD.Quantity
    FROM dbo.Products P INNER JOIN dbo.[Order Details] OD
    ON P.ProductID = OD.ProductID
    WHERE P.ProductID = 1 -- Question One
    GO
    
    SELECT * FROM dbo.ProductWithOrderDetails;
    GO
    ```