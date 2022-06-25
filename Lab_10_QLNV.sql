create database QLNV;

--Check Table, Select, Drop
select * from QLNV.dbo.NhanVien;
select * from QLNV.dbo.PhongBan;
select * from QLNV.dbo.DiaDiem_PHG;
select * from QLNV.dbo.ThanNhan;
select * from QLNV.dbo.DeAn;
select * from QLNV.dbo.PhanCong;

drop table QLNV.dbo.NhanVien;
drop table QLNV.dbo.PhongBan;
drop table QLNV.dbo.DiaDiem_PHG;
drop table QLNV.dbo.ThanNhan;
drop table QLNV.dbo.DeAn;
drop table QLNV.dbo.PhanCong;
---

create table QLNV.dbo.NhanVien 
(
	HoNV varchar(30),
	TenLot varchar(20),
	Ten varchar(30),
	MaNV varchar(20),
	NgSinh date,
	DChi varchar(50) not null,
	Phai varchar(10),
	Luong int,
	Ma_NQL varchar(20), 
	PHG int
);

insert into QLNV.dbo.NhanVien values
('Dinh', 'Ba', 'Tien', '123456789', '1955-01-09', '731 Tran Hung Dao, Q1, TPHCM', 'Nam', 30000, '333445555', 5 ),
('Nguyen', 'Thanh', 'Tung', '333445555', '1945-12-08', '638 Nguyen Van Cu,Q5 , TPHCM', 'Nam', 40000, '888665555', 5 ),
('Bui', 'Thuy', 'Vu', '999887777', '1958-07-19', '332 Nguyen Thai Hoc, Q1, TPHCM', 'Nam', 25000, '987654321', 4 ),
('Le', 'Thi', 'Nhan', '987654321', '1931-06-20', '291 Ho Van Hue, QPN, TPHCM', 'Nu', 43000, '888665555', 4 ),
('Nguyen', 'Manh', 'Hung', '666884444', '1952-09-15', '975 Ba Ria, Vung Tau', 'Nam', 38000, '333445555', 5 ),
('Tran', 'Thanh', 'Tam', '453453453', '1962-07-31', '543 Mai Thi Luu, Q1, TPHCM', 'Nam', 25000, '333445555', 5 ),
('Tran', 'Hong', 'Quan', '987987987', '1959-03-29', '980 Le Hong Phong, Q10, TPHCM', 'Nam', 25000, '987654321', 4 ),
('Vuong', 'Ngoc', 'Quyen', '888665555', '1927-10-10', '450 Trung Vuong, Ha Noi', 'Nu', 55000,'' ,1 );

create table QLNV.dbo.PhongBan
(
	TenPHG varchar(20),
	MaPH varchar(20),
	TRPHG varchar(20),
	Ng_NhanChuc date
);

insert into QLNV.dbo.PhongBan values
( 'Nghien cuu', 5, '333445555', '1978-05-22' ),
( 'Dieu hanh', 4, '987987987', '1985-01-01' ),
( 'Quan ly', 1, '888665555', '1971-06-19' );

create table QLNV.dbo.DiaDiem_PHG
(
	MaPHG int,
	DiaDiem varchar(50)
);

insert into QLNV.dbo.DiaDiem_PHG values
( 1, 'TP HCM'),
( 4, 'HA NOI'),
( 5, 'VUNG TAU'),
( 5, 'NHA TRANG'),
( 5, 'TP HCM');

create table QLNV.dbo.ThanNhan
(
	Ma_NV varchar(20), 
	TenTN varchar(30), 
	Phai varchar(10), 
	NgSinh date, 
	QuanHe varchar(30)
);

insert into QLNV.dbo.ThanNhan values
( 333445555, 'Quang', 'Nu', '1976-04-05', 'Con gai' ),
( 333445555, 'Khang', 'Nam', '1973-10-25', 'Con trai' ),
( 333445555, 'Duong', 'Nu', '1948-05-03', 'Vo chong' ),
( 987654321, 'Dang', 'Nam', '1932-02-29', 'Vo chong' ),
( 123456789, 'Duy', 'Nam', '1978-01-01', 'Con trai' ),
( 123456789, 'Chau', 'Nu', '1978-12-31', 'Con gai' );

create table QLNV.dbo.DeAn
(
	TenDA varchar(40),
	MaDA int,
	DDiem_DA varchar(40),
	Phong int
);	

insert into QLNV.dbo.DeAn values
( 'San pham X', 1, 'VUNG TAU', 5 ),
( 'San pham Y', 2, 'NHA TRANG', 5 ),
( 'San pham Z', 3, 'TP HCM', 5 ),
( 'Tin hoc hoa', 10, 'HA NOI', 4 ),
( 'Cap quang', 20, 'TP HCM', 1 ),
( 'Dao tao', 30, 'HA NOI', 4 );

create table QLNV.dbo.PhanCong
(
	Ma_NV varchar(20),
	MaDA int,
	Thoigian varchar(20)
);

insert into QLNV.dbo.PhanCong values
( '123456789', 1, '32.5' ),
( '123456789', 2, '7.5' ),
( '666884444', 3, '40.0' ),
( '453453453', 1, '20.0' ),
( '453453453', 2, '20.0' ),
( '333445555', 3, '10.0' ),
( '333445555', 10, '10.0' ),
( '333445555', 20, '10.0' ),
( '999887777', 30, '30.0' ),
( '999887777', 10, '10.0' ),
( '987987987', 10, '35.0' ),
( '987987987', 30, '5.0' ),
( '987654321', 30, '20.0' ),
( '987654321', 20, '15.0' ),
( '888665555', 20, '');

--Query command--
--I--
CREATE PROCEDURE QLKH_SP_1
( 
@sd as decimal,
@ed as decimal
)
AS
BEGIN
    SELECT *
FROM 
    QLNV.dbo.NhanVien nv1
	left join QLNV.dbo.NhanVien nv2 on nv2.MaNV = nv1.Ma_NQL
Where 
	day(nv1.NgSinh) > @sd and day(nv1.NgSinh) < @ed
END;


