-- Triggers 
--	DML Triggers Data Manupulation
--	DDL Triggers Data Definition
--	Logon Triggers

-- DML Trigger
--	After Trigger
	                
--	Instead of Trigger
create table tbl1 (
	id int,
	n varchar(20),
	age int,
	salary int
)

create table tbl2 (
	id int,
	L varchar(20),
	orderqty int,
	qty int
)

create trigger tr_instead
on tbl2
instead of insert
as
begin
	select * from tbl1
end

insert into tbl2 values (1, 'asad', 200, 200)
select * from tbl2