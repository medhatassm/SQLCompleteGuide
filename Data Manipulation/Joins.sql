-- Table Join

SELECT * FROM PM.Projects; -- Get PRJNO and Title From this table
SELECT * FROM PM.Managers; -- Get Email From this table for each ManagerID in projects table
GO

-- solution

SELECT PRJNO , Title , Email FROM PM.Projects , PM.Managers; -- Cartisian Product
GO

-- Solution One For Cartisian Product Problem
SELECT PRJNO , Title , Email, Id , ManagerID FROM PM.Projects , PM.Managers WHERE PM.Projects.ManagerID = PM.Managers.Id;
GO

-- Using Inner Join
SELECT PRJNO , Title , Email
FROM PM.Projects AS P
INNER JOIN PM.Managers AS M
ON P.ManagerID = M.Id;
GO

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------

-- Left & Right Join

SELECT PRJNO , Title , CompanyName
FROM PM.Projects AS P
LEFT JOIN PM.Company AS C
ON P.CRNNO = C.CRNNO;
GO

SELECT PRJNO , Title , CompanyName
FROM PM.Projects AS P
RIGHT JOIN PM.Company AS C
ON P.CRNNO = C.CRNNO;
GO

SELECT PRJNO , Title , CompanyName
FROM PM.Projects AS P
FULL JOIN PM.Company AS C
ON P.CRNNO = C.CRNNO;
GO

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------