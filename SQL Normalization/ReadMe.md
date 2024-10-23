## Database Normalization

### Normalization Into

- **Business Requirement**
    
    you have a client that use manual data like (Excel, Word, etc..) and he want to convert his work to application (**Automation**), he have some data table that he create in excel program and give it to you to help you while making application for him.
    
    This data make by user not programming so we called it **End-User Prospective Data**, and this data can’t be put directly to your application because it has some issue you will face while making application as
    
    - Redundancy
    - Inconsistency
    - DB Anomalies
        - Insert Anomalies
        - Update Anomalies
        - delete Anomalies
    
    To Solve this Problem you can use **DB Normalization Forms** let’s explain it by example.
    
- **Initial Data**

| **PRJNO** | **Title** | **Project Manager** | **Technology** | **Start** **Data** | **Initial Cost** | **Parked** |
| --- | --- | --- | --- | --- | --- | --- |
| 100 | CMS | peter@fake.com | SQL, ASP, React | JAN 1st 2024 | 1.500.00EGP | FALSE |
| 101 | ERP | mike@fake.com | ASP, React | FEB  1st 2024 | 1.500.00EGP | FALSE |
| 102 | CMS | reem@fake.com | ASP, Angler | MAR  1st 2024 | 1.500.00EGP | FALSE |
| 103 | CRM | salah@fake.com | Android | APR  1st 2024 | 500.00EGP | FALSE |
| 104 | CRM | ziad@fake.com | Oracle, WPF | JUN  1st 2024 | 1.500.00EGP | FALSE |
| 105 | ERP | ali@fake.com | Oracle, PHP | SEP  1st 2024 | 250.00EGP | FALSE |

This table is the data that user send to you (Likely its not Normalization) now let’s fix it and make it satisfy with normalization forms rules.

let’s first create this table by **Query Syntax**

- Create New Database
    
    ```sql
    CREATE DATABASE NormalizationExampleDB;
    ```
    
- Use Specific DataBase
    
    ```sql
    USE NormalizationExampleDB;
    ```
    
- Create New Schema (default schema is ‘db’)
    
    ```sql
    CREATE SCHEMA NE;
    ```
    
- Create New Table
    
    ```sql
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
    ```
    
- Seed Table with Data
    
    ```sql
    INSERT INTO NE.ClientData(PRJNO,Title,ProjectManger,Tecnology,StartDate,InitialCost,Parked)
        VALUES (100 , 'CMS' , 'peter@fake.com' , 'SQL, ASP, React' , '2024-01-01 07:30:20' , 1500.00 , 0),
        (101 , 'ERP' , 'mike@fake.com' , 'ASP, React' , '2024-02-01 07:30:20' , 1500.00 , 0),
        (102 , 'CMS' , 'reem@fake.com' , 'ASP, Angler' , '2024-03-01 07:30:20' , 1500.00 , 0),
        (103 , 'CRM' , 'salah@fake.com' , 'Android' , '2024-04-01 07:30:20' , 500.00 , 0),
        (104 , 'CRM' , 'ziad@fake.com' , 'Oracle, WPF' , '2024-05-01 07:30:20' , 1500.00 , 0),
        (105 , 'ERP' , 'ali@fake.com' , 'Oracle, PHP' , '2024-09-01 07:30:20' , 250.00 , 0);
    ```
    

### Normalizing Forms

- **First Normal Form (1NF)**
    - Conditions required to achieve this form
        1. Relation should have Primary Key
        2. Domain value preserved
        3. Atomic Value

> **This form resolve the horizontal dependance in your database.**
> 
- Note:
    - Relation type
        1. One to One
        2. One to Many
        3. Many to Many

We Will talk about relation later while following the example. 😊

1. **Relation should have Primary Key**
    
    Primary Key have to be unique value and never be repeated in the same table, and should be Not NULL able.
    
    > if your table didn’t have any column with unique value for each row, you can create a new column to make this column is the primary key
    > 
    
    but here we have PRJNO (Project Number) and this number is unique value so it can be our primary key.
    
    - Make Column Primary Key For Table
        
        ```sql
        ALTER TABLE NE.ClientData
        ALTER COLUMN PRJNO INT NOT NULL -- Make PRJNO Not Null
        GO
        
        ALTER TABLE NE.ClientData
        ADD CONSTRAINT PK_PRJNO PRIMARY KEY(PRJNO) -- PK_PRJNO is constrint name.
        GO
        ```
        
        now PRJNO is not null able and Primary key for whole table
        
    
    > **Primary Key:** constraint uniquely identifies each record in a table.
    > 

---

1. **Domain Value Preserved**
    
    this rule you have to make sure that every column value have one datatype, (this one if you have data from client as excel file so make sure before you seed it to your database that every column value have the same datatype), and try to avoid null value as much as you can.
    
    in our example this rule is met, so we can go to the next one. 
    

---

1. **Atomic Value**
    
    Every column should have one value readable you can’t have array or list of value in column, this make lot issue while dealing with database as (Select, Insert, Delete or Update)
    
    Solve Atomic value by create a new table for each column that have multi value inside it (**Atomising Value**)
    
    - In **Technology** column we have have multi value inside it
        
        
        | **Technology** |
        | --- |
        | SQL, ASP, React |
        | ASP, React |
        | ASP, Angler |
        | Android |
        | Oracle, WPF |
        | Oracle, PHP |
        
        And Now we have row for each skills and know the project which use this skill by PRJNO.
        
        **Let’s Make it by coding** 😉
        
        Each skill get there own row and get the PK from PRJNO.
        
        | PRJNO | **Technology** |
        | --- | --- |
        | 100 | SQL |
        | 100 | ASP |
        | 100 | Angler |
        | 101 | SQL |
        | 101 | ASP |
        | 101 | React |
        | 102 | SQL |
        | 102 | WPF |
        | 103 | Android |
        | 104 | Oracle |
        | 104 | WPF |
        | 105 | Oracle |
        | 105 | PHP |
    - Delete Technology Column from ClientData table
        
        ```sql
        ALTER TABLE NE.ClientData
        DROP COLUMN Tecnology;
        GO
        ```
        
    - Create New Table with new rule that we discussed before
        
        ```sql
        CREATE TABLE NE.Technology(
            PRJNO INT NOT NULL,
            Name VARCHAR(100) NOT NULL,
        )
        GO
        ```
        
    - Seed Data to new Table
        
        ```sql
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
        ```
        
    
    Now We Achieve The Atomic Rule.
    
    **Our table is now complete with first Normalization Form.**
    
    ---
    
- **Second Normal Form (2NF)**
    
    
    - Conditions required to achieve this form
        1. First Normal Form Achieved
        2. Composed Key
        3. Vertical Redundancy
    
    > **This form resolve the Vertical dependance in your database.**
    > 
1. **First Normal From is Achieved**

---

1. **Composed key**
    
    All Non key attributes are fully dependent on table PK, SingleKey ⇒ by default dependency satisfied.
    
    again with technology table we make each skill have row, but we didn’t give each skill a PK we just give it the PRJNO PK and this make issue when search for specific skill (search by name is not recommended) so let’s fix it
    
    - Delete Technology Table again
        
        ```sql
        DROP TABLE NE.Technology;
        GO
        ```
        
    - Create it with id (PK)
        
        ```sql
        CREATE TABLE NE.Technology(
            Id INT NOT NULL,
            Name VARCHAR(100) NOT NULL,
            PRIMARY KEY(Id)
        )
        GO
        ```
        
    - Now let’s Make Table that have PRJNO (PK) and Id (PK) for each project and skills, and make it foreign key to PRJNO in ClientData Table and Technology Table
        
        ```sql
        CREATE TABLE NE.ProjectTechnology(
            PRJNO INT FOREIGN KEY REFERENCES NE.ClientData(PRJNO) NOT NULL,
            TechnologyId INT FOREIGN KEY REFERENCES NE.Technology(Id) NOT NULL,
        )
        GO
        ```
        
    - Now we have ProjectTechnology Table that have two foreign key for each primary key in clientData table and Technology Table, let’s seed data
        
        ```sql
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
        ```
        
        | PRJNO (FK) | **Technology (FK)** |
        | --- | --- |
        | 100 | 1 |
        | 100 | 2 |
        | 100 | 3 |
        | 101 | 1 |
        | 101 | 2 |
        | 101 | 4 |
        | 102 | 1 |
        | 102 | 5 |
        | 103 | 7 |
        | 104 | 6 |
        | 104 | 5 |
        | 105 | 6 |
        | 105 | 8 |
        
        | Id | **Technology** |
        | --- | --- |
        | 1 | SQL |
        | 2 | ASP |
        | 3 | Angler |
        | 4 | React |
        | 5 | WPF |
        | 6 | Oracle |
        | 7 | Android |
        | 8 | PHP |
        

---

1. **Vertical Redundancy** 
    
    in this you should make sure there is no value repeated in same column (string) make it a PK, for Example:
    
    in ClientData Table there is column called ProjectManager it have some email for employee but each manager can handle more than one project and this is (One to Many) relation so in this rule we will make sure that every manger have his own PK ant just repeated the manger email in ClientTable.
    
    ```sql
    ALTER TABLE NE.ClientData
    DROP COLUMN ProjectManger;
    GO
    
    CREATE TABLE NE.Managers(
        Id INT NOT NULL,
        Email VARCHAR(100) NOT NULL,
        PRIMARY KEY(Id)
    )
    GO
    
    -- Add Unique Constraint
    ALTER TABLE PM.Managers
    ADD CONSTRAINT UN_Email UNIQUE(Email)
    GO
    
    INSERT INTO NE.Managers(Id , Email)
    VALUES (1 , 'peter@fake.com'),
     (2 , 'mike@fake.com'),
     (3 , 'reem@fake.com'),
     (4 , 'salah@fake.com'),
     (5 , 'ziad@fake.com'),
     (6 , 'ali@fake.com');
     GO
    ```
    

---

- **Third Normal Form (3NF)**

- Conditions required to achieve this form
    1. Second Normal Form (2NF) Achieved 
    2. All non key attribute are solely dependent on the table PK
    

> **This form resolve the Transtive dependance in your database.**
> 

1. **Second Normal Form (2NF) Achieved** 

---

1. **All non key attribute are solely dependent on the table PK**
    - **PK (Primary Key)**: This is a unique identifier for each record in a table. It ensures that no two rows have the same value for this attribute, which helps maintain data integrity.
    - **Non-Key Attributes**: These are the other columns in the table that do not form part of the primary key. They provide additional information about the entity represented by the table.
    - **Dependency**: The phrase "solely dependent" means that every non-key attribute should be functionally dependent on the primary key. In other words, the value of a non-key attribute should be determined exclusively by the value of the primary key.

---

### Default Databases

- **Master ⇒** Record all the system level information
- **Model ⇒** Template for all database the will be created
- **MSdb ⇒** Secluding alerts & jobs (Notification) to make history, backup and records
- **Tempdb ⇒** Temporary and intermediate data