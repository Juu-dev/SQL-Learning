-- Date: 29.07.'2015
--Class ID: IT3209
--Student ID: 20205029
--Student Name: Pham Minh Thong
--Source File: PhamMinhThong_20205029_IT3209.sql


--xoa database QLKH_CK
drop database QLKH_CK;

--Tạo cơ sở dữ liệu QLKH_CK
create database QLKH_CK;

--select drop table --
select * from QLKH_CK.dbo.MatHang;
select * from QLKH_CK.dbo.NhomMatHang;
select * from QLKH_CK.dbo.KhachHang;
select * from QLKH_CK.dbo.MuaHang;

drop table QLKH_CK.dbo.MuaHang;
drop table QLKH_CK.dbo.MatHang;
drop table QLKH_CK.dbo.NhomMatHang;
drop table QLKH_CK.dbo.KhachHang;


-- tạo bảng Mat Hang
create table QLKH_CK.dbo.MatHang
(
	MaMH int primary key,
	TenMH nvarchar(30),
	DonViTinh nvarchar(50),
	DonGia float(2),
	NgayNhap date,
	NhomHang int,
	SoLuongTonKho int

);

-- Tạo bảng Nhom Mat hang
create table QLKH_CK.dbo.NhomMatHang
(
	MaNhomMH int primary key,
	TenNhomMH nvarchar(50)
);

-- Tạo bảng Khach Hang
create table QLKH_CK.dbo.KhachHang
(
	MaKH int primary key,
	TenKH nvarchar(30),
	Diachi nvarchar(20),
	SoDT nvarchar(20),
	DiemThuong int
);

-- Tạo bảng Mua Hang
create table QLKH_CK.dbo.MuaHang
(
	MaMH int,
	MaKH int,
	NgayMua date,
	SoLuong int
	primary key (MaMH, MaKH, NgayMua),
	foreign key (MaMH) references QLKH_CK.dbo.MatHang(MaMH),
	foreign key (MaKH) references QLKH_CK.dbo.KhachHang(MaKH)
);

--Insert dữ liệu vào 4 bảng đã tạo
insert into QLKH_CK.dbo.MatHang values 
(1, N'Mat Hang A','VND', 1000.00,'2000-1-1', 1, 0),
(2, N'Mat Hang B','VND', 2000.00,'2000-1-2', 1, 100),
(3, N'Mat Hang C','VND', 3000.00,'2000-1-3', 2, 12),
(4, N'Mat Hang D','VND', 4000.00,'2000-1-4', 2, 83),
(5, N'Mat Hang E','VND', 5000.00,'2000-1-5', 3, 90),
(6, N'Mat Hang F','VND', 6000.00,'2000-1-6', 3, 81),
(7, N'Mat Hang G','VND', 7000.00,'2000-1-7', 4, 91),
(8, N'Mat Hang H','VND', 8000.00,'2000-1-8', 4, 11),
(9, N'Mat Hang I','VND', 9000.00,'2000-1-9', 5, 21),
(10, N'Mat Hang K','VND', 10000.00,'2000-1-10', 5, 38),
(11, N'Mat Hang L','VND', 11000.00,'2000-1-11', 6, 986);

insert into QLKH_CK.dbo.NhomMatHang values 
(1,N'Hàng điện tử'),
(2,N'Hàng gia dụng'),
(3,N'Nhom Mat Hang 3'),
(4,N'Nhom Mat Hang 4'),
(5,N'Nhom Mat Hang 5'),
(6,N'Nhom Mat Hang 6');

insert into QLKH_CK.dbo.KhachHang values 
(01,N'Nguyễn Xuân Dũng',N'Hải Phòng','0918598800', 100),
(02,N'Phạm Văn A',N'Hải Phòng', '0918598801', 101),
(03,N'Phạm Văn B',N'Ninh Bình', '0918598802',1001),
(04,N'Phạm Văn C',N'bắc Cạn', '0918598803',1004),
(05,N'Nguyễn Văn Nam',N'Bắc Giang','0918598804', 1005),
(06,N'Phạm Văn E',N'Bạc Liêu','0918598805', 1001),
(07,N'Phạm Văn F',N'Vĩnh phúc','0918598806', 1002),
(08,N'Phạm Văn G',N'Phú Thọ','0918598807', 1003),
(09,N'Phạm Văn H',N'Ninh Bình','0918598808', 1004),
(10,N'Phạm Văn I',N'Phú thọ', '0918598809',1005),
(11,N'Phạm Văn K',N'Vĩnh Long', '0918598810',1001),
(12,N'Phạm Văn L',N'Tp.Hồ chí minh','0918598811', 1002),
(13,N'Phạm Văn M',N'Nha Trang','0918598812', 1003),
(14,N'Phạm Văn N',N'Nam Định','0918598813', 1004),
(15,N'Phạm Văn E',N'Bắc Ninh', '0918598814',1005);

