create database LAB_4

Create table tblDepartment
(
     ID int primary key,
     DepartmentName nvarchar(50),
     Location nvarchar(50),
     DepartmentHead nvarchar(50)
)

Insert into tblDepartment values (1, 'IT', 'London', 'Rick')
Insert into tblDepartment values (2, 'Payroll', 'Delhi', 'Ron')
Insert into tblDepartment values (3, 'HR', 'New York', 'Christie')
Insert into tblDepartment values (4, 'Other Department', 'Sydney', 'Cindrella')

Create table tblEmployee
(
     ID int primary key,
     Name nvarchar(50),
     Gender nvarchar(50),
     Salary int,
     DepartmentId int foreign key references tblDepartment(Id)
)

Insert into tblEmployee values (1, 'Tom', 'Male', 4000, 1)
Insert into tblEmployee values (2, 'Pam', 'Female', 3000, 3)
Insert into tblEmployee values (3, 'John', 'Male', 3500, 1)
Insert into tblEmployee values (4, 'Sam', 'Male', 4500, 2)
Insert into tblEmployee values (5, 'Todd', 'Male', 2800, 2)
Insert into tblEmployee values (6, 'Ben', 'Male', 7000, 1)
Insert into tblEmployee values (7, 'Sara', 'Female', 4800, 3)
Insert into tblEmployee values (8, 'Valarie', 'Female', 5500, 1)
Insert into tblEmployee values (9, 'James', 'Male', 6500, NULL)
Insert into tblEmployee values (10, 'Russell', 'Male', 8800, NULL)

-- Joins: To fetch data from multiple tables

select * from tblDepartment
select * from tblEmployee

-- Inner Join ot Join
select * from tblEmployee e
inner join tblDepartment d
on  e.DepartmentId = d.ID

select * from tblEmployee e
inner join tblDepartment d
on  e.[Name] = d.DepartmentName

--Outer Join
--Left table with from keyword
--Right table with join

--		Left Outer Join
select * from tblEmployee e
left outer join  tblDepartment d
on  e.DepartmentId = d.ID

--		Right Outer Join
select * from tblEmployee e
right outer join  tblDepartment d
on  e.DepartmentId = d.ID

--		Full Outer Join
select * from tblEmployee e
full outer join  tblDepartment d
on  e.DepartmentId = d.ID

--Cross join *heavy*......Example Students of 4th Semester & Subjects of 4th Semester 
select * from tblEmployee e
cross join  tblDepartment

--Uncommon Data of both table
select * from tblEmployee e
full outer join  tblDepartment d
on  e.DepartmentId = d.ID
where e.DepartmentId is NULL

--Uncommon Data of left table
select * from tblEmployee e
left outer join  tblDepartment d
on  e.DepartmentId = d.ID
where e.DepartmentId is NULL

--Uncommon Data of right table
select * from tblEmployee e
right outer join  tblDepartment d
on  e.DepartmentId = d.ID
where e.DepartmentId is NULL

--Cross Product then where condtion = Inner Join *Not recommended
select * from tblEmployee, tblDepartment
where tblEmployee.DepartmentId = tblDepartment.ID

--Multiple Table join
select ord_no, ord_date, purch_amt, Customer [Name], grade, Salesman, commission
from orders o
inner join customer c
on o.customer_id = c.customer_id
inner join salesman s
on o.salesman_id = s.salesman_id