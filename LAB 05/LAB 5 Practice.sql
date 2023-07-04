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