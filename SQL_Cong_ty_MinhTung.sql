/* Constraint (ràng buộc)
	not null : đảm bảo một cột không thể có giá trị null
	default: cung cấp 1 giá trị mặc định cho cột khi không được xác định 
	unique : bảo đảm tất cả các giá trị trong một cột là khác nhau
	primary key : mỗi hàng/bản ghi được nhận diện 1 cách duy nhất trong 1 bảng
	foreign key : mỗi hàng/bản ghi đưọc nhận diện 1 cách duy nhất trong bất kì bảng nào
	check: bảo đảm tất cả giá trị trong một cột thỏa mãn các điều kiện nào đó
	index: sử dụng để tạo và lấy dữ liệu từ database một cách nhanh cóng
*/

-- Khi có nhiều database thì sử dụng lệnh 
-- use "Tên cở sở dữ liệu"


--Tạo database
--create table 'Tên database'
--drop table 'Tên database'


--Tạo bảng 
--create table 'Tên bảng'
--drop table 'Tên bảng'

--Tạo bảng từ bảng có sẵn
--select * into "Bảng 2" from "Bảng 1" (tạo bảng 2 với tất cả các cột giống bảng 1)
--select "cột 1","cột 2" into "Bảng 2" from "Bảng 1" (tạo bảng 2 với các cột 1, cột 2 giống bảng 1) 


--Thêm,xóa , sửa đổi các cột trong bảng 
--alter table "Bảng 1" add "Tên cột thêm 1" "kiểu dữ liệu", "Tên cột thêm 2" "kiểu dữ liệu" ;
--alter table "Bảng 1" drop column "Tên cột cần xóa", "Tên cột cần xóa 2" ; 

--alter table "Bảng 1" alter column "Cột 1" "Kiểu dữ liệu mới" (thay đổi kiểu dữ liệu)
--sp_rename 'Bảng1.Cộtcần đổi tên','Tên mới','Column'; (đổi tên của cột)


--Tạo các ràng buộc not null

/* create table "Bảng 1"(
	ID int not null,
	Ten varchar(10) not null,
	)
*/

/* Nếu có bảng rồi 
	alter table "Bảng 1" alter column "cột" "Kiểu dữ liệu" nou null
	 --> VD : alter table NhanVien alter column ID int not nul;
*/



--///////////////////////////////////////////////////////////////////////////
/*
-- Tạo bảng với khóa chính không đặt tên
create table PhongBan(
	ID int not null primary key,
	TenPhongBan varchar(20) not null
)

create table PhongBan(
	ID int not null,
	TenPhongBan varchar(20) not null,
	primary key(ID)
)


--Tạo bảng và đặt tên cho kháo chính
create table PhongBan(
	Id int not null,
	TenPhongBan varchar(20) nut null,
	SoNV int,
	constraint PK_PhongBan primary key(ID, TenPhongBan)
)

--Muốn thêm primary key vào bảng có sẵn
alter table "Bảng 1" add primary key ("cột 1");

--Muốn thêm primary key và đặt tên cho cột trông bảng 
alter table "Bảng 1" add constraint PK_PhongBan primary key("Cột 1","Cột 2");

--Muốn xóa bỏ primary key
alter table "Bảng 1" drop constraint PK_PhongBan;
*/
--=====================================================================================
/*
--Tạo khóa ngoại

--Tạo bảng với khóa ngoại 
create table "Bảng1"(
	Cot1 int not null primary key,
	cot2 varchar(10) ,
	IDcot int foreign key references  Bảng2( cột1)
)

create table "Bảng1"(
	Cot1 int not null,
	cot2 varchar(10) ,
	IDcot int ,
	primary key(Cot1),
	foreign key (IDcot) references Bảng2(cột1)
);

--Tạo khóa ngoại + đặt tên
create table "Bảng1"(
	Cot1 int not null primary key,
	cot2 varchar(10) ,
	IDcot int,
	constraint FK_Bang foreign key (IDcot) references Bảng2(cột1)
);

--Thêm khóa ngoại vào bảng đã tồn tại
alter table "Bảng1" add foreign key (Cot1) references Bảng2(cột1);

--Thêm khóa ngoại + đạt tên vào bảng đã tồn tại
alter table "Bảng1" add constraint FK_Bang  foreign key (Cot1) references Bảng2(cột);

--Xóa khóa ngoại
alter table "Bảng1" drop constraint FK_Bang;

*/
--=====================================================================================


alter table NhanVien 
add constraint PK_NhanVien
primary key (ID);



create table Thang(
	ID int primary key,
	NgaySinh varchar(10) not null,
	IDthang int foreign key references NhanVien(ID)
);

create table PhongBan(
	MaPB int not null,
	TenPB varchar(10),
	NhanvienID int ,
);

alter table PhongBan add primary key (MaPB), foreign key (NhanvienID) references NhanVien(ID);


sp_rename 'PhongBan.TenPB','TenPhongBan','column';

alter table PhongBan alter column TenPhongBan varchar(30);

--indentity(batdau, khoang cach)

create table Person(
	id int identity(1,1) primary key ,
	firstname varchar(10) not null,
	lastname varchar(20) not null,
	age int

)

insert into Person values('Tran','Van Thang',20), ('Nguyen','Minh Tung',21)


-- Xóa dữ liệu trong bảng
-- delete from "Bảng1";  or delete * from "Bảng1";   xóa tất 

--delete from "Bảng1" where id = 1, firstname = 'Thang    xóa có điều kiện

select * from Person; -- hiển thị cả bảng

select Hoten from NhanVien;  -- Hiển thị cột được chọn

select distinct firstname from Person; -- Hiện thị các giá trị không trùng nhau trong bảng hoặc cột 
select count (distinct lastname) from Person; --Hiển thị số lượng khác nhau

select * from Person where age> 18;

delete from Person where age >20;

-- Cập nhật 
update Person set firstname = 'Tu' where id=1; -- cập nhật thông tin cho 1 hàng
update Person set fisrtname = 'Tu' -- Sẽ update cả bảng 
select* from Person;


select * from NhanVien
order by Hoten ASC       --Sắp xếp tăng dần  "DESC" giảm dần

select top 8 * from NhanVien -- Hiển thị 8 dòng đầu 

where Hoten like 'a%' -- tất cả các phần tử bắt đầu bằng chữ a
where Hoten like '%a' -- tất cả các phần tử kết thúc bằng chữ a
where Hoten like '%a%' -- tất cả các phần tử có chữ a
where Hoten like 'a%b' -- tất cả các phần tử bắt đầu = chữ a kết thúc = b
where Hoten like '_a%' -- tất cả các phân tử bắt đầu từ vị trí thứ 2


--Đặt tên cho cột  
select Id as MSSV, Hoten as HovaTen from SinhVien;

select s.Hoten as [Ho và Ten], s.Diachi, sr.Dangky as [Dang ky]
from  SinhVien as s, SinhVienTC as sr
where s.ID = sr.SinhVienID


-- trả về bản ghi những cái thuộc tính trùng nhau 
select s.* , sr.* from SinhVien as s 
inner join SinhVienTC as sr on s.ID = sr.ID

--trả về tất cả  bản ghi cái thuộc tính của bảng bên trái và các bản ghi tương ứng bên phải
