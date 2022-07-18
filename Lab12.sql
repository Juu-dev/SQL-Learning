use dell_store;

----select table in database----
select * from dell_store.dbo.categories;
select * from dell_store.dbo.cust_hist;
select * from dell_store.dbo.customers;
select * from dell_store.dbo.inventory;
select * from dell_store.dbo.orderlines;
select * from dell_store.dbo.orders;
select * from dell_store.dbo.products;
select * from dell_store.dbo.reorder;
--------------------------------

--Vo hieu hoa index--
alter index customers_pkey on dell_store.dbo.Customers rebuild;
---------------------

drop index customers_pkey on dell_store.dbo.Customers;

--1--
--Xoa Index--
drop index Customers_index_1 on dell_store.dbo.Customers;
--Tao Index--
create nonclustered index Customers_index_1 on dell_store.dbo.Customers(country, firstname, lastname);
--Select Query--
select customerid, firstname, lastname, country
from dell_store.dbo.Customers
where country = 'Canada';

--2--
--Xoa Index--
drop index  Customers_index_2 on dell_store.dbo.orders(totalamount);
--Tao Index--
create index Customers_index_2 on dell_store.dbo.orders(totalamount);

--Xoa Procedure--
DROP PROCEDURE net_order_more;
--Tao Procedure--
CREATE PROCEDURE net_order_more
(
	@min_price As decimal
)
AS
BEGIN
    SELECT totalamount
	FROM 
		dell_store.dbo.orders
	where 
		totalamount > @min_price
END;
--Test procedure--
exec net_order_more 432;

--3--
--Xoa Index--
drop index Customers_index_3 on dell_store.dbo.orders;
--Tao Index--
create index Customers_index_3 on dell_store.dbo.orders(totalamount);

--Xoa Procedure--
DROP PROCEDURE total_order_more;
--Tao Procedure--
CREATE PROCEDURE total_order_more
(
	@min_price As decimal
)
AS
BEGIN
    select od.customerid, ct.firstname, ct.lastname, sum(totalamount) as totalamount_orders
	from dell_store.dbo.orders od
	join dell_store.dbo.customers ct
	on od.customerid = ct.customerid
	group by od.customerid, ct.firstname, ct.lastname
	having sum(totalamount) > @min_price;
END;
--Test procedure--
exec total_order_more 100;


--4--
--Xoa Index--
drop index  Customers_index_4 on dell_store.dbo.orderlines;
drop index  Customers_index_4_1 on dell_store.dbo.products;
--Tao Index--
create index Customers_index_4 on dell_store.dbo.orderlines(quantity);
create index Customers_index_4_1 on dell_store.dbo.products(title);
--Select Query
select pd.title, ol.quantity
from dell_store.dbo.orderlines ol
join dell_store.dbo.products pd
on ol.prod_id = pd.prod_id;

--5--
--Xoa Index--
drop index  Customers_index_5 on dell_store.dbo.customers;
--Tao Index--
create index Customers_index_5 on dell_store.dbo.customers(customerid, firstname, lastname);
--Select Query--
select ct.customerid, ct.firstname, ct.lastname
from dell_store.dbo.orders od
join dell_store.dbo.customers ct
on od.customerid = ct.customerid;

--6--
--Xoa Index--
drop index  Customers_index_6 on dell_store.dbo.products;
--Tao Index--
create index Customers_index_6 on dell_store.dbo.products(prod_id, title, category);
--Select Query--
select pd.category, pd.prod_id, pd.title
from dell_store.dbo.orderlines odl
left join dell_store.dbo.products pd
on odl.prod_id = pd.prod_id
where pd.prod_id IS NULL;

--7--
--Xoa Index--
drop index  Customers_index_7 on dell_store.dbo.customers;
--Tao Index--
create index Customers_index_7 on dell_store.dbo.customers(customerid, firstname, lastname, city);
--Select Query--
select ct.customerid, ct.firstname, ct.lastname, ct.city,
(
	CASE sum(totalamount)
		WHEN NULL Then 0
		ELSE sum(totalamount)
	END
) as total
from dell_store.dbo.customers ct
left join dell_store.dbo.orders od
on ct.customerid = od.customerid
group by ct.customerid, ct.firstname, ct.lastname, ct.city;

--8--
--Xoa Index--
drop index  Customers_index_8 on dell_store.dbo.products;
--Tao Index--
create index Customers_index_8 on dell_store.dbo.products(title);
--Select Query--
select pd.title, sum(quantity) as totalquantity
from dell_store.dbo.products pd
join dell_store.dbo.orderlines odl
on pd.prod_id = odl.prod_id
group by pd.prod_id, title;
