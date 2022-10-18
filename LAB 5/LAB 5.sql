-- Sub Queries

create database LAB_5

use LAB_5

-- Sub Queries are like nested loop
-- Condtion will be in inner select statement
-- Will have to SELECT statements

create table tblEmployee (
 id int primary key,
 names nvarchar(50),
 salary float null
)

insert into tblEmployee values (
	4,
	'Munaver',
	15000
)

select * from tblEmployee

select * from tblEmployee
where salary > (
select salary from tblEmployee
where names = 'Ahmad'
)

-- Number of columns in inner query will be one only