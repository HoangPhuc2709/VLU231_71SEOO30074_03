CREATE DATABASE QLDKHP
GO
USE QLDKHP
GO
CREATE TABLE Khoa (
	Ma VARCHAR(20)
		PRIMARY KEY,
	Ten NVARCHAR(50)
		CHECK (LEN(Ten) >= 5)
		NOT NULL,
	Sdt VARCHAR(12)
		CHECK (LEN(Sdt) >= 10
			AND Sdt LIKE '0%'
			AND Sdt NOT LIKE '%[^0-9]%')
		NOT NULL,
	DiadiemVp NVARCHAR(100)
		CHECK (LEN(DiadiemVp) >= 10)
		NOT NULL
)
CREATE TABLE NguoiDung (
	Ma VARCHAR(20)
		PRIMARY KEY,
	MaKhoa VARCHAR(20)
		FOREIGN KEY
		REFERENCES Khoa(Ma),
	Loai TINYINT 
		NOT NULL,
	HoTen NVARCHAR(50) 
		NOT NULL,
	NgaySinh DATE 
		NOT NULL,
	GioiTinh BIT 
		NOT NULL,
	QueQuan NVARCHAR(50)
		NOT NULL,
	DiaChi NVARCHAR(100) 
		NOT NULL,
	CHECK ((Loai = 0 AND MaKhoa IS NULL) 
		OR (Loai IN (1, 2) AND MaKhoa IS NOT NULL))
)
CREATE TABLE TaiKhoan (
	MaNgD VARCHAR(20) 
		PRIMARY KEY
		REFERENCES NguoiDung(Ma),
	TenTk VARCHAR(50) 
		CHECK (LEN(TenTk) > 4
			AND TenTk NOT LIKE '% %')
			UNIQUE
		NOT NULL, 
	MatKhau VARCHAR(50)
		CHECK (LEN(MatKhau) > 7
			AND MatKhau NOT LIKE '% %'
			AND MatKhau LIKE '%[0-9]%'
			AND MatKhau LIKE '%[!@#$%^&*()]%')
		NOT NULL
)
CREATE TABLE MonHoc (
	Ma VARCHAR(20)
		PRIMARY KEY,
	MaKhoa VARCHAR(20)
		FOREIGN KEY
		REFERENCES Khoa(Ma)
		NOT NULL,
	MaTienQuyet VARCHAR(20)
		FOREIGN KEY
		REFERENCES MonHoc(Ma)
		UNIQUE
		NULL,
	Ten NVARCHAR(50)
		NOT NULL,
	SoTc TINYINT
		NOT NULL,
	CHECK (MaTienQuyet != Ma)
)
CREATE TABLE LopHp (
	Ma VARCHAR(20)
		PRIMARY KEY,
	MaMonHoc VARCHAR(20)
		FOREIGN KEY
		REFERENCES MonHoc(Ma)
		NOT NULL,
)
CREATE TABLE GiangvienHp (
	MaGiangVien
		VARCHAR(20)
		FOREIGN KEY
		REFERENCES NguoiDung(Ma),
	MaHp VARCHAR(20)
		FOREIGN KEY
		REFERENCES LopHp(Ma),
	PRIMARY KEY (MaGiangVien, MaHp)
)
CREATE TABLE SinhvienHp (
	MaSinhVien VARCHAR(20)
		FOREIGN KEY
		REFERENCES NguoiDung(Ma),
	MaHp VARCHAR(20)
		FOREIGN KEY
		REFERENCES LopHp(Ma),
	PRIMARY KEY (MaSinhVien, MaHp)
)
CREATE TABLE Diem (
	MaSinhVien VARCHAR(20),
	MaHp VARCHAR(20),
	DiemTrongLop DECIMAL(4, 2)
		CHECK (DiemTrongLop BETWEEN 0 AND 10)
		NULL,
	DiemGiuaKy DECIMAL(4, 2)
		CHECK (DiemGiuaKy BETWEEN 0 AND 10)
		NULL,
	DiemCuoiKy DECIMAL(4, 2)
		CHECK (DiemCuoiKy BETWEEN 0 AND 10)
		NULL,
	PRIMARY KEY (MaSinhVien, MaHp),
	FOREIGN KEY (MaSinhVien, MaHp)
		REFERENCES SinhVienHp(MaSinhVien, MaHp)
)
USE master