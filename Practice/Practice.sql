ALTER TABLE tblPerson
ADD CONSTRAINT DF_tblPerson_age
DEFAULT 18 FOR age

ALTER TABLE tblPerson
DROP CONSTRAINT DF_tblPerson_GenderId

insert into tblGender values
(3, 'Custom'),
(4, 'Unknown')

insert into tblPerson(ID,[Name],Email,age) values (8,'asghar', 'asghar@gmail.com', 56)

select * from tblPerson
select * from tblGender

alter table tblPerson
add constraint PK_person
primary key (ID)

truncate table tblPerson

delete tblPerson where ID=4

UPDATE tblPerson
SET Email='haron@gmail.com'
where id=2

alter table tblPerson
add constraint unique_tblPerson_name
unique (name)

create table salesman (
 salesman_id int primary key,
 name nvarchar(50),
 city nvarchar(50), 
 commission float)

 insert into salesman values
        (5001 , 'James Hoog' , 'New York' ,0.15),
        (5002 , 'Nail Knite' , 'Paris'    ,0.13),
        (5005 , 'Pit Alex'   , 'London'   ,0.11),
        (5006 , 'Mc Lyon'    , 'Paris'    ,0.14),
        (5007 , 'Paul Adam'  , 'Rome'     ,0.13),
        (5003 , 'Lauson Hen' , 'San Jose' ,0.12)

select [name], commission from salesman



create table customer (
 customer_id int primary key,   
 cust_name nvarchar(50)    ,    
 city nvarchar(50)     , 
 grade int, 
 salesman_id int foreign key references salesman(salesman_id)
 )
 insert into customer values
        (3002 , 'Nick Rimando'   , 'New York '  ,   100 ,        5001),
        (3007 , 'Brad Davis'     , 'New York '  ,   200 ,        5001),
        (3005 , 'Graham Zusi'    , 'California' ,   200 ,        5002),
        (3008 , 'Julian Green '  , 'London'     ,   300 ,        5002),
        (3004 , 'Fabian Johnson' , 'Paris'      ,   300 ,        5006),
        (3009 , 'Geoff Cameron'  , 'Berlin'     ,   100 ,        5003),
        (3003 , 'Jozy Altidor'   , 'Moscow'     ,   200 ,        5007),
        (3001 , 'Barad Guzan '    , 'London'     ,    200,        5005)

select * from customer
where salesman_id = 5001

create table nobel_win(
[YEAR] int,
[SUBJECT] nvarchar(50),
WINNER nvarchar(50),
COUNTRY nvarchar(50),
CATEGORY nvarchar(50)
)

insert into nobel_win values
(1970, 'Physics','Hannes Alfven','Sweden','Scientist'),
(1970, 'Physics','Louis Neel','France','Scientist'),
(1970, 'Chemistry','Luis Federico Leloir','France','Scientist'),
(1970, 'Physiology','Ulf von Euler','Sweden','Scientist'),
(1970, 'Physiology','Bernard Katz','Germany','Scientist'),
(1970, 'Literature','Aleksandr Solzhenitsyn','Russia','Linguist'),
(1970, 'Economics','Paul Samuelson','USA','Economist'),
(1970, 'Physiology','Julius Axelrod','USA','Scientist'),
(1971, 'Physics','Dennis Gabor','Hungary','Scientist'),
(1971, 'Chemistry','Gerhard Herzberg','Germany','Scientist'),
(1971, 'Peace','Willy Brandt','Germany','Chancellor'),
(1971, 'Literature','Pablo Neruda','Chile','Linguist'),
(1971, 'Economics','Simon Kuznets','Russia','Economist'),
(1978, 'Peace','Anwar al-Sadat','Egypt','President'),
(1978, 'Peace','Menachem Begin','Israel','Prime Minister'),
(1987, 'Chemistry','Donald J. Cram','USA','Scientist'),
(1987, 'Chemistry','Jean-Marie Lehn','France','Scientist'),
(1987, 'Physiology','Susumu Tonegawa','Japan','Scientist'),
(1994, 'Economics','Reinhard Selten','Germany','Economist'),
(1994, 'Peace','Yitzhak Rabin','Israel','Prime Minister'),
(1987, 'Physics','Johannes Georg Bednorz','Germany','Scientist'),
(1987, 'Literature','Joseph Brodsky','Russia','Linguist'),
(1987, 'Economics','Robert Solow','USA','Economist'),
(1994, 'Literature','Kenzaburo Oe','Japan','Linguist')


select * from nobel_win
where [YEAR] >= 1950 and [SUBJECT] = 'Physics'

select * from nobel_win
where WINNER = 'Dennis Gabor'


select * from nobel_win
where [YEAR] between 1970 and 1971

select * from nobel_win
where WINNER like 'Louis%'

select * from nobel_win
where [SUBJECT] not in ('Physics', 'Economics') and [YEAR] in (1970)

create table nobel_win_copy(
[YEAR] int,
[SUBJECT] nvarchar(50),
WINNER nvarchar(50),
COUNTRY nvarchar(50),
CATEGORY nvarchar(50)
)
insert into nobel_win_copy
select * from nobel_win
where [SUBJECT] like 'Physics'

select * from nobel_win_copy

truncate table nobel_win_copy

