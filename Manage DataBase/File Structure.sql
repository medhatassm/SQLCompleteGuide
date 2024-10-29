USE master
GO

-- Contorl Databae file while creating

CREATE DATABASE DBFG
ON PRIMARY(
    NAME = N'DBFG', -- File Name
    FILENAME = N'/var/opt/mssql/data/DBFG.mdf', -- File Path
    SIZE = 4096KB, -- File Size
    FILEGROWTH = 1024KB
),
(
    NAME = N'DBFG_1', -- File Name
    FILENAME = N'/var/opt/mssql/data/DBFG_1.ndf', -- File Path
    SIZE = 4096KB, -- File Size
    FILEGROWTH = 1024KB
)
LOG ON (
    NAME = N'DBFG_Log', -- File Name
    FILENAME = N'/var/opt/mssql/data/DBFG_Log.ldf', -- File Path
    SIZE = 1024KB, -- File Size
    FILEGROWTH = 10%
)
GO

USE DBFG
GO

SELECT * FROM sys.filegroups -- show PrimaryKey of filegroups and much more...

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

-- Update Databae file after creating

ALTER DATABASE [DBFG] ADD FILEGROUP SECFG
GO

ALTER DATABASE [DBFG] 
ADD FILE (
    NAME = N'Test_One', -- File Name
    FILENAME = N'/var/opt/mssql/data/Test_One.ndf', -- File Path
    SIZE = 1024KB, -- File Size
    FILEGROWTH = 10%
),
(
    NAME = N'Test_Two', -- File Name
    FILENAME = N'/var/opt/mssql/data/Test_Two.ndf', -- File Path
    SIZE = 1024KB, -- File Size
    FILEGROWTH = 10%
)
TO FILEGROUP SECFG
GO

USE master
DROP DATABASE DBFG
GO