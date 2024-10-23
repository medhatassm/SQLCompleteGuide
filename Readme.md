# SQL

SQL, or **Structured Query Language**, is a standard programming language used to manage and manipulate relational databases,SQL is widely used for database management in various applications due to its ease of use and efficiency in handling relational data.

# Introduction To Database

- Database Normalization
- Definition And History

---
# Introduction To DataBase

## Definition And History

### Definition

- **Data**
    
    Fact & statistics collected together for reference or analysis.
    
- **Base**
    
    Situate as the center of _______
    

- Good Data allows establish
    - Baselines
    - Benchmarks
    - Goals
- **DataBase**
    
    Organize collection of structured in formation or data, typically stored electronically  in a computer system.
    

---

### History

- **DataBase Evolution**
    
    
    | Name | Year | Example |
    | --- | --- | --- |
    | File | - | File Access |
    | DBMS | 1960 | System Management File, IBM System |
    | RDBMS | 1980 | MSSQL, MySQL, Oracle |
    | M.Dimensional | 1990 | MSSQL Server Analysis Server |
    | NoSQL | 1998 | MongoDB,Cassandra |
    | Graph | 2000 | NEO4J , DGraph |
    | NewSQL | 2010 | NUODB, Google Spanner |

- **SQL Server Architecture**
    1. SNI (SQLNetwork Interface) Client establish secure connection TCP/IP
    2. Connection Create to TDS (Tabular data stream) End point
    3. Client wrap SQL statement in TDS message and sent it
    4. Protocol layer unwrap the TDS Message → CMD Parser

![Screenshot 2024-10-22 at 11 24 57 AM](https://github.com/user-attachments/assets/c573bbe0-b09d-4d5a-8e04-1d693c9a9350)


1. CMD Parser statement valid step (6), else return error
2. if plan is cached, pass it to query executer step (9)
3. Command Parser (CMD) pass query tree to optimizer
4. Query optimizer choose best plans pass it to query executer
5. Query executer suitable access method in storage engine
6. Access method request / Buffer manager - Buffer Pool
7. Page is not cached Buffer Manger fetch data from file
8. Buffer Manager send the result in Buffer Pool
9. Buffer Manager send the result to access method
10. Query Executer will return the result to SNI server
11. SNI server wrap the output in a TDS Package
---
