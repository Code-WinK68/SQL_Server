create database QLTT

use QLTT;

create table LoaiCoSo(
	ID int identity primary key,
	Ten nvarchar(30),
);


insert into LoaiCoSo values 
(N'Sản xuất'),
(N'Bán hàng'),
(N'Sản xuất trồng trọt');

create table VungTrong(
	ID int identity primary key,
	Ten nvarchar(50),
	QuyMo int,
)
alter table VungTrong alter column Ten nvarchar(80);

insert into VungTrong values
(N'Tây Bắc Bộ',38000),
(N'Đông Bắc Bộ',68000),
(N'Đồng Bằng sông Hồng',21300),
(N'Bắc Trung Bộ',51500),
(N'Duyên hải Nam Trung Bộ và Tây Nguyên',99200),
(N'Đông Nam Bộ',34600),
(N'Đồng Bằng sông Cửu Long',40500);

create table DonViCoSo(
	ID int identity primary key,
	Ten nvarchar(80),
	DiaChi nvarchar(100),
	DuDK nvarchar(10),
	ToaDo varchar(30),
	VungTrong_ID int foreign key references VungTrong(ID)
);

insert into DonViCoSo values
(N'A', N'Sơn La', N'Có', '21.3283-103.9015', 1),
(N'B', N'Quảng Ninh', N'Có', '20.9546-107.0396', 2),
(N'C', N'Hà Nội', N'Có', '21.0285-105.8542', 3),
(N'D', N'Huế', N'Có', '16.4637-107.5909', 4),
(N'E', N'Đà Nẵng', N'Có', '16.0544-108.2022', 5),
(N'F', N'TP Hồ Chí Minh', N'Có', '10.8231-106.6297', 6),
(N'G', N'Cần Thơ', N'Có', '10.0452-105.7469', 7);


create table ChucNangCoSo(
	ID int identity primary key,
	Loai_ID int foreign key references LoaiCoSo(ID),
	CoSo_ID int foreign key references DonViCoSo(ID)
);

insert into ChucNangCoSo values
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(3, 7);


create table LoaiSanPham(
	ID int identity primary key,
	Ten nvarchar(40),
);

insert into LoaiSanPham values
(N'Giống cây trồng'),
(N'Thuốc bảo vệ thực vật'),
(N'Phân bón'),
(N'Sản xuất trồng trọt');



create table SanPham(
	ID int identity primary key,
	Ten nvarchar(50),
	Loai nvarchar(30),
	LoaiSanPham_ID int foreign key references LoaiSanPham(ID)
);


insert into SanPham values
/* Giống cây */
(N'Lúa OM18',N'Lúa',1),(N'Bắc Thơm',N'Lúa',1),
(N'Ngô NK66',N'Ngô',1),(N'CP501',N'Ngô',1),
(N'Cà chua F1 TN52',N'Cà chua',1),(N'Cà chua F1 999',N'Cà chua',1),
(N'Bắp cải',N'Bắp cải',1),
(N'Xoài Hòa Lộc',N'Xoài',1),
(N'Sầu riêng Ri6',N'Sầu riêng',1),
(N'Bưởi Da xanh',N'Bưởi',1),
(N'Cà phê TRS1',N'Cà phê',1),

/*Phân bón*/
(N'Đạm Urea',N'Phân vô cơ',2),(N'Đạm Amon Nitrate',N'Phân vô cơ',2),
(N'Lân DAP',N'Phân vô cơ',2),(N'Super Lân',N'Phân vô cơ',2),
(N'Kali KCL',N'Phân vô cơ',2),
(N'NPK tổng hợp',N'Phân vô cơ',2),
(N'Ca, Mg,S',N'Phân vi lượng',2),

/*Thuốc bảo vệ thực*/
(N'Imidacloprid',N'Thuốc trừ sâu',3),(N'Fipronil',N'Thuốc trừ sâu',3),
(N'Mancozeb',N'Thuốc trừ bệnh',3),(N'Metalaxyl',N'Thuốc trừ bệnh',3),
(N'Glyphosate',N'Thuốc trừ cỏ',3),(N'Atrazine',N'Thuốc trừ cỏ',3);


create table SanPham_CoSo(
	ID int identity primary key,
	DonViCoSo_ID int foreign key references DonViCoSo(ID),
	LoaiSanPham_ID int foreign key references LoaiSanPham(ID),
);

insert into SanPham_CoSo values
(1,1),
(1,2),
(2,1),
(2,3),
(2,2),
(6,3),
(7,4);


