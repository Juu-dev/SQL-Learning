--Pham Minh Thong--
--20205029--
--Viet-Nhat-02--

--Tạo cơ sở dữ liệu QLKH
create database QLKH;

-- tạo bảng giảng viên
create table QLKH.dbo.Giangvien
(
	"GV#" char(5) primary key,
	Hoten nvarchar(30),
	NamSinh int,
	DiaChi nvarchar(50)
);

-- Tạo bảng Đề tài
create table QLKH.dbo.Detai
(
	"DT#" char(4) primary key,
	TenDT nvarchar(50),
	TheLoai nvarchar(20)
);

-- Tạo bảng Sinh viên
create table QLKH.dbo.Sinhvien
(
	"SV#" char(4) primary key,
	TenSV nvarchar(30),
	NgaySinh date,
	QueQuan nvarchar(20),
	Lop nvarchar(20)
);

-- Tạo bảng Hướng dẫn
create table QLKH.dbo.Huongdan
(
	"GV#" char(5),
	"DT#" char(4),
	"SV#" char(4),
	NamThucHien int,
	KetQua float(2),
	foreign key ("GV#") references QLKH.dbo.GiangVien("GV#"),
	foreign key ("SV#") references QLKH.dbo.Sinhvien("SV#"),
	foreign key ("DT#") references QLKH.dbo.Detai("DT#")
);

--Insert dữ liệu vào 4 bảng đã tạo
insert into QLKH.dbo.Giangvien values 
('GV001', N'Nguyen Van A','1967',N'Hà Đông Hà Nội'),
('GV002', N'Nguyen Van B','1967',N'Hà Đông Hà Nội'),
('GV003', N'Nguyen Van C','1967',N'Hà Đông Hà Nội'),
('GV004', N'Nguyen Van D','1967',N'Hà Đông Hà Nội'),
('GV005', N'Nguyen Van E','1967',N'Hà Đông Hà Nội'),
('GV006', N'Nguyen Van F','1967',N'Hà Đông Hà Nội'),
('GV007', N'Nguyen Van G','1967',N'Hà Đông Hà Nội'),
('GV008', N'Nguyen Van H','1967',N'Hà Đông Hà Nội'),
('GV009', N'Nguyen Van I','1967',N'Hà Đông Hà Nội'),
('GV010', N'Nguyen Van K','1967',N'Hà Đông Hà Nội'),
('GV012', N'Nguyen Van A','1967',N'Hà Đông Hà Nội');

insert into QLKH.dbo.Detai values 
('DT01',N'Phần mềm codelearn',N'Ứng dụng'),
('DT02',N'Lập trình đa nền tảng',N'Ứng dụng'),
('DT03',N'Phương trình vi phân',N'Toán học'),
('DT04',N'Con lạc đà bên sông',N'Văn học'),
('DT05',N'Đường Elip huyền ảo',N'Toán học'),
('DT06',N'Kẻ độc quyền tài ba Hitler',N'Chính trị'),
('DT07',N'Sự sinh sôi của nấm mốc',N'Sinh học'),
('DT08',N'Cách trị bệnh ung thư',N'Y học'),
('DT09',N'Cách tránh xa bệnh tật',N'Y học'),
('DT10',N'Giọng ca truyền cảm nhất',N'Âm nhạc');

insert into QLKH.dbo.Sinhvien values 
('SV01',N'Nguyễn Xuân Dũng','1991-11-11',N'Hải Phòng', 'VN_01'),
('SV02',N'Phạm Văn A','1991-1-1',N'Hải Phòng', 'VN_02'),
('SV03',N'Phạm Văn B','1991-2-2',N'Ninh Bình', 'VN_03'),
('SV04',N'Phạm Văn C','1991-3-3',N'bắc Cạn', 'VN_04'),
('SV05',N'Nguyễn Văn Nam','1991-4-4',N'Bắc Giang', 'VN_05'),
('SV06',N'Phạm Văn E','1991-5-5',N'Bạc Liêu', 'VN_01'),
('SV07',N'Phạm Văn F','1991-6-5',N'Vĩnh phúc', 'VN_02'),
('SV08',N'Phạm Văn G','1991-7-5',N'Phú Thọ', 'VN_03'),
('SV09',N'Phạm Văn H','1991-8-7',N'Ninh Bình', 'VN_04'),
('SV10',N'Phạm Văn I','1991-6-7',N'Phú thọ', 'VN_05'),
('SV11',N'Phạm Văn K','1991-5-7',N'Vĩnh Long', 'VN_01'),
('SV12',N'Phạm Văn L','1991-9-7',N'Tp.Hồ chí minh', 'VN_02'),
('SV13',N'Phạm Văn M','1991-6-2',N'Nha Trang', 'VN_03'),
('SV14',N'Phạm Văn N','1991-1-3',N'Nam Định', 'VN_04'),
('SV15',N'Phạm Văn E','1991-9-1',N'Bắc Ninh', 'VN_05');

