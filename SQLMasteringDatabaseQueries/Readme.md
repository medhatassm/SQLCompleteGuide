# SQL Queries Exercises

## Initial NorthWind

> first you need to install NorthWind Data base from microsoft or use scripted file below to create the Database to use to solve this exercises
> 
> 
> [instnwnd.sql](https://prod-files-secure.s3.us-west-2.amazonaws.com/ac8d2e56-c643-48fc-af41-f14c17164785/f62fa384-0e3c-47d1-b1ad-3f59a1eaba45/instnwnd.sql)
> 

---

## Exercises

**Q1 ⇒** Create a report the show Category Name and Description from the Categories table stored by Category Name

---

**Q2 ⇒** Create a report that show the ContactName , CompanyName , ContactTitle and PhoneNumber from the Customer table sorted by ContactTitle DESC.

---

**Q3 ⇒** Create a report show the Capitalized FirstName and Capitalized LastName renamed as FirstName and LastName, Respectively and HireDate from the Employee table sorted from newest to the oldest employee.

---

**Q4 ⇒** Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID Freight from the Orders Table sorted by Freight in descending order.

---

**Q5 ⇒** Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table.

---

**Q6⇒** Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the Suppliers table sorted by the Country in descending order then by CompanyName in ascending order.

---

**Q7⇒** Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only.

---

**Q8 ⇒** Create a report showing ProductName, UnitPrice, QuantityPerUnit of Products that are out of stock.

---

**Q9 ⇒** Create a report showing all the ContactName, Address, City of all Customers not from Germany, Mexico, Spain.

---

**Q10 ⇒** Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 04 Feb 1997.

---

**Q11 ⇒** Create a report showing FirstName, LastName, Country from the employees not from United States.

---

**Q12 ⇒** Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all Orders shipped date grater than the required date.

---

**Q13 ⇒** Create a report that shows the City, CompanyName, ContactName of Customers from cities starting with A or B

---

**Q14 ⇒** Create a report showing all the even numbers of OrderID from the Orders table

---

**Q15 ⇒** Create a report that shows all the Orders where the Freight cost more than $500

---

**Q16 ⇒** Create a report that shows ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel when inventory items on hand quantity (UnitsInStock) are below the reorder level.

---

**Q17 ⇒** Create a report that shows the CompanyName, ContactName, *FaxNumber* of all Customer that have no fax number

---

**Q18 ⇒** Create a report that shows the FirstName, LastName of all Employees that do not report to anybody

---

**Q19 ⇒** Create a report showing Products that we don't sell any more

---

**Q20 ⇒** Create a report that shows the CompanyName, ContactName, Fax of all Customers that do not have Fax number AND Live in USA and sorted by ContactName.

---

**Q21 ⇒** Create a report that shows the City, CompanyName, ContactName of Customers from cities that has letter L in the name sorted by ContactName.

---

**Q22 ⇒** Create a report that shows the FirstName, LastName, BirthDate of Employees born in the 1950s.

---

**Q23 ⇒** Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the Employees table.

---

**Q24 ⇒** Create a report showing OrderID, total number of items in the order as NumberOfItems from the OrderDetails table grouped by OrderID and sorted by NumberOfItems in descending order.

---

**Q25 ⇒** Create a report that shows the SupplierID, ProductName, CompanyName from all Product Supplied by Exotic Liquids, Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID.

---

**Q26 ⇒** Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all Orders with ShipPostalCode ends with "00”

---

**Q27 ⇒** Create a report that shows the ContactName, ContactTitle, CompanyName of Customers that the has no "Sales" in their ContactTitle.

---

**Q28 ⇒** Create a report that shows the LastName, FirstName, City of Employees in cities other "Seattle"

---

**Q29 ⇒** Create a report that shows the CompanyName, ContactTitle, City, Country of all Customers in any city in Mexico or other cities in Spain other than Madrid.

---

**Q30 ⇒** Create a select statement that outputs the following

![Screenshot 2024-11-02 at 1.52.43 PM.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/ac8d2e56-c643-48fc-af41-f14c17164785/e7e32dbb-40ba-48f9-a0f6-239dc6c65775/Screenshot_2024-11-02_at_1.52.43_PM.png)

---

**Q31 ⇒** Create a report that shows the ContactName of all Customers that do not have letter A as the second alphabet in their ContactName.

---

**Q32 ⇒** Create a report that shows the average UnitPrice rounded to the next whole number, total of UnitsInStock and maximum number of pending orders from the Products table. All saved as AveragePrice, TotalStock and MaxPendingOrders respectively.

---

**Q33 ⇒** Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice.

---

**Q34 ⇒** Create a report that shows the sum of Freight for each CustomerID, when sum of Freight greater $200.

---

**Q35 ⇒** Create a report that shows the OrderID, ContactName, UnitPrice, Quantity with discount given on every purchase.

---

**Q36 ⇒** Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of who they report to as manager sorted by Employee ID

---

**Q37 ⇒** Create a report that shows ProductId, ProductName, Active if discontinued is 0 otherwise InActive and name the column Status.

---

**Q38 ⇒** Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country, Phone, OrderDate, RequiredDate, ShippedDate.

---

**Q39 ⇒** Change the name of the view you created from customerInfo to customer details.

---

**Q40 ⇒** Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued

---

**Q41 ⇒** Drop the customer info view.

---

**Q42 ⇒** Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo.

---

**Q43 ⇒** Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table HINT: reate a Table, use the LIKE Statement and INSERT INTO statement.

---

**Q44 ⇒** ADD a column to shippers_duplicate table called email of type varchar(150) update each shipper email with random email to each shipper and Display the data in the shippers_duplicate table.

---

**Q45 ⇒** Create a report that shows the CompanyName and ProductName from all product in the Seafood category.

---

**Q46 ⇒** Create a report that shows most expensive and least expensive Product list (name and unit price)

---

**Q47 ⇒** Delete the shippers_duplicate table.

---

**Q48 ⇒** Create a select statement that outputs the following from the Employees table. LastName, FirstName, Title, Age.

---

**Q49 ⇒** Create a report that the CompanyName and total number of orders by customer renamed as number of orders since December 31, 1994. Show number of Orders greater than 10.

---

**Q50 ⇒** Create a select statement that outputs the following from the product table {ProductName} / is {QuantityPerUnit} and cost ${UnitPrice}

---

## Solutions

[Queries Exercise.SQL](https://prod-files-secure.s3.us-west-2.amazonaws.com/ac8d2e56-c643-48fc-af41-f14c17164785/0aa8e82c-b0d1-4ddb-993b-7894b688f58b/Queries_Exercise.sql)