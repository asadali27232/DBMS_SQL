select ProductID, ProductName, UnitPrice from Products p
where p.UnitPrice < 20

select * from Customers 
where CustomerID IN (
select CustomerID from Orders 
where OrderID IN (
select OrderID from [Order Details] 
where ProductID = (
select ProductID from Products 
where UnitPrice = (
select max(UnitPrice) from Products))))

select * from Employees
where EmployeeID IN (
select EmployeeID from Orders
where OrderID IN (
select OrderID from [Order Details]
where ProductID = (
select ProductID from Products
where UnitPrice = (
select max(UnitPrice) from Products))))



