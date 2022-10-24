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


use Northwind

select p.ProductName, p.UnitPrice from Products p

select p.ProductName, p.UnitPrice from Products p
where p.UnitPrice = (
select min(pp.UnitPrice) from Products pp
)
union all -- To join to queries combine result in one table
select p.ProductName, p.UnitPrice from Products p
where p.UnitPrice = (
select max(pp.UnitPrice) from Products pp
)
-- Union -> All columns but write repeated ones
-- Union All -> All columns with duplicate repeated columns

SELECT ProductName, UnitPrice 
FROM Products 
where UnitPrice IN (
(select max(UnitPrice) as ma from Products), (select min(UnitPrice) as mi  from Products)
)