create database LAB_3

use LAB_3

-- Identity is used to auto increment some field in table
-- Identity (starting_index, increment)

create table tbl_identity (
	id int primary key Identity(5, 5),
	[name] varchar(20),
	age int
)

insert into tbl_identity values ('Asad Ali', 21)
insert into tbl_identity values ('Haroon', 22)
insert into tbl_identity values ('Hassan', 23)

-- To put random in Identity Column
set Identity_Insert tbl_identity ON

-- Specify Column name
insert into tbl_identity (id, [name], age)values (200, 'Amjad', 27)

-- Now you can't get the previous behaviour i.e without column name
-- Change to auto increment again
set Identity_Insert tbl_identity OFF
-- It increments last rows identity in any case i.e largest value

-- Constraint 
--		Unique
--		Default
--		Check

alter table tbl_identity
add constraint df_name
default 'nam e nahi likha user na' for [name]

alter table tbl_identity
add constraint check_age
check (age>0 and age<60)

insert into tbl_identity values ('Rehman', 28)

select * from tbl_identity

-- To change a constraint first drop the constraint and add the constraint again