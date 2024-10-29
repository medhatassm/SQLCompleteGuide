USE NorthWindDB
GO

CREATE OR ALTER VIEW dbo.ProductWithOrderDetails
AS 
SELECT P.ProductID,P.CategoryID,P.ProductName,OD.Quantity
FROM dbo.Products P INNER JOIN dbo.[Order Details] OD
ON P.ProductID = OD.ProductID
WHERE P.ProductID = 1 -- Question One
GO

SELECT * FROM dbo.ProductWithOrderDetails;
GO