-- Create New DataBase Query
CREATE DATABASE ProjectManagmentDB;
GO

-- Use Spicific DataBase
USE ProjectManagmentDB;
GO

-- Create New Schema
CREATE SCHEMA PM;
GO

-- Create New Table
CREATE TABLE PM.Company(
    CRNNO INT PRIMARY KEY,
    CompanyName VARCHAR(50) NOT NULL -- varchar() , nvarchar() , char(), nchar()
)
GO

-- Other Way To Create Primary Key
CREATE TABLE PM.Managers(
    Id INT NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PRIMARY KEY(Id)

)
GO

-- Add Unique Constraint
ALTER TABLE PM.Managers
ADD CONSTRAINT UN_Email UNIQUE(Email)
GO

-- Create Foreign Key
CREATE TABLE PM.Projects(
    PRJNO INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    ManagerID INT FOREIGN KEY REFERENCES PM.Managers(Id),
    StartDate DATETIME2 NOT NULL,
    InitialCost DECIMAL(18,2) NOT NULL, -- 9999.99
    Parked BIT NOT NULL,
    CRNNO INT NOT NULL,
    FOREIGN KEY (CRNNO) REFERENCES PM.Company(CRNNO)
);
GO

-- Add Defualt Constraint
ALTER TABLE PM.Projects
ADD CONSTRAINT DFT_Parked DEFAULT 0 FOR Parked

-- Create Other Table
CREATE TABLE PM.Technology(
    Id INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    PRIMARY KEY(Id)
)
GO

CREATE TABLE PM.ProjectTechnology(
    PRJNO INT FOREIGN KEY REFERENCES PM.Projects(PRJNO) NOT NULL,
    TechnologyId INT FOREIGN KEY REFERENCES PM.Technology(Id) NOT NULL,
    PRIMARY KEY(PRJNO)
)
GO

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

-- Create Test DataBase
CREATE DATABASE TestDB
GO

USE TestDB
GO

CREATE TABLE SomeTable(
    Name VARCHAR(25) NOT NULL
)
GO

-- Change Column Attribute
ALTER TABLE SomeTable
ALTER COLUMN Name VARCHAR(50)

-- Add Column To Existing Table
ALTER TABLE SomeTable
ADD Col2 VARCHAR(20) NOT NULL

-- Delete Column From Existing Table
ALTER TABLE SomeTable
DROP COLUMN Col2

-- Delete Table
DROP TABLE SomeTable

-- Delete Database
USE master
GO
DROP DATABASE TestDB

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

-- Set Identity Column
CREATE DATABASE TestDB2
GO

USE TestDB2
GO

CREATE TABLE SomeTable2(
    -- Start From 1 And Increment By 1
    Id INT PRIMARY KEY Identity(1,1),
    Name VARCHAR(25) NOT NULL
)
GO

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------