create database warehouse
go
use warehouse
go

create table warehouses
(
	wh_code varchar(100) primary key,
	wh_desc varchar(max),
	wh_status bit , 
	wh_cmt varchar(max)
)
go
create table [location]
(
	loc_code varchar(100) primary key ,
	loc_desc varchar(max),
	loc_type varchar(max),
	loc_status bit,
	loc_cap float,
	loc_remain float,
	loc_holding float,
	loc_outgo float,
	wh_code varchar(100) foreign key references warehouses,
	flammable bit
)
go
create table supplier
(
	sup_code varchar(100) primary key,
	sup_name varchar(max),
	sup_address varchar(max),
	sup_email varchar(max),
	city varchar(max),
	TaxCode varchar(max),
	active bit
)
go
create table [user]
(
	id int primary key identity , 
	username varchar(20),
	email varchar(50),
	[password] varchar(120)
)
go
create table role 
(
	role_id int primary key identity ,
	role_name nvarchar(max),
)
go
create table user_role
(
	id int primary key identity , 
	role_id int foreign key references role,
	[user_id] int foreign key references [user]
)
go
create table permission(
	id int primary key identity,
	name varchar(20),
)
go
create table role_permission(
	id int primary key identity , 
	role_id int foreign key references role,
	permission_id int foreign key references permission
)
go

create table goods_data
(
	goods_no varchar(100) primary key , 
	image varchar(max),
	goods_name nvarchar(max),
	price int,
	active bit,
	package varchar(100) --Loại đóng gói (thùng , bao bì),
	qty_per_package --Số lượng trong 1 thùng
	active bit
	
)
go
create table goods_master
(
	pt_id int primary key identity,
	goods_no varchar(100) foreign key references goods_data,
	pt_qty double, --số lượng nhập vào
	accepted_qty double --số lượng đã được QC kiểm tra chất lượng (vd : nhập vào 50000 , QC pass 30000)
	qc varchar(100) -- tên nhân viên QC
	pt_hold double
	loc_code varchar(100) foreign key references location
	pt_date_in datetime,
	sup_code varchar(100) foreign key references supplier
	ic_id int foreign key incomging_lists,
	passed bit ,
	wh_code varchar(100) foreign key warehouse
)

