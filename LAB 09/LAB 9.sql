--Indecies
--		To optimize table
--		Fast fetch data from table
--		Clustered: only one in a table, just like table of content in book
--		Non-clustered: multiple in table, just like dictionary
--		Primary key itself applies index i.e clustered index
--		First Index will always be clustered unique

use Northwind

create index ix_address
on customers([address])

-- We can do this if the column is not used as a foreign key
alter table customers
drop PK_Customers

-- Views 
--		A view is nothing more than a saved SQL query.
--      A view can also be considered as a virtual table.

create view ceo_view
as 
select * from Employees

create view mang_view
as
select e.EmployeeID, (e.FirstName + ' ' + e.LastName) as [Name] from Employees e

select * from ceo_view
select * from mang_view

-- Get value from base table
-- You can insert in a view that insertion will reflect in orignal table
-- But if view is crated from more then one tables it is not possible to insert in that view
-- Because sql do not know which value is for which table

-- Materalize View or index view
-- Schema bound
-- If view apply index on a view then it will become index view
-- To apply shema binding must give name in to part i.e databaseName.tableName
alter view mang_view
with schemabinding
as
select e.EmployeeID, (e.FirstName + ' ' + e.LastName) as [Name] from dbo.Employees e

create unique clustered index ix_mang_view on mang_view(EmployeeID)   

--Procedures
create procedure SP_name
as
begin
	select * from customers
end

alter procedure SP_name
@cust_name varchar(20),
@city_name varchar(20),
@total int output
as
begin
	select @total = count(City) from customers where ContactName = @cust_name or City = @city_name
end

-- Batch
declare @myOut int
execute SP_name 'Maria Anders', 'Lahore', @myOut output
print @myOut
-- Batch End