sp_renamedb 'db_first' , 'data_base'

use data_base

create table tbl_customers (
	c_id int not null,
	[name] varchar(20) null,
	city varchar(15) null,
	gender varchar(1) null
)

create table tbl_order (
	o_id int not null,
	p_name varchar(20) null,
	qty int null,
	price int null,
	c_id int not null
)

alter table tbl_order
add constraint order_id
primary key (o_id)

-- Avoid Ambigous Data Foriegn Key
-- During creating table
-- Always on many side in one to many realtion
-- Many to many can't be implemented directly,,, dead lock
create table tbl_order (
	c_id int,
	foreign key (c_id) references tbl_customers (c_id)
)
-- Foreign key after creating table
alter table tbl_order
add constraint foreign_id
foreign key (c_id) references tbl_customers (c_id)

insert into tbl_customers values (
	3,
	'Aisha',
	'Lahore',
	'F'
)

select * from tbl_customers

-- Foreign key voilation error
insert into tbl_order values (
	33,
	'Sweets',
	'5',
	'5000',
	15
)

select * from tbl_order

-- Many to many

create table tbl_student (
	s_id int Primary Key,
	[name] varchar(30),
)

create table tbl_course (
	c_id int Primary Key,
	title varchar(30),
)

create table tbl_registration (
	c_id int not null,
	foreign key (c_id) references tbl_course (c_id),
	s_id int not null,
	foreign key (s_id) references tbl_student (s_id)
)

alter table tbl_registration
add constraint composite_unique
unique (c_id, s_id)

insert into tbl_student values (11, 'Asad Ali')

delete from tbl_student where s_id=11

select * from tbl_student

insert into tbl_course values (333, 'LA')

select * from tbl_course

insert into tbl_registration values (222, 22)

select * from tbl_registration

-- Cascading if parent is killed then child will also be killed 
-- 1. Kill the child
-- 2. Null the value of child
-- 3. Change the parent of that child

delete from tbl_student where s_id=11

