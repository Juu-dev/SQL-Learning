--extension CSDL
delete from Production.dbo.categories;
delete from Production.dbo.products;
delete from Production.dbo.brands;

select * from Production.dbo.categories;
select * from Production.dbo.products;
select * from Production.dbo.brands;

drop table Production.dbo.products;
drop table Production.dbo.categories;
drop table Production.dbo.brands;

--a--
create database Production;

create table Production.dbo.categories 
(
	category_id char(4) primary key,
	category_name varchar(20)
);

create table Production.dbo.brands
(
	brand_id char(4) primary key,
	brand_name varchar(20)
);

create table Production.dbo.products 
(
	product_id char(4) primary key,
	product_name varchar(20),
	brand_id char(4),
	category_id char(4),
	model_year date,
	list_price int,
	foreign key (brand_id) references Production.dbo.brands(brand_id),
	foreign key (category_id) references Production.dbo.categories(category_id),
);

insert into Production.dbo.brands values
('BD01','Chanel'),
('BD02','Gucci'),
('BD03','Dior'),
('BD04','Burberry'),
('BD05','Dolce & Gabbana');

insert into Production.dbo.categories values
('CG01', 'Sport'),
('CG02', 'Electronice device'),
('CG03', 'Clothes'),
('CG04', 'Software'),
('CG05', 'Food'),
('CG06', 'Perfume'),
('CG07', 'Clock'),
('CG08', 'Glasses'),
('CG09', 'Hand Bag'),
('CG10', 'Dinks');

insert into Production.dbo.products values
('PD01', 'Badminton racket Yon', 'BD01', 'CG01', '2019-1-1', '6000000'),
('PD02', 'Golf clubs', 'BD02', 'CG01', '2020-2-2', '9000000'),
('PD03', 'Telivision SONY 2021', 'BD03', 'CG02', '2021-3-3', '15000000'),
('PD04', 'Laptop MSI Thin GF63', 'BD04', 'CG02', '2020-4-4', '30000000'),
('PD05', 'Coat Hoodle Special', 'BD05', 'CG03', '2018-5-5', '300000'),
('PD06', 'T-Shirt Butterfly', 'BD01', 'CG03', '2015-6-6', '500000'),
('PD07', 'UNIQLO', 'BD02', 'CG04', '2018-7-7', '995000'),
('PD08', 'Super Caculator', 'BD03', 'CG04', '2000-8-8', '100000'),
('PD09', 'Pizza HUST', 'BD04', 'CG05', '2022-6-10', '200000'),
('PD10', 'Chicken rice', 'BD05', 'CG05', '2022-6-10', '30000'),
('PD11', 'Chanel Coco iselle', 'BD01', 'CG06', '2021-9-9', '13000000'),
('PD12', 'Dior Miss Dior', 'BD02', 'CG06', '2020-10-10', '15000000'),
('PD13', 'Rolex Swiss Made', 'BD03', 'CG07', '2019-11-11', '100000000'),
('PD14', 'Calvin Klein', 'BD04', 'CG07', '2018-12-12', '80000000'),
('PD15', 'Warby Parker', 'BD05', 'CG08', '2017-1-2', '18000000'),
('PD16', 'American Optical', 'BD01', 'CG08', '2016-2-3', '8000000'),
('PD17', 'Michael Kors', 'BD02', 'CG09', '2020-3-4', '30000000'),
('PD18', 'Balenciaga', 'BD03', 'CG09', '2021-4-5', '50000000'),
('PD19', 'Cocacola', 'BD04', 'CG10', '2022-5-6', '30000'),
('PD20', 'Orange juice', 'BD05', 'CG10', '2022-6-7', '20000');

--b--
create view v_product
as
select pd.product_id, pd.product_name, pd.model_year, pd.list_price, bd.brand_name, cg.category_name
from Production.dbo.products pd
join Production.dbo.categories cg on pd.category_id = cg.category_id
join Production.dbo.brands bd on pd.brand_id = bd.brand_id;

select *
from v_product
where year(model_year) = 2022;

create clustered index pd_pd_name_cls_index
on Production.dbo.products(product_name);

create nonclustered index pd_pd_name_ncls_index
on Production.dbo.products(product_name);

--c--
begin transaction Production_Week12;
save transaction SP01;

update Production.dbo.products
set list_price = 100000 + (select list_price
							from Production.dbo.products
							where product_name = 'UNIQLO')
where product_name = 'UNIQLO';
save transaction SP02;
rollback transaction SP01;