create database bps5c
use bps5c
create table tb_student_name(
	student_ID int identity(1,1),
	student_name nvarchar(50),
	PhoneNumber varchar(20),
	Email varchar(100),
	stu_Address nvarchar(300),
	noti nvarchar(500)

)