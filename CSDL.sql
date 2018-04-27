create database QLNSTL
go

use QLNSTL
go

Create Table PhongBan
(
	MaPB varchar(5) not null Primary Key,
	TenPB nvarchar(20) not null,
	HeSoPhuCapPhongBan float not null
)
go

Create Table ChucVu
(
	MaCV varchar(5) not null Primary Key,
	TenCv nvarchar(20) not null,
	HeSoPhuCapChucVu float not null
)
go

Create Table Luong
(
	HeSoLuong int Primary Key not null,
	LuongCB int not null
)
go

Create Table HopDong
(
	MaHD varchar(5) not null Primary Key,
	NgayVaoLam date not null,
	HeSoLuong int not null,
	MaCV varchar(5) not null,
	MaPB varchar(5) not null,
	FOREIGN KEY (HeSoLuong) REFERENCES Luong(HeSoLuong),
	FOREIGN KEY (MaCV) REFERENCES ChucVu(MaCV),
	FOREIGN KEY (MaPB) REFERENCES PhongBan(MaPB)
)
go

Create Table NhanVien
(
	MaNhanVien varchar(5) not null primary key,
	MaPB varchar(5) not null,
	MaHD varchar(5) not null,
	HeSoLuong int not null,
	TenNV nvarchar(100) not null,
	GioiTinh nvarchar(5) not null,
	NgaySinh date not null,
	SoCM Varchar(20) not null,
	DienThoai Varchar(20) not null,
	TrinhDoHV nvarchar(30) not null,
	DiaChi nvarchar(max) not null,
	Email varchar(20) null,
	Hinh Nvarchar(100) not null,
	TTHonNhan Nvarchar (10) not null,
	FOREIGN KEY (MaPB) REFERENCES PhongBan(MaPB),
	FOREIGN KEY (HeSoLuong) REFERENCES Luong(HeSoLuong),
	FOREIGN KEY (MaHD) REFERENCES HopDong(MaHD)
)
go

Create Table QTCT
(
	MaNhanVien varchar(5) null,
	MaCV varchar(5) null,
	MaPB varchar(5) null,
	NgayBatDau date null,
	NgayKetThuc date null,
	GhiChu nvarchar(100),
	FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien),
	FOREIGN KEY (MaCV) REFERENCES ChucVu(MaCV),
	FOREIGN KEY (MaPB) REFERENCES PhongBan(MaPB)
)
go

Create Table Taikhoan
(
	MaNhanVien varchar(5) not null,
	TenDangNhap nvarchar(50) primary key not null,
	MatKhau nvarchar(50) not null,
	TenQuyenHan Nvarchar(20) not null,
	FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
)
go

Create Table ThuongPhat
(
	MaNhanVien varchar(5) not null,
	Loai Nvarchar(50) null,
	Tien int null,
	LyDo Nvarchar(max) null,
	Ngay date,
	FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
)
go


Create Table ChamCong
(
	MaNhanVien varchar(5) not null,
	Ngay date not null,
	TinhTrang Nvarchar(20) null,
	FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
)
go

Create Table QuyDinh
(
	LuongNghiBHXH int,
	TruNghiKhongLiDo int
)