insert into QLKH_CK.dbo.MuaHang values 
(1,05,'2015-5-1', 8),
(4,04,'2015-5-2', 9),
(2,03,'2015-5-3', 10),
(3,02,'2015-5-4', 7),
(9,01,'2015-5-5', 6),
(1,01,'2015-5-6', 5),
(6,09,'2015-5-7', 7),
(8,08,'2015-5-8', 8),
(6,07,'2015-5-9', 9),
(2,06,'2015-5-10', 10),
(8,05,'2015-5-11',8),
(5,04,'2015-5-12', 8),
(1,03,'2015-5-28', 9),
(2,02,'2015-5-14', 10),
(10,01,'2015-5-15', 8);

--Query
--2--
--2_a--
select KH.TenKH, KH.Diachi 
from QLKH_CK.dbo.KhachHang KH
join QLKH_CK.dbo.MuaHang MH
on KH.MaKH = MH.MaKH
join QLKH_CK.dbo.MatHang MaH
on MH.MaMH = MaH.MaMH
join QLKH_CK.dbo.NhomMatHang NMH
on MaH.NhomHang = NMH.MaNhomMH
where ( NMH.TenNhomMH = N'Hàng điện tử'
		and
		MH.NgayMua <= '2015-5-30'
		and
		MH.NgayMua >= '2015-5-1'
		)

--2_b--
with BangDoanhThu As (
	select MaH.TenMH,(MH.SoLuong * MaH.DonGia) as DoanhThu, MaH.DonViTinh
	from QLKH_CK.dbo.MuaHang MH
	left join QLKH_CK.dbo.MatHang MaH
	on MH.MaMH = MaH.MaMH
),
BangDoanhThu_2 as (
	select TenMH, sum(DoanhThu) as tongdoanhthu
	from BangDoanhThu
	group by TenMH
)
select TenMH, tongdoanhthu from BangDoanhThu_2
where tongdoanhthu =  (select max(tongdoanhthu) from BangDoanhThu_2)


--2_c--
declare @soluong as int ;
set @soluong = (select sum(MH.SoLuong)
				from QLKH_CK.dbo.MuaHang MH
				join QLKH_CK.dbo.MatHang MaH
				on MH.MaMH = MaH.MaMH
				join QLKH_CK.dbo.NhomMatHang NMH
				on MaH.NhomHang = NMH.MaNhomMH
				where NMH.TenNhomMH = N'Hàng gia dụng'
				group by NMH.TenNhomMH);
select NMH.TenNhomMH,  (sum(MaH.SoLuongTonKho) + @soluong) as SoLuong
from QLKH_CK.dbo.NhomMatHang NMH
left join QLKH_CK.dbo.MatHang MaH
on NMH.MaNhomMH = MaH.NhomHang
where NMH.TenNhomMH = N'Hàng gia dụng'
group by NMH.TenNhomMH;

--2_d--
declare @tgth as float(2);
with GTHang as (
	select KH.TenKH, Kh.Diachi, KH.SoDT, sum(MaH.DonGia * MH.SoLuong) as giatrihang
	from QLKH_CK.dbo.KhachHang KH
	join QLKH_CK.dbo.MuaHang MH
	on KH.MaKH = MH.MaKH
	join QLKH_CK.dbo.MatHang MaH
	on MH.MaMH = MaH.MaMH
	join QLKH_CK.dbo.NhomMatHang NMH
	on MaH.NhomHang = NMH.MaNhomMH
	where (MH.NgayMua <= '2015-10-25'
			and
			MH.NgayMua >= '2015-5-1'
			)
	group by TenKH, Diachi, SoDT
)
select TenKH, Diachi, SoDT, (select max(giatrihang) from GTHang) as tongiatrihang
from GTHang
where giatrihang = (select max(giatrihang) from GTHang)

--3--
use QLKH_CK;
SET NUMERIC_ROUNDABORT OFF;
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT,
    QUOTED_IDENTIFIER, ANSI_NULLS ON;
drop view dbo.Info_MH;
CREATE VIEW dbo.Info_MH
WITH SCHEMABINDING
AS
select KH.TenKH, Kh.Diachi, KH.SoDT, MaH.TenMH, MaH.NgayNhap, MaH.DonGia ,MH.NgayMua
from dbo.KhachHang KH
join dbo.MuaHang MH
	on KH.MaKH = MH.MaKH
join dbo.MatHang MaH
	on MH.MaMH = MaH.MaMH;

--4--
select TenMH, NgayNhap, DonGia
from dbo.Info_MH
where year(NgayMua) = '2015'

--5--
select * from dbo.Info_MH;

CREATE UNIQUE CLUSTERED INDEX IDX_v1
ON Info_MH(TenKH, DiaChi, TenMH, NgayMua);
--tao index_2
CREATE NONCLUSTERED INDEX IDX_v2
ON Info_MH(TenKH, DiaChi, TenMH, NgayMua);
