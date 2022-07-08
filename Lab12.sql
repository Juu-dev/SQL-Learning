use dell_store;

----select table in database----
select * from customers;
select * from products;
select * from orderlines;
--------------------------------



--1--
create index Customers_index_1 on dell_store.dbo.Customers(city);

select customerid, firstname, lastname, city 
from dell_store.dbo.Customers
where city = 'Canada';

--2--
create index Customers_index_2 on dell_store.dbo.orders(netamount);

CREATE PROCEDURE net_order_more
(
	@min_price As decimal
)
AS
BEGIN
    SELECT *
	FROM 
		dell_store.dbo.orders
	where 
		netamount > @min_price
END;

--3--

create index Customers_index_3 on dell_store.dbo.orders(totalamount);

CREATE PROCEDURE total_order_more
(
	@min_price As decimal
)
AS
BEGIN
    SELECT *
	FROM 
		dell_store.dbo.orders
	where 
		totalamount > @min_price
END;

--4--
create index Customers_index_4 on dell_store.dbo.orderlines;

select pd.title, ol.quantity
from dell_store.dbo.orderlines ol
join dell_store.dbo.products pd
on ol.prod_id = pd.prod_id;

--5--
create index Customers_index_5 on dell_store.dbo.orders;

select ct.customerid, ct.firstname, ct.lastname
from dell_store.dbo.orders od
join dell_store.dbo.customers ct
on od.customerid = ct.customerid;

--6--
create index Customers_index_6 on dell_store.dbo.products(prod_id);

select pd.category, pd.prod_id, pd.title
from dell_store.dbo.orderlines odl
left join dell_store.dbo.products pd
on odl.prod_id = pd.prod_id
where pd.prod_id IS NULL;

--7--
create index Customers_index_7 on dell_store.dbo.customers(customerid);

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
create index Customers_index_8 on dell_store.dbo.orderlines;

select pd.title, sum(quantity) as totalquantity
from dell_store.dbo.products pd
join dell_store.dbo.orderlines odl
on pd.prod_id = odl.prod_id
group by pd.prod_id, title;