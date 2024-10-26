## Data Manipulation

### Inserting Data

- **Insert Query**
    
    Insert value to columns in table using this query
    
    ```sql
    INSERT INTO "tableName" ("ColumnName" , "CoulmnName",..)
    VALUES (Value,Value...);
    
    -- OR --
    
    INSERT INTO "tableName" VALUES (Value,Value) , (Value,Value);
    ```
    
    **Example:**
    
    ```sql
    INSERT INTO PM.Projects ( PRJNO, Title, ManagerId, StartDate, InitialCost, Parked, CRNNO)
         VALUES ( 401, 'CMS', 201, '2022-01-01', 15000000, 0, 101),
                ( 402, 'ERP', 202, '2022-02-01', 20000000, 0, 102),
                ( 403, 'CMS', 203, '2022-03-01', 15000000, 0, 105),
                ( 404, 'Authenticator', 204, '2022-04-01', 150000, 0, 101),
                ( 405, 'CRM-DESKTOP', 203, '2022-05-01', 20000000, 0, 104),
                ( 406, 'ERP', 204, '2022-06-01', 20000000, 0, 105),
                ( 407, 'HUB', 204, '2022-06-01', 20000000, 1, 104);
    
    -- OR --
    
    INSERT INTO PM.ProjectTechnology VALUES 
            ( 401, 301), 
            ( 401, 302),
    				( 401, 303),
    				( 402, 301), 
            ( 402, 302),
    				( 402, 304),
    				( 403, 301), 
            ( 403, 302),
    				( 403, 308),
    				( 404, 306),
    				( 405, 307),
    				( 405, 305),
    				( 406, 307),
    				( 406, 308);
    ```
    

---

### Selecting Data

- **Select Query**
    
    Fitch Columns Data to display it.
    
    ```sql
    SELECT "ColumnName" , "ColumnName" ... FROM "TableName";
    
    -- OR --
    
    SELECT * FROM "tableName"; -- * Mean Select all columns inside table
    ```
    
    Example
    
    ```sql
    SELECT PRJNO, Title,ManagerID, StartDate, InitialCost, Parked, CRNNO
    FROM PM.Projects;
    
    SELECT PRJNO, Title
    FROM PM.Projects;
    
    -- OR --
    
    SELECT * FROM PM.Projects;
    ```
    
    ---
    
- **Where Query**
    
    Set condition while fetching data.
    
    ```sql
    SELECT * FROM PM.Projects WHERE InitialCost >= 1000000
    
    SELECT * FROM PM.Projects WHERE NOT InitialCost >= 1000000
    
    SELECT * FROM PM.Projects WHERE InitialCost >= 1000000 AND StartDate >= '2022-03-01';
    ```
    
    ---
    
- **Like Query**
    
    
    | XX% | Start With XX |
    | --- | --- |
    | %XX | End With XX |
    | %XX% | Contains XX |
    | _X_Y% | Second Later X And Fourth is Y |
    
    ```sql
    SELECT * FROM PM.Projects WHERE Title LIKE 'C%' -- Start With C
    
    SELECT * FROM PM.Projects WHERE Title LIKE '%P' -- End With P
    
    SELECT * FROM PM.Projects WHERE Title LIKE '%DESK%' -- Contains DESK
    
    SELECT * FROM PM.Projects WHERE Title LIKE '_R%' -- Second letter is R
    
    SELECT * FROM PM.Projects WHERE Title LIKE '_R_' -- just three letter and second letter is R
    
    SELECT * FROM PM.Projects WHERE InitialCost LIKE '_5%'
    ```
    
    ---
    
- **Top Query**
    
    Select Top n (number) from table
    
    ```sql
    SELECT TOP 5 * FROM PM.Projects;
    
    -- OR --
    
    SELECT TOP 2 PERCENT * FROM PM.Projects;
    ```
    
    ---
    
- **Order By Query**
    
    order your fetched data [ASC , DESC]  by specific columns.
    
    ```sql
    SELECT * FROM PM.Projects ORDER BY StartDate; -- ASC By Defualt
    
    SELECT * FROM PM.Projects ORDER BY StartDate DESC;
    
    SELECT * FROM PM.Projects ORDER BY InitialCost, StartDate ASC;
    ```
    
    ---
    
- **Distinct Query**
    
    Remove all repeated rows from fetched data.
    
    ```sql
    SELECT DISTINCT * FROM PM.Projects -- Withour repeated rows
    ```
    
    ---
    
- **Group By Query**
    
    Fitch data base on a column name.
    
    ```sql
    SELECT Title FROM PM.Projects GROUP BY Title;
    
    SELECT ManagerID FROM PM.Projects WHERE Parked = 0 GROUP BY ManagerID HAVING COUNT(*) >= 2;
    ```
    
    - Having V.S Where
        - Where come before Group by
        - Have come after Group by

---

### Aggregate Function

- **Count Function**
    
    Return the number of rows using this value in columns.
    
    ```sql
    SELECT Title , COUNT(*) FROM PM.Projects GROUP BY Title; -- Return the number of rows using this title.
    
    SELECT ManagerID , COUNT(*) FROM PM.Projects WHERE Parked = 0 GROUP BY ManagerID HAVING COUNT(*) >= 2;
    ```
    
    ---
    
- Sum Function
    
    Return The sum
    
    ---
    
- Avg Function
    
    Return The average value
    
    ---
    
- Min Function
    
    Return The smallest value
    
    ---
    
- Max Function
    
    Return The largest value
    
    ---
    
- First Function
    
    Return The first value
    
    ---
    
- Last Function
    
    Return The last value
    

---

### Joins

- **Inner Join**
    
    fitch data from two table and display it at on table (Have to be Match in two table)
    
    - Try to make this without Join (its possible)
    
    ```sql
    SELECT * FROM PM.Projects; -- Get PRJNO and Title From this table
    SELECT * FROM PM.Managers; -- Get Email From this table for each ManagerID in projects table
    
    -- solution
    
    SELECT PRJNO , Title , Email FROM PM.Projects , PM.Managers; -- Cartisian Product
    ```
    
    To Solve this problem declare a condition prevent this bug from happening.
    
    ```sql
    SELECT PRJNO , Title , Email, Id , ManagerID FROM PM.Projects , PM.Managers WHERE PM.Projects.ManagerID = PM.Managers.Id;
    ```
    
    - With Inner Join Query
    
    ```sql
    SELECT PRJNO , Title , Email
    FROM PM.Projects AS P
    INNER JOIN PM.Managers AS M
    ON P.ManagerID = M.Id;
    GO
    ```
    
- Left Join
    
    Display all rows from left table even if there is no match.
    
    ```sql
    SELECT PRJNO , Title , CompanyName
    FROM PM.Projects AS P
    LEFT JOIN PM.Company AS C
    ON P.CRNNO = C.CRNNO;
    ```
    
- **Right Join**
    
    Display all rows from right table even if there is no match.
    
    ```sql
    SELECT PRJNO , Title , CompanyName
    FROM PM.Projects AS P
    RIGHT JOIN PM.Company AS C
    ON P.CRNNO = C.CRNNO;
    ```
    
- **Full Join**
    
    Display all rows from left and right table even if there is no match.
    
    ```sql
    SELECT PRJNO , Title , CompanyName
    FROM PM.Projects AS P
    FULL JOIN PM.Company AS C
    ON P.CRNNO = C.CRNNO;
    ```
    

---

### Other Manipulation Query

- **Update Query**
    
    Updating Existing data in columns (Never Forget to set a condition)
    
    ```sql
    UPDATE PM.Projects
    SET StartDate = '2022-07-10'
    WHERE PRJNO = 407; -- Important to have condtion (update all row "startDate" if you forget the condition)
    ```
    
    ---
    
- **Delete Query**
    
    Delete Existing Records From columns (Never Forget to set a condition)
    
    ```sql
    DELETE FROM PM.Projects
    WHERE PRJNO = 407; -- Important to have condtion (Delete all row if you forget the condition)
    ```
    
    ---
    
- **Drop Query**
    
    Delete table from data base with his data
    
    ```sql
    DROP TABLE PM.Projects;
    ```
    
    ---
    
- **Truncate Query**
    
    Delete all records inside table (not deleting the table)
    
    ```sql
    TRUNCATE TABLE PM.Projects;
    ```
    
    ---
    
- **Sub Query**
    
    Like Nested Query (Query inside Query)
    
    ```sql
    -- Update InitialCost * 1.05 in project that use oracle skills.
    
    UPDATE PM.Projects SET InitialCost = InitialCost * 1.05
    WHERE PRJNO IN (SELECT PRJNO FROM PM.ProjectTechnology
     WHERE TechnologyId = (
        SELECT Id FROM PM.Technology
            WHERE Name = 'ORACLE'
     ));
    ```