--Laboratory Exercise--
--A--
create database QLKH_DB;

select * from QLKH_DB.dbo.GiangVien;
select * from QLKH_DB.dbo.DeTai;
select * from QLKH_DB.dbo.ThamGia;

drop table QLKH_DB.dbo.ThamGia;
drop table QLKH_DB.dbo.GiangVien;
drop table QLKH_DB.dbo.DeTai;

create table QLKH_DB.dbo.GiangVien
(
	GV# char(4) primary key,
	HoTen nvarchar(30),
	DiaChi nvarchar(50),
	NgaySinh date
);

create table QLKH_DB.dbo.DeTai
(
	DT# char(4) primary key,
	TenDT nvarchar(40),
	Cap nvarchar(30),
	KinhPhi int
);

create table QLKH_DB.dbo.ThamGia
(
	GV# char(4),
	DT# char(4),
	SoGio int,
	primary key (GV#, DT#),
	constraint fk_tg_gv foreign key (GV#) references GiangVien(GV#),
	constraint fk_tg_dt foreign key (DT#) references DeTai(DT#)
);

insert into QLKH_DB.dbo.GiangVien values
('GV01', N'Vũ Tuyết Trinh', N'Hoàng Mai, Hà Nội', '1975-10-10'),
('GV02', N'Nguyễn Nhật Quang', N'Hai Bà Trưng, Hà Nội', '1976-11-03'),
('GV03', N'Trần Đức Khánh', N'Đống Đa, Hà Nội', '1977-06-04'),
('GV04', N'Nguyễn Hồng Phương', N'Tây Hồ, Hà Nội', '1983-12-10'),
('GV05', N'Lê Thanh Hương', N'Hai Bà Trưng', '1976-10-10');

insert into QLKH_DB.dbo.DeTai values
('DT01', N'Tính toán lưới', N'Nhà nước', 700),
('DT02', N'Phát hiện tri thức', N'Bộ', 300),
('DT03', N'Phân loại văn bản', N'Bộ', 270),
('DT04', N'Dịch tử động Anh Việt', N'Trường', 30);

insert into QLKH_DB.dbo.ThamGia values
('GV01','DT01',100),
('GV01','DT02',80),
('GV01','DT03',80),
('GV02','DT01',120),
('GV02','DT03',140),
('GV03','DT03',150),
('GV04','DT04',180);

--B--
--Query cmd--
--1--
select *
from QLKH_DB.dbo.GiangVien gv
where gv.DiaChi like N'%Hai Bà Trưng%'
order by gv.HoTen DESC;

--2--
select gv.HoTen, gv.DiaChi, gv.NgaySinh
from QLKH_DB.dbo.GiangVien gv
join QLKH_DB.dbo.ThamGia tg
on gv.GV# = tg.GV#
join QLKH_DB.dbo.DeTai dt
on dt.DT# = tg.DT#
where dt.TenDT = N'Tính toán lưới';

--3--
select gv.HoTen, gv.DiaChi, gv.NgaySinh
from QLKH_DB.dbo.GiangVien gv
join QLKH_DB.dbo.ThamGia tg
on gv.GV# = tg.GV#
join QLKH_DB.dbo.DeTai dt
on dt.DT# = tg.DT#
where dt.TenDT = N'Phân loại văn bản' or dt.TenDT = N'Dịch tự động Anh Việt';

--4--
select gv.HoTen, gv.DiaChi, gv.NgaySinh
from QLKH_DB.dbo.GiangVien gv
join QLKH_DB.dbo.ThamGia tg
on gv.GV# = tg.GV#
group by gv.GV#, gv.HoTen, gv.DiaChi, gv.NgaySinh
having count(tg.GV#) > 1

--5--
select gv.HoTen
from QLKH_DB.dbo.GiangVien gv
join QLKH_DB.dbo.ThamGia tg
on gv.GV# = tg.GV#
group by gv.GV#, gv.HoTen
having count(gv.GV#) = (select max(nber_dt)
						from (select count(tg.GV#) as nber_dt
								from QLKH_DB.dbo.ThamGia tg
								group by tg.GV#) 
						as nber_dt_tb);

--6--
select dt.TenDT
from QLKH_DB.dbo.DeTai dt
where dt.KinhPhi = (select min(KinhPhi)
					from QLKH_DB.dbo.DeTai);

--7--
select gv.HoTen, gv.NgaySinh, dt.TenDT
from QLKH_DB.dbo.GiangVien gv
join QLKH_DB.dbo.ThamGia tg
on gv.GV# = tg.GV#
join QLKH_DB.dbo.DeTai dt
on dt.DT# = tg.DT#
where gv.DiaChi like N'%Tây Hồ%'

--8--
select gv.HoTen, gv.NgaySinh, dt.TenDT
from QLKH_DB.dbo.GiangVien gv
join QLKH_DB.dbo.ThamGia tg
on gv.GV# = tg.GV#
join QLKH_DB.dbo.DeTai dt
on dt.DT# = tg.DT#
where dt.TenDT = N'Phân loại văn bản'
	and (year(gv.NgaySinh) < 1980);

--9--
select gv.GV#, gv.HoTen, 
(
	case
		when sum(tg.SoGio) IS NULL then 0
		else sum(tg.SoGio)
	end
) as tongsogio
from QLKH_DB.dbo.GiangVien gv
left join QLKH_DB.dbo.ThamGia tg
on gv.GV# = tg.GV#
group by gv.GV#, gv.HoTen;

--10--
insert into QLKH_DB.dbo.GiangVien values
('GV06', N'Ngô Tuấn Phong', N'Đống Đa, Hà Nội', '1986-09-08');

--11--
update QLKH_DB.dbo.GiangVien 
set DiaChi = N'Tây Hồ, Hà Nội'
where HoTen = N'Vũ Tuyết Trinh';

--12--
delete from  QLKH_DB.dbo.ThamGia
where GV# = 'GV02';
delete from  QLKH_DB.dbo.GiangVien
where GV# = 'GV02';


--C--
-- Sao lưu và phục hồi CSDL
--1. Sao lưu
--SYNTAX: backup database Tên_Cơ_Sở_Dữ_Liệu to disk = 'đường dẫn\Tên_file.bak'
--Error đã xảy ra: File bak nằm trong thư mục thuộc user ko thể truy cập
backup database QLKH_DB to disk = 'E:\SQL_SERVER\Backup_DTB\QLKH_DB.bak';
--2. Phục hồi
--SYNTAX: restore database Tên_Cơ_Sở_Dữ_Liệu from disk = 'Đường dẫn\Tên_File.bak' [With NoRecovery]
--Error đã xảy ra: Khi restore vào CSDL mới mà chưa xóa CSDL cũ thì sẽ gây xung đột quyền sở hữu, có 2 cách giải quyết, 1 là xóa CSDL cũ, 2 là xóa tên CSDL mới và thay bằng tên cũ
restore database QLKH_DB from disk = 'E:\SQL_SERVER\Backup_DTB\QLKH_DB.bak';

--D--
--tao tai khoan dang nhap--
--Ngo Tuan Phong--
Create login PhongNT with password = 'phong123';
use QLKH_DB;
create user PhongNT for login PhongNT;
--Nguyen Hong Phuong--
Create login PhuongNH with password = 'phuong123';
use QLKH_DB;
create user PhuongNH for login PhuongNH;
--Cap Quyen cho user--
grant select on QLKH_DB.dbo.GiangVien to PhongNT;
grant select on QLKH_DB.dbo.ThamGia to PhongNT;
grant create table to PhuongNH;
grant create view to PhuongNH;
--Tao nhom quyen gom 2 giang vien Vu Tuyet Trinh va Tran Duc Khanh--
--Tao tai khoan dang nhap cho Vu Tuyet Trinh va Tran Duc Khanh--
create login TrinhVT with password = 'Trinh123';
create login KhanhTD with password = 'Khanh123';
use QLKH_DB;
create user TrinhVT;
create user KhanhTD;
--Tao nhom quyen--
create role Trinh_Khanh;
alter role Trinh_Khanh add member TrinhVT;
alter role Trinh_Khanh add member KhanhTD;
--Cap quyen cho nhom quyen--
grant all to Trinh_Khanh;

