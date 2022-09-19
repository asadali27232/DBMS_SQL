-- create Data Base
create database my_db

-- select Data Base 
use my_db

-- create Table in Data Base
create table tbl_students (
	id int not null,
	[name] varchar(20) null
)
-- create Table in Data Base
create table tbl_teacher (
	id int not null,
	[name] varchar(20) null
)

-- display all Columns from Table
select * from tbl_std

-- insert rows or Data in Table
insert into tbl_students values (
	007,
	'Asad Ali'
)

insert into tbl_students values (
	003,
	'Asad ur Rehaman'
)

-- insert only id in Table i.e Named Argumnet name will be NULL
insert into tbl_students (id)values (
	007
)

-- error id cannot be NULL
insert into tbl_students (id)values (
	'Ahmad'
)

-- error varchar(20) will not accept nore then 20 Char
insert into tbl_students values (
	008,
	'Asdafa Alis hhhdu huyuuw jdjduee djjdudjduudjdj'
)

-- display a specific Column from a Table
select [name] from tbl_students

-- rename Date Base
sp_renamedb 'my_db' , 'db_first'

-- rename Table
sp_rename 'tbl_students' , 'tbl_std'

-- Add column to existing Table
alter table tbl_std
add cgpa float null

-- drop column to existing Table
alter table tbl_std
drop column cgpa

-- rename column in existing table


-- Delete a Table but structure of table remain same
delete from tbl_std

-- Delete a row from Table but structure of table remain same
delete from tbl_std where id=3

-- Delete a Table but structure of table remain same
truncate table tbl_std

-- Delete a Table and structure will also be deleted
drop table tbl_std


-- Primary Key on a Table it prevent dublication in that column
-- primary key is not null able by default
-- only 1 key in 1 table
-- only on not null column
-- link to other tables
-- indexing on that column (ordered)
-- Table of contets created which helps in searching
-- but there exist compsit primary key
create table tbl_primary_student (
	id int primary key,
	names varchar(30)
)
insert into tbl_primary_student values(12,'Asad Ali')

-- unique constraint
-- nullable can also be unique
create table tbl_unique_student (
	id int not null,
	names varchar(30) unique
)
alter table tbl_unique_student
add constraint uq_names
unique (names)

-- Primary key on existing table
alter table tbl_unique_student
add constraint primary_id
primary key (id)

