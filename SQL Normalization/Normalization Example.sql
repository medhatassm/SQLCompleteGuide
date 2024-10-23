CREATE DATABASE NormalizationExampleDB;
GO

USE NormalizationExampleDB;
GO

CREATE SCHEMA NE;
GO

CREATE TABLE NE.ClientData(
    PRJNO INT,
    Title VARCHAR(50),
    ProjectManger VARCHAR(20),
    Tecnology VARCHAR(20),
    StartDate DATETIME2,
    InitialCost DECIMAL,
    Parked BIT,
);
GO

INSERT INTO NE.ClientData(PRJNO,Title,ProjectManger,Tecnology,StartDate,InitialCost,Parked)
    VALUES (100 , 'CMS' , 'peter@fake.com' , 'SQL, ASP, React' , '2024-01-01 07:30:20' , 1500.00 , 0),
    (101 , 'ERP' , 'mike@fake.com' , 'ASP, React' , '2024-02-01 07:30:20' , 1500.00 , 0),
    (102 , 'CMS' , 'reem@fake.com' , 'ASP, Angler' , '2024-03-01 07:30:20' , 1500.00 , 0),
    (103 , 'CRM' , 'salah@fake.com' , 'Android' , '2024-04-01 07:30:20' , 500.00 , 0),
    (104 , 'CRM' , 'ziad@fake.com' , 'Oracle, WPF' , '2024-05-01 07:30:20' , 1500.00 , 0),
    (105 , 'ERP' , 'ali@fake.com' , 'Oracle, PHP' , '2024-09-01 07:30:20' , 250.00 , 0);

ALTER TABLE NE.ClientData
ALTER COLUMN PRJNO INT NOT NULL -- Make PRJNO Not Null
GO

ALTER TABLE NE.ClientData
ADD CONSTRAINT PK_PRJNO PRIMARY KEY(PRJNO) -- PK_PRJNO is constrint name.
GO

ALTER TABLE NE.ClientData
DROP COLUMN Tecnology;
GO

CREATE TABLE NE.Technology(
    PRJNO INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
)
GO

INSERT INTO NE.Technology(PRJNO,Name)
VALUES (100 , 'SQL'),
(100 , 'ASP'),
(100 , 'Angluer'),
(101 , 'SQL'),
(101 , 'ASP'),
(101 , 'React'),
(102 , 'SQL'),
(102 , 'WPF'),
(103 , 'Android'),
(104 , 'Oracel'),
(104 , 'WPF'),
(105 , 'Oracel'),
(105 , 'PHP');
GO


DROP TABLE NE.Technology;
GO

CREATE TABLE NE.Technology(
    Id INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    PRIMARY KEY(Id)
)
GO

CREATE TABLE NE.ProjectTechnology(
    PRJNO INT FOREIGN KEY REFERENCES NE.ClientData(PRJNO) NOT NULL,
    TechnologyId INT FOREIGN KEY REFERENCES NE.Technology(Id) NOT NULL,
)
GO

INSERT INTO NE.Technology(Id,Name)
VALUES (1 , 'SQL'),
(2 , 'ASP'),
(3 , 'Angluer'),
(4 , 'React'),
(5 , 'WPF'),
(6 , 'Oracle'),
(7 , 'Android'),
(8 , 'PHP');
GO


INSERT INTO NE.ProjectTechnology(PRJNO,TechnologyId)
VALUES (100 , 1),
(100 , 2),
(100 , 3),
(101 , 1),
(101 , 2),
(101 , 4),
(102 , 1),
(102 , 5),
(103 , 7),
(104 , 6),
(104 , 5),
(105 , 6),
(105 , 8);
GO

ALTER TABLE NE.ClientData
DROP COLUMN ProjectManger;
GO

CREATE TABLE NE.Managers(
    Id INT NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PRIMARY KEY(Id)
)
GO

INSERT INTO NE.Managers(Id , Email)
VALUES (1 , 'peter@fake.com'),
 (2 , 'mike@fake.com'),
 (3 , 'reem@fake.com'),
 (4 , 'salah@fake.com'),
 (5 , 'ziad@fake.com'),
 (6 , 'ali@fake.com');
 GO

 -- Add Unique Constraint
ALTER TABLE NE.Managers
ADD CONSTRAINT UN_Email UNIQUE(Email)
GO

ALTER TABLE NE.ClientData
ADD ManagerID INT FOREIGN KEY REFERENCES NE.Managers(Id);
GO