USE NorthWindDB;
GO

-- PROCEDURE
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

EXECUTE dbo.SalesByCategoryAndYear 'Beverages' , 1996;
GO