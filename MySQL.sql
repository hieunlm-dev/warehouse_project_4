CREATE DATABASE `warehouse`;
use warehouse;

create table warehouses (  wh_code varchar(100) primary key,  wh_desc longtext,  wh_status tinyint ,   wh_cmt longtext );
create table location (  loc_code varchar(100) primary key ,  loc_desc longtext,  loc_type longtext,  loc_status tinyint,  loc_cap double,  loc_remain double,  loc_holding double,  loc_outgo double,  wh_code varchar(100),     foreign key (wh_code) references warehouses(wh_code),  flammable tinyint )	;
create table supplier (  sup_code varchar(100) primary key,  sup_name longtext,  sup_address longtext,  sup_email longtext,  city longtext,  TaxCode longtext,  active tinyint );
create table user (  id int primary key auto_increment ,   username varchar(20),  email varchar(50),  password varchar(120) );
create table role  (  role_id int primary key auto_increment ,  role_name longtext );
create table user_role (  id int primary key auto_increment ,   role_id int,     foreign key (role_id) references role(role_id),  user_id int,     foreign key (user_id) references user(id) );
create table permission(  id int primary key auto_increment,  name varchar(20) );
create table role_permission(  id int primary key auto_increment ,   role_id int,     foreign key (role_id) references role(role_id),  permission_id int,      foreign key (permission_id) references permission(id) );