insert into QLKH.dbo.Huongdan values 
('GV001','DT05','SV01','2020', '8'),
('GV012','DT04','SV02','2021', '9'),
('GV002','DT03','SV03','2018', '10'),
('GV003','DT02','SV04','2020', '7'),
('GV012','DT01','SV05','2019', '6'),
('GV001','DT01','SV06','2018', '5'),
('GV006','DT09','SV07','2019', '7.5'),
('GV008','DT08','SV08','2021', '8'),
('GV006','DT07','SV09','2022', '9.5'),
('GV002','DT06','SV10','2019', '10'),
('GV008','DT05','SV11','2020', '8'),
('GV005','DT04','SV12','2021', '8'),
('GV010','DT03','SV13','2022', '9'),
('GV002','DT02','SV14','2019', '10'),
('GV010','DT01','SV15','2021', '8');

--Cau 2
--Đưa ra thông tin của giảng viên GV001
Select * 
from QLKH.dbo.Giangvien
where "GV#" = 'GV001';

-- Số đề tài của Thể loại ứng dụng
Select count(*) AS sodetaiungdung
from QLKH.dbo.Detai
where TheLoai = N'Ứng dụng'

-- In ra số sinh viên được hướng dẫn bởi GV012 quê ở hải phòng
select count(*) sosinhvien
from QLKH.dbo.Huongdan hd
join QLKH.dbo.Sinhvien sv on sv."SV#" = hd."SV#"
where hd.GV# = 'GV012' and sv.QueQuan = N'Hải Phòng'

-- In ra đề tài rỗng
select dt.TenDT
from QLKH.dbo.Huongdan hd
 right join QLKH.dbo.Detai dt on dt.DT# = hd.DT#
where hd.SV# IS NULL

-- Update cho sinh vien sai dữ liệu
UPDATE QLKH.dbo.Sinhvien
SET NgaySinh = '1991-11-12'
WHERE TenSV = N'Nguyễn Xuân Dũng' and QueQuan = N'Hải Phòng'

DELETE FROM QLKH.dbo.Huongdan
WHERE SV# = (select SV# from QLKH.dbo.Sinhvien 
			WHERE TenSV = N'Nguyễn Văn Nam' and QueQuan = N'Bắc Giang');
DELETE FROM QLKH.dbo.Sinhvien
WHERE TenSV = N'Nguyễn Văn Nam' and QueQuan = N'Bắc Giang'

--Tạo View cho giảng viên và đề tài
CREATE VIEW Gv_dt_view
AS
SELECT
    gv.Hoten, dt.TenDT, dt.TheLoai, hd.NamThucHien
FROM
    QLKH.dbo.Giangvien gv
INNER JOIN QLKH.dbo.Huongdan hd 
    ON gv.GV# = hd.GV#
INNER JOIN QLKH.dbo.Detai dt 
    ON dt.DT# = hd.DT#;

select TenDT, TheLoai, NamThucHien
from Gv_dt_view
where NamThucHien = '2022';

-- Tạo index cho view
ALTER VIEW Gv_dt_view 
WITH SCHEMABINDING 
AS
SELECT
    gv.Hoten, dt.TenDT, dt.TheLoai, hd.NamThucHien
FROM
    QLKH.dbo.Giangvien gv
INNER JOIN QLKH.dbo.Huongdan hd 
    ON gv.GV# = hd.GV#
INNER JOIN QLKH.dbo.Detai dt 
    ON dt.DT# = hd.DT#;

CREATE UNIQUE CLUSTERED INDEX Gv_dt_view_index
ON Gv_dt_view(NamThucHien);

CREATE NONCLUSTERED INDEX Gv_dt_view_non_index
ON Gv_dt_view(NamThucHien);


--cau 4
--ý a
--Tạo quyền cho giáo viên Nguyễn Văn Thủy
create login ThuyNV 
with password = 'thuy123';
use QLKH
create user ThuyNV for login ThuyNV
grant select on QLKH.dbo.Giangvien to ThuyNV;
grant select on QLKH.dbo.Huongdan to ThuyNV;

--- tạo quyền cho giáo viên Trần Lâm Quân
create login QuanTL 
with password = 'quan123';
use QLKH
create user QuanTL for login QuanTL;
grant create table to QuanTL;
grant create view to QuanTL;

--ý b
---Tao nhóm quyền Duy_Cuong và thêm mọi quyền cho nhóm
create role Duy_Cuong;
use QLKH;
grant all to Duy_Cuong;

----Them user nguyễn duy tiến vào nhóm----
create login NDTien 
with password = 'Tien123';
use QLKH
create user NDTien for login NDTien;
Sp_addRoleMember 'Duy_Cuong', 'NDTien';

----Them user Pham Viet Cuong vao nhom---
create login PVCuong 
with password = 'Cuong123';
use QLKH
create user PVCuong for login PVCuong;
Sp_addRoleMember 'Duy_Cuong', 'PVCuong';