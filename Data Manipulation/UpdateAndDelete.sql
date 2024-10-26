-- Update

UPDATE PM.Projects
SET StartDate = '2022-07-10'
WHERE PRJNO = 407; -- Important to have condtion (update all row "startDate" if you forget the condition)
GO

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

-- Delete

DELETE FROM PM.Projects
WHERE PRJNO = 407; -- Important to have condtion (Delete all row if you forget the condition)
GO

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

-- Delete A Table

DROP TABLE PM.Projects;
GO

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

-- Delete Record in Table
TRUNCATE TABLE PM.Projects;
GO

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------