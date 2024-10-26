-- Sup Query

-- Update InitialCost * 1.05 in project that use oracle skills.

UPDATE PM.Projects SET InitialCost = InitialCost * 1.05
WHERE PRJNO IN (SELECT PRJNO FROM PM.ProjectTechnology
 WHERE TechnologyId = (
    SELECT Id FROM PM.Technology
        WHERE Name = 'ORACLE'
 ));
 GO

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------