﻿use AdventureWorks2016

SELECT *
INTO Sales.Customer_NoIndex
FROM Sales.Customer

SELECT *
INTO Sales.Customer_Index
FROM Sales.Customer
GO
CREATE INDEX Idx_Customer_Index_CustomerID ON 
Sales.Customer_Index(CustomerID)

--2 lenh select dung de so sanh 2 kieu index--
SELECT CustomerID, AccountNumber
FROM Sales.Customer_NoIndex
WHERE CustomerID = 11001

SELECT CustomerID, AccountNumber
FROM Sales.Customer_Index
WHERE CustomerID = 11001

--page read--
USE AdventureWorks;
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
select * from Person.Person;

--2--
select title, firstname, middlename, lastname, emailaddress
from person.contact;

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
select count(*) as total_employee from  HumanResources.Employee;

--9--
select sod.SalesOrderID, ps.BusinessEntityID, ps.FirstName, ps.MiddleName, ps.LastName, count(ps.BusinessEntityID) as amount_salesorder
from Sales.SalesOrderDetail sod
join Sales.SalesOrderHeader soh
on sod.SalesOrderID = soh.SalesOrderID
join Sales.Customer ct
on ct.CustomerID = soh.CustomerID
join Person.Person ps
on ps.BusinessEntityID = ct.PersonID
group by sod.SalesOrderID, ps.BusinessEntityID, ps.FirstName, ps.MiddleName, ps.LastName
having count(ps.BusinessEntityID) >= 10
order by sod.SalesOrderID;

--10--
select * from Production.Product pd
left join Sales.SalesOrderDetail sod
on pd.ProductID = sod.ProductID
where sod.ProductID IS NULL

--11--
--12--
drop index sod_productid_inx on Sales.SalesOrderDetail;
create index sod_productid_inx on Sales.SalesOrderDetail(ProductID);
drop index pd_product_inx on Production.Product;
create index pd_product_inx on Production.Product(ProductID);
--test code index --
select pd.Name, sod.ProductID
from Production.Product pd
left join Sales.SalesOrderDetail sod
on pd.ProductID = sod.ProductID
where sod.ProductID IS NULL;

--13--
--cau 1--
with abc as(
	select pd.Name, pd.ProductID 
	from Production.Product pd
	left join Sales.SalesOrderDetail sod
	on pd.ProductID = sod.ProductID
	where sod.ProductID IS NULL
	)
select Name
from abc
where ProductID > 100

--cau 2--
with abc as(
	select pd.Name, pd.ProductID 
	from Production.Product pd
	left join Sales.SalesOrderDetail sod
	on pd.ProductID = sod.ProductID
	where sod.ProductID IS NULL
	)
select Name
from abc
where Name like '%cran%'

--cau 3--
with abc as(
	select pd.Name, pd.ProductID 
	from Production.Product pd
	left join Sales.SalesOrderDetail sod
	on pd.ProductID = sod.ProductID
	where sod.ProductID IS NULL
	)
select Name
from abc
where
	(
		Name like '%cran%'
		and
		ProductID > 318
	)
