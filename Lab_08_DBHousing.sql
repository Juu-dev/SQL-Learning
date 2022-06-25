
create database DBHousing;

select * from DBHousing.dbo.Customers
select * from DBHousing.dbo.Houses
select * from DBHousing.dbo.Contracts

delete from DBHousing.dbo.Customers
delete from DBHousing.dbo.Houses
delete from DBHousing.dbo.Contracts

drop table DBHousing.dbo.Contracts
drop table DBHousing.dbo.Customers
drop table DBHousing.dbo.Houses


--a---
create table DBHousing.dbo.Customers (
	MaKH char(4) primary key,
	FullName nvarchar(50),
	PhoneNumber nvarchar(20),
	Orginazation nvarchar(30)
);

create table DBHousing.dbo.Houses (
	MaN char(4) primary key,
	AddressH nvarchar(50),
	RentCost int,
	HostName nvarchar(50)
);

create table DBHousing.dbo.Contracts (
	MaN char(4),
	MaKH char(4),
	StrartDay date,
	EndDay date,
	foreign key (MaKH) references DBHousing.dbo.Customers(MaKH),
	foreign key (MaN) references DBHousing.dbo.Houses(MaN)
);

insert into DBHousing.dbo.Customers values
('KH01',N'Nguyễn Văn A','0900000001',N'Công Ty A'),
('KH02',N'Nguyễn Văn B','0900000002',N'Công Ty B'),
('KH03',N'Nguyễn Văn C','0900000003',N'Công Ty C'),
('KH04',N'Nguyễn Văn D','0900000004',N'Công Ty D'),
('KH05',N'Nguyễn Văn E','0900000005',N'Công Ty A'),
('KH06',N'Nguyễn Văn F','0900000006',N'Công Ty A'),
('KH07',N'Nguyễn Văn G','0900000007',N'Công Ty B'),
('KH08',N'Nguyễn Văn H','0900000008',N'Công Ty B'),
('KH09',N'Nguyễn Văn I','0900000009',N'Công Ty C'),
('KH10',N'Nguyễn Văn K','0900000010',N'Công Ty D'),
('KH11',N'Nguyễn Văn L','0900000011',N'Công Ty E'),
('KH12',N'Nguyễn Văn M','0900000012',N'Công Ty E'),
('KH13',N'Nguyễn Văn N','0900000013',N'Công Ty D'),
('KH14',N'Nguyễn Văn O','0900000014',N'Công Ty D'),
('KH15',N'Nguyễn Văn P','0900000015',N'Công Ty C');

insert into DBHousing.dbo.Houses values
('N01',N'Hà Tây',9000000,N'Nông Văn Dền'),
('N02',N'Hà Đông',15000000,N'Phạm Văn B'),
('N03',N'Nguyễn Trãi',14500000,N'Nông Văn Dền'),
('N04',N'Bách Khoa',7000000,N'Phạm Văn B'),
('N05',N'Trần Khát Trân',10000000,N'Phạm Văn E'),
('N06',N'Giải Phóng',9000000,N'Phạm Văn E'),
('N07',N'Tây Sơn',35000000,N'Phạm Văn G'),
('N08',N'Hai Bà Chưng',12000000,N'Phạm Văn H'),
('N09',N'Cát Linh',11000000,N'Phạm Văn I'),
('N10',N'Chùa Bộc',5000000,N'Phạm Văn I');

insert into DBHousing.dbo.Contracts values
('N01','KH01','1990-1-1','1995-1-1'),
('N03','KH03','1991-2-2','1996-2-2'),
('N05','KH03','1992-3-3','1997-3-3'),
('N05','KH05','1993-4-4','1998-4-4'),
('N06','KH06','1994-5-5','1999-5-5'),
('N07','KH07','1995-6-6','2000-6-6'),
('N07','KH08','1996-7-7','2001-7-7'),
('N09','KH08','1997-8-8','2002-8-8'),
('N09','KH10','1998-9-9','2003-9-9'),
('N10','KH10','1999-10-10','2004-10-10');


--b--
select AddressH, HostName
from DBHousing.dbo.Houses ho
where ho.RentCost < 10000000

select cu.MaKH, cu.FullName, cu.Orginazation
from DBHousing.dbo.Customers cu
join DBHousing.dbo.Contracts co on cu.MaKH = co.MaKH
join DBHousing.dbo.Houses ho on ho.MaN = co.MaN
where ho.HostName = N'Nông Văn Dền'

select ho.MaN, ho.AddressH, ho.RentCost, ho.HostName
from DBHousing.dbo.Contracts co
right join DBHousing.dbo.Houses ho on ho.MaN = co.MaN
where co.MaKH IS NULL

select max(ho.RentCost) as MostHighCost
from DBHousing.dbo.Contracts co
join DBHousing.dbo.Houses ho on ho.MaN = co.MaN


--c--
create index Idx_Customer_index_Orginazation 
on DBHousing.dbo.Customers(Orginazation);

select MaKH, FullName, PhoneNumber, Orginazation
from DBHousing.dbo.Customers cu
where cu.Orginazation = N'Công Ty A'

create index Idx_Houses_index_MaN 
on DBHousing.dbo.Houses(MaN);
create index Idx_Contracts_index_MaN 
on DBHousing.dbo.Contracts(MaN);

select ho.HostName, count(ho.HostName) as TotalHouse
from DBHousing.dbo.Houses ho
left join DBHousing.dbo.Contracts co on ho.MaN = co.MaN
group by ho.HostName

--d--
create procedure pc_DBHousing_RentCost
(
	@compar_cost as decimal = 0
)
as
begin
	select co.MaN, co.MaKH, co.StrartDay, co.EndDay
	from DBHousing.dbo.Contracts co
	join DBHousing.dbo.Houses ho on co.MaN = ho.MaN
	where ho.RentCost > @compar_cost
end;


create procedure pc_DBHousing_Sum_RentCost_Customer
(
	@compar_cost as decimal = 0
)
as
begin
	select cu.FullName, cu.MaKH, cu.Orginazation, cu.PhoneNumber
	from DBHousing.dbo.Contracts co
	join DBHousing.dbo.Houses ho on co.MaN = ho.MaN
	join DBHousing.dbo.Customers cu on cu.MaKH = co.MaKH
	group by cu.MaKH, cu.FullName, cu.Orginazation, cu.PhoneNumber
	having sum(ho.RentCost) > @compar_cost
end;

--extension of d--
drop proc pc_DBHousing_RentCost;
drop proc pc_DBHousing_Sum_RentCost_Customer;

pc_DBHousing_RentCost 10000;
pc_DBHousing_Sum_RentCost_Customer 35000000;

