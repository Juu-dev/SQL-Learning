use AdventureWorks

SELECT *
INTO Sales.Customer_NoIndex
FROM Sales.Customer

SELECT *
INTO Sales.Customer_Index
FROM Sales.Customer
GO
CREATE INDEX Idx_Customer_Index_CustomerID ON 
Sales.Customer_Index(CustomerID)--2 lenh select dung de so sanh 2 kieu index--SELECT CustomerID, AccountNumber
FROM Sales.Customer_NoIndex
WHERE CustomerID = 11001

SELECT CustomerID, AccountNumber
FROM Sales.Customer_Index
WHERE CustomerID = 11001--page read--USE AdventureWorks;
GO 
SET STATISTICS IO ON;
GO
SELECT * 
FROM Production.ProductCostHistory
WHERE StandardCost < 500.00;
GO
SET STATISTICS IO OFF;
GO

--Query Execution Time--
SET STATISTICS TIME ON
GO
SELECT * 
FROM Production.ProductCostHistory
WHERE StandardCost < 500.00;
GO
SET STATISTICS TIME OFF;
GO

--Laboratory Exercise
use AdventureWorks;
--1--
select * from Person.Person
order by Firstname;

--2--
select title, firstname, middlename, lastname, emailaddress
from Person.Contact;

--3--
select
(
	CASE
	WHEN Title IS NULL then ''
	else title
	end
)
 + firstname + lastname as PersonName
from Person.Person
order by Firstname;

--4--
select * from Person.Address;

--5--
Select distinct city
from Person.Address;

--6--
Select top 10 *
from Person.Address;

--7--
select avg(rate) as avg_rate from HumanResources.EmployeePayHistory;

--8--
select count(*) from  HumanResources.Employee;

--9--
select * from Sales.SalesOrderDetail;