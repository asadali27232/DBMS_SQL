-- Data Retreval

-- Precedence
-- FWGHSO
-- From 
-- Where
-- Group
-- Having
-- Select
-- Order By

select * from Orders o
where o.EmployeeID=3 or o.EmployeeID=4

-- Wild Card Operator
-- IN
select * from Orders o
where o.EmployeeID in (3,4,5)
-- BETWEEN
select * from Orders o
where o.EmployeeID between 5 and 20
-- LIKE
-- Any thing after S is defined by %
select * from Orders o
where o.CustomerID like 'S%'
-- Length after S is specified by _
select * from Orders o
where o.CustomerID like 'S___'
-- Ending with S
select * from Orders o
where o.CustomerID like '%S'
-- Ending with S and Starting with A
select * from Orders o
where o.CustomerID like 'A%S'
-- Staring with A or B what's at the end no matter
select * from Orders o
where o.CustomerID like '[AB]%'
-- % means any thing and any lenght _ means specific length


-- Gourp By 
create table tbl_Empl (
	id int primary key,
	names varchar(50),
	gender varchar(2),
	city varchar(20),
	salary int
)

insert into tbl_Empl values
(1, 'Ali', 'F', 'Lahore', 9000),
(2, 'Bilal', 'M', 'Lahore', 5000),
(3, 'Ahmad', 'M', 'ISL', 6000),
(4, 'Zainab', 'F', 'ISL', 7000),
(5, 'Amna', 'F', 'Guj', 8000)

-- Aggregate Functions only apply on Integers and take single value
select count(*) as total_rows from tbl_Empl
select min(salary) as min_value from tbl_Empl
select avg(salary) as avg_value from tbl_Empl
select max(salary) as max_value from tbl_Empl
select sum(salary) as sum_value from tbl_Empl

-- Group By is nothing without Aggregate Function
select city, sum(salary) as sum_salaries_by_city from tbl_Empl
group by city
-- Ungrouped data can't be displayed with group data
select city, sum(salary) as sum_salaries_by_city, names from tbl_Empl
group by city

select city, gender, sum(salary) as sum_salaries_by_city from tbl_Empl
group by city, gender
order by sum_salaries_by_city desc

-- Having works with group by and Aggregate Functions and it filters like where
select city, sum(salary) as sum_salaries_by_city from tbl_Empl
group by city
having city='Lahore'

-- Practice
select top 1 EmployeeID, count(OrderID) as number_of_order from Orders as o
group by o.EmployeeID
order by number_of_order 

