create database QLTT

use QLTT;

go

create table LoaiCay(
	ID_cay int not null,
	Ten_cay nvarchar(20),
	MoTa nvarchar(50),
	primary key (ID_cay)
)


create table GiongCayChinh(
	ID_giongcaychinh int not null,
	Ten_giongchinh nvarchar(30),
	MoTa nvarchar (50),
	ID_cay int foreign key references LoaiCay(ID_cay)
)


create table GiongCayLuuHanh(
	ID_giongcayluuhanh int not null,
	Ten_giongluuhanh nvarchar(30),
	NguonGoc nvarchar(50),
	DacDiem nvarchar(50),
	ID_cay int foreign key references LoaiCay(ID_cay),
	ID_giongcaychinh int foreign key references GiongCayChinh(ID_giongcaychinh)
)