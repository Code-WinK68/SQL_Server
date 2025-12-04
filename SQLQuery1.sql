create database KTPMUD

use KTPMUD

--Tạo bảng Account
create table Account(
	Username varchar(30) not null,
	Password varchar(30) not null,
	Role varchar(30)
);
-- Tạo khóa chính cho bảng Account (không đặt tên)
alter table Account add primary key (Username);

--Xóa khóa chính 
alter table Account drop constraint PK__Account__536C85E58A5C998E;

--Tạo khóa chính cho bảng Account + đặt tên
alter table Account add constraint PK_Account primary key(Username);

--Chèn dữ liệu vào bảng
insert into Account values 
('20233640', 'thanghy2005','Sinh vien'),
('20233673', 'toangoal2005', 'Sinh vien'),
('20233685', 'truongbn2005', 'Sinh vien'),
('20233470', 'khoimegai2005', 'Sinh vien'),
('20233519', 'manhdelay2005', 'Sinh vien'),
('002.004.00565', 'songtungpro2025', 'Giang vien');


-- Tạo bảng môn học
create table MonHoc(
	MaMonHoc varchar(20) not null,
	TenMonHoc nvarchar(30),
	SoTC int
);
alter table MonHoc add constraint PK_MonHoc primary key(MaMonHoc);

alter table MonHoc alter column TenMonHoc nvarchar(50); --(thay đổi kiểu dữ liệu)

insert into MonHoc values 
('ET3260',N'Kỹ thuật phần mềm ứng dụng',3),
('ET3280',N'Anten và truyền sóng',2),
('ET2072',N'Lý thuyết thông tin',2),
('ET2050',N'Lý thuyết mạch',3),
('SSH1151',N'Tư tưởng HCM',2),
('ED3220',N'Kỹ năng mềm',2),
('ET3220',N'Điện tử số',3);

delete from MonHoc; -- Xóa cả bảng 


--Tạo bảng giảng viên
create table GiangVien(
	MSGV varchar(20),
	HoTen nvarchar(50),
	Email varchar(40),
	GioiTinh bit,
	PhongBan nvarchar(40),
	constraint PK_GiangVien primary key (MSGV)
);

insert into GiangVien values 
('002.004.00565',N'Vũ Song Tùng','tung.vusong@hust.edu.vn',1,N'Trường Điện');

delete from GiangVien;

create table SinhVien(
	MSSV int ,
	HoTen nvarchar(50),
	Email varchar(40),
	GioiTinh bit,
	LopHanhChinh nvarchar(50),
	constraint PK_SinhVien primary key (MSSV),
)
insert into SinhVien(MSSV, HoTen,GioiTinh) values 
(20233640,N'Trần Văn Thắng',1),
(20233373,N'Nguyễn Trọng Toàn',1),
(20233685,N'Lưu Duy Trường',1),
(20233470,N'Nguyễn Thế Khôi',1),
(20233519,N'Nguyễn Đức Mạnh',1);


create table LopTC(
	MaLopTC int primary key,
	MaMonHoc varchar(20) foreign key references MonHoc(MaMonHoc),
	PhongHoc varchar(10),
	ThoiGian varchar(20)
);

insert into LopTC values
(163142,'ET3260','D4-204','6:45 - 9:10'),
(163112,'ET3280','D4-405','6:45 - 8:15'),
(163109,'ET2072','D4-404','8:25 - 10:05'),
(163144,'ET2050','D8-505','12:30 - 14:55');


create table SinhVienTC(
	MSSV_TC int primary key,
	MaLopTC int,
	MSSV int
);

alter table SinhVienTC add foreign key (MaLopTC) references LopTC(MaLopTC);
alter table SinhVienTC add foreign key (MSSV) references SinhVien(MSSV);

--Xóa khóa chính
alter table SinhVienTC drop constraint PK__SinhVien__D07894A829FC2CDD;
alter table SinhVienTC drop column MSSV_TC; -- Xóa cột đó đi
alter table SinhVienTC add MSSV_TC int identity primary key;



insert into SinhVienTC values
('163109','20233373'),
('163112','20233470'),
('163142','20233640'),
('163142','20233685'),
('163109','20233519');


create table DauDiem(
	MaDauDiem varchar(20) primary key ,
	TenDauDiem nvarchar(20)
);

insert into DauDiem values
('GK',N'Giữa kỳ'),
('CK',N'Cuối kỳ');

create table DauDiemMonHoc(
	MaDDMH int identity primary key,
	MaMonHoc varchar(20) references MonHoc(MaMonHoc),
	MaDauDiem varchar(20) references DauDiem(MaDauDiem),
	HeSo int
);

insert into DauDiemMonHoc values
('ED3220','GK',5),
('ED3220','CK',5),

('ET3260','GK',4),
('ET3260','CK',6);

create table DiemSinhVien(
	MDSV int identity primary key,
	MSSV_TC int references SinhVienTC(MSSV_TC),
	MaDaudiem int references DauDiemMonHoc(MaDDMH)
);



select * from Account;
select * from MonHoc;
select * from GiangVien;
select * from SinhVien;
select * from LopTC;
select * from SinhVienTC;
select * from DauDiem;
select * from DauDiemMonHoc;


select 
SinhVien.HoTen as HovaTen ,       --Lấy tên sinh viên
SinhVienTC.*,        -- tất cả thông tin đăng ký lớp
MonHoc.MaMonHoc as MaHocPhan,    --Lấy tên mã học phần
MonHoc.TenMonHoc as TenHocPhan   --Lấy tên học phần 

from SinhVienTC
	inner join LopTC on SinhVienTC.MaLopTC = LopTC.MaLopTC   --Nối cột mã lớp TC của SinhVienTC với Lớp TC
	inner join MonHoc on LopTC.MaMonHoc = MonHoc.MaMonHoc    --Nối cột mã môn học của LopTC với MonHoc
	inner join SinhVien on SinhVienTC.MSSV = SinhVien.MSSV   --Nối cột MSSV của SinhVienTC với SinhVien


-- Nối khóa chính với khóa phụ 