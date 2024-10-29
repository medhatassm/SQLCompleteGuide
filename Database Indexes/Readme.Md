## Database Indexes

### Performance

- **Primary Key**
    
    logical concept, unique, Not-Null, Clustered index ⇒ index that effect the order in which data is stored on disk (Physical concept)
    
    N(O) With PrimaryKey ⇒ (O) = log(n) (where n is rows)
    
    N(O) Without PrimaryKey ⇒ (O) = n (where n is rows)
    
    ---
    
- **Non-Clustered Index**
    
    index where the order doesn’t match the physics order of the actual data (O) = log(n) (where n is rows)
    
    ---
    
- Multi-Index
    
    More performance
    
    | ID | A | B |
    | --- | --- | --- |
    | 1 | A1 | B1 |
    | 2 | A2 | B2 |
    | 3 | A1 | B3 |
    | 4 | A2 | B3 |
    | 5 | A2 | B2 |

    | A Index |  |
    | --- | --- |
    | A1 | 1,3 |
    | A2 | 2,4,5 |
    
    | B Index |  |
    | --- | --- |
    | B1 | 1 |
    | B2 | 2,5 |
    | B3 | 3,4 |
    
    This how Multi-Index work each column have his index to make better performance like in this query
    
    ```sql
    WHERE A = A1
    WHERE B = B1
    WHERE A = A1 AND B = B1
    ```
    
    but what if we need mix the column together and get more performance also, now using multi-column-index
    
    ---
    
- **Multi-Column-Index (Order is important)**
    
    
    | AB Index |  |  |
    | --- | --- | --- |
    | A1 | B1 | 1 |
    |  | B3 | 3 |
    | A2 | B2 | 2,5 |
    |  | B4 | 4 |
    
    Now with this index we can call mixed condition with better performance
    
    ```sql
    WHERE A = A1 -- OK
    WHERE A = A1 AND B > B2 -- OK
    WHERE B = B2 -- Not Ok (becuse we not having B Index A is primary key now)
    ```
    
    - Index have **TradeOffs** (Read efficiency & Write efficiency)
        - Read efficiency ⇒ Delete, Select (Fast)
        - Write efficiency ⇒ Insert, Update (Slow)
    
    **Creating Index**
    
    ```sql
    CREATE INDEX IndexName
     ON TableName(ColumnName);
     
    -- Drop The Index
    
    DROP INDEX IndexName ON TableName;
    ```
    
    ---
    
- **Remove Cashes**
    
    ```sql
    DBCC FREEPROCCACHE; -- Remove all element from the plan cach ,
     -- flush plan cache for the entire instance
    ```
    
    - Get Execution time down to millisecond
        
        ```sql
        -- Get Excution time down to milliseconds
        
        SET STATISTICS TIME , IO ON;
        
        SET STATISTICS TIME , IO OFF;
        ```