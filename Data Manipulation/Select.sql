USE ProjectManagmentDB;
GO

-- Select

SELECT PRJNO, Title,ManagerID, StartDate, InitialCost, Parked, CRNNO
FROM PM.Projects;
GO

SELECT PRJNO, Title
FROM PM.Projects;
GO

-- OR --

SELECT * FROM PM.Projects;
GO

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

-- Where
SELECT * FROM PM.Projects WHERE InitialCost >= 1000000
GO

SELECT * FROM PM.Projects WHERE NOT InitialCost >= 1000000
GO

SELECT * FROM PM.Projects WHERE InitialCost >= 1000000 AND StartDate >= '2022-03-01';
GO

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

-- Like

SELECT * FROM PM.Projects WHERE Title LIKE 'C%' -- Start With C
GO

SELECT * FROM PM.Projects WHERE Title LIKE '%P' -- End With P
GO

SELECT * FROM PM.Projects WHERE Title LIKE '%DESK%' -- Contains DESK
GO

SELECT * FROM PM.Projects WHERE Title LIKE '_R%' -- Second letter is R
GO

SELECT * FROM PM.Projects WHERE Title LIKE '_R_' -- just three letter and second letter is R
GO

SELECT * FROM PM.Projects WHERE InitialCost LIKE '_5%'
GO

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

-- Top

SELECT TOP 5 * FROM PM.Projects;
GO

-- OR --

SELECT TOP 2 PERCENT * FROM PM.Projects;
GO

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

-- OrderBy

SELECT * FROM PM.Projects ORDER BY StartDate; -- ASC By Defualt
Go

SELECT * FROM PM.Projects ORDER BY StartDate DESC;
GO

SELECT * FROM PM.Projects ORDER BY InitialCost, StartDate ASC;
GO


------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

-- Group By

SELECT Title FROM PM.Projects GROUP BY Title;
GO

-- Aggregate Function

SELECT Title , COUNT(*) FROM PM.Projects GROUP BY Title; -- Return the number of rows using this title.
GO

SELECT ManagerID , COUNT(*) FROM PM.Projects WHERE Parked = 0 GROUP BY ManagerID HAVING COUNT(*) >= 2;

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

-- Distinct

SELECT DISTINCT * FROM PM.Projects -- Withour repeated rows