create table tbl_total_amount (
	orderID int,
	total_amount float
)
truncate table tbl_total_amount

insert into tbl_total_amount (orderID, total_amount)
select OrderID, UnitPrice*Quantity  AS total_amount
FROM [Order Details]



-- Corealted Subqueries
select (select C.CompanyName from Customers C where CustomerID = oktbl.CustomerID) as Customer_Name,
oktbl.CustomerID, oktbl.orderID, oktbl.total
from
(
select (select O.CustomerID  from Orders O where O.OrderID = tbl.OrderID) as CustomerID,
tbl.orderID, tbl.total
from
(
SELECT TOP 1 SUM(total_amount) as total, OrderID
FROM tbl_total_amount
GROUP BY OrderID
order by total desc) as tbl) as oktbl;



select count(total_amount) as number_of_product, OrderID
from
(select OrderID, UnitPrice*Quantity  AS total_amount
FROM [Order Details]) as tbbl
group by OrderID