create table SinhVatGayHai(
	ID int identity primary key,
	Ten nvarchar(30),
	Loai nvarchar(30),
	MoTa nvarchar(100),
	MucDoGayHai nvarchar(20)
);


insert into SinhVatGayHai values
(N'Sâu đục thân', N'Côn trùng', N'Gây hại bằng cách đục vào thân cây lúa và ngô',N'Nặng'),
(N'Sâu cuốn lá', N'Côn trùng', N'Cuốn lá lại để ăn phần thịt lá, gây giảm khả năng quang hợp',N'Trung bình'),
(N'Rầy nâu', N'Côn trùng', N'Hút nhựa cây lúa và truyền bệnh vàng lùn, lùn xoắn lá',N'Nhẹ'),
(N'Nhện đỏ', N'Nhện', N'Gây hại bằng cách chích hút làm lá vàng và khô',N'Nhẹ'),
(N'Sâu xanh da láng', N'Côn trùng', N'Phá hoại lá và đọt non của nhiều loại cây trồng',N'Nhẹ'),
(N'Bọ xít muỗi', N'Côn trùng', N'Chích hút làm trái non bị chai sượng hoặc biến dạng',N'Nhẹ'),
(N'Ruồi vàng', N'Côn trùng', N'Đẻ trứng vào trái cây, làm thối và rụng quả',N'Nặng'),
(N'Bệnh đạo ôn', N'Nấm', N'Gây đốm cháy lá, cổ bông và cổ gié trên cây lúa',N'Nhẹ'),
(N'Bệnh khô vằn', N'Nấm', N'Gây vằn nâu trên bẹ lá lúa và nhiều cây trồng khác',N'Nhẹ'),
(N'Bệnh bạc lá', N'Vi khuẩn', N'Làm lá bị khô trắng, giảm năng suất nghiêm trọng',N'Trung bình');



create table SinhVat_VungTrong(
	ID int identity primary key,
	SinhVat_ID int foreign key references SinhVatGayHai(ID),
	VungTrong_ID int foreign key references VungTrong(ID)
);

insert into SinhVat_VungTrong values
(1,1),(1,3),(1,7),
(2,1),(2,5),(2,7),
(3,3),(3,6),
(4,1),(4,5),(4,6),
(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7);

create table TuoiSau(
	ID int identity primary key,
	SinhVat_ID int foreign key references SinhVatGayHai(ID),
	Tuoi nvarchar(20),
	DacDiem nvarchar(50),
);

insert into TuoiSau values
(1, N'Trứng', N'Màu trắng, bám lá'),
(1, N'Trưởng thành', N'Ăn lá mạnh'),

(2, N'Trứng', N'Đẻ thành ổ dưới lá lúa'),
(2, N'Trưởng thành', N'Chích hút gây vàng lá'),

(4, N'Trứng', N'Bám trên bẹ ngô'),
(4, N'Trưởng thành', N'Đục thân làm cây đổ');




select * from TuoiSau;

select* from SinhVatGayHai;

select * from SanPham_CoSo;

select * from Sanpham;

select * from LoaiSanPham;

select * from ChucNangCoSo;

select * from DonViCoSo;

select * from VungTrong;

select* from SinhVatGayHai;

select * from LoaiCoSo;


--Bảng tổng hợp các sản phẩm
select 
SanPham.ID,
SanPham.Loai,
SanPham.Ten,
LoaiSanPham.Ten as PhanLoai
from SanPham
	inner join LoaiSanPham on SanPham.LoaiSanPham_ID = LoaiSanPham.ID;

--Bảng tổng hợp các giống cây chính
select distinct 
SanPham.Loai as Giongcaychinh
from SanPham where SanPham.LoaiSanPham_ID = 1;


--Bảng tổng hợp các giống cây trồng lưu hành
select 
SanPham.ID,
SanPham.Loai,
SanPham.Ten as GiongLuuHanh
from SanPham
	inner join LoaiSanPham on SanPham.LoaiSanPham_ID = LoaiSanPham.ID
where SanPham.LoaiSanPham_ID = 1 ;


--Bảng tổng hợp các loại thuốc bảo vệ thực vật
select 
SanPham.ID,
SanPham.Loai,
SanPham.Ten
from SanPham
	inner join LoaiSanPham on SanPham.LoaiSanPham_ID = LoaiSanPham.ID
where SanPham.LoaiSanPham_ID = 2;


--Bảng tổng hợp các loại phân bón
select 
SanPham.ID,
SanPham.Loai,
SanPham.Ten
from SanPham
	inner join LoaiSanPham on SanPham.LoaiSanPham_ID = LoaiSanPham.ID
where SanPham.LoaiSanPham_ID = 3;
