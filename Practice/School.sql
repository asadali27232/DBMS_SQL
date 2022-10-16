create database db_school

use db_school

create table tblGender (
 genderID int primary key identity(1,1),
 gender varchar(10) not null unique
)

insert into tblGender (Gender) values('Unknown')

create table tblAddresses (
	addressID int primary key identity(100001,1),
	street nvarchar(500),
	area nvarchar(100),
	city nvarchar(100)
)

insert into tblAddresses (street, area, city)values (
	'House number 990 Street number 6',
	'Ferozpur Road ', 
	'Lahore'
	)

create table tblParents(
	perentID int primary key identity(200001,1),
	firstname nvarchar(100),
	lastname nvarchar(100),
	relation nvarchar(50),
	contact nvarchar(50)
	)

insert into tblParents (firstname, lastname, relation, contact) values (
	'Ghaffar',
	'Ahmad',
	'Father',
	'03074212413'
	)

create table tblStudents (
	studentID int primary key identity(800001, 1),
	firstname nvarchar(100),
	lastname nvarchar(100),
	dateofbirth nvarchar(10),
	gender int foreign key references tblGender(genderID),
	parentID int foreign key references tblParents(perentID),
	addressID int foreign key references tblAddresses(addressID)
)

insert into tblStudents (firstname, lastname, dateofbirth, gender, parentID, addressID)
values (
		'Allah',
		'Dita',
		'12-12-2002',
		1,
		200009,
		100015
		)

create table tblSession (
	sessionID int primary key identity(1,1),
	stratyear int unique,
	endyear int unique
	)

insert into tblSession (stratyear, endyear) values (2021, 2022)

create table tblclassList (
	classListID int primary key identity (0,1),
	className nvarchar(100)
)

insert into tblclassList (className) values('Class 10')

create table tblsubjectList (
	subjectListID int primary key identity (1,1),
	subjectName nvarchar(100)
)

insert into tblsubjectList (subjectName) values('Mathematics')


create table tbl_session_and_class (
	csID int primary key identity (2001,1),
	sessionID int foreign key references tblSession(sessionID),
	classID int Foreign key references tblclassList(classListID)
)

insert into tbl_session_and_class (sessionID,classID)
select sessionID, classListId
from tblSession
cross join tblclassList

create table tblEmployeeType (
	EMP_Type_ID int primary key identity(1,1),
	TypeName nvarchar(50)
)

insert into tblEmployeeType (TypeName) values ('Teacher')

create table tblEmployees (
	EMP_ID int primary key identity (300001,1),
	EMP_Type_ID int foreign key references tblEmployeeType(EMP_Type_ID),
	firstname nvarchar(100),
	lastname nvarchar(100),
	addressID int foreign key references tblAddresses(addressID),
	joiningDate varchar(10),
	resigningDate varchar(10),
	salary float not null,
	noOfAttendances int not null
)

alter table tblEmployees
add lastname nvarchar(100)

insert into tblEmployees (EMP_Type_ID, addressID, joiningDate, salary, noOfAttendances, firstname, lastname)
values (
		1,
		100008,
		'10-10-2021',
		25000,
		0,
		'Younas',
		'Bhatti'
		)



create table tbl_class_subjects (
	classSubjectID int primary key identity (30001,1),
	teacherID int foreign key references tblEmployees(EMP_ID),
	csID int foreign key references tbl_session_and_class(csID),
	subjectID int foreign key references tblsubjectList(subjectListID)
	)

alter table tbl_class_subjects
add constraint unique_subjects
unique (csID,subjectID)

insert into tbl_class_subjects (csID,subjectID)
select csID, subjectListID
from tbl_session_and_class
cross join tblsubjectList
order by csID

UPDATE tbl_class_subjects
SET teacherID = 300008
WHERE classSubjectID = 30010

create table tblSectionList (
	sectionId int primary key identity(1,1),
	sectionName varchar(10) not null unique
	)

insert into tblSectionList (sectionName) values ('Default')

create table tbl_class_students (
	class_student_ID int primary key,
	sectionID int foreign key references tblSectionList(sectionId),
	noOfAttendances int not null,
	fee float not null,
	studentID int foreign key references tblStudents(studentID),
	csID int foreign key references tbl_session_and_class(csID),
	sessionID int foreign key references tblSession(sessionID)
)

insert into tbl_class_students values (
	1020,
	8,
	1,
	5600,
	800022,
	2007,
	1
)

select * from tbl_class_students

select s.firstname, s.lastname from tblStudents s
join
(select t.studentID, b.classID from tbl_class_students t
join tbl_session_and_class b
on t.csID = b.csID
where b.classID = 9) d
on d.studentID = s.studentID

select s.firstname, s.lastname from tblStudents s
join (
select a.studentID, b.subjectID from tbl_class_students a
join tbl_class_subjects b
on a.csID = b.csID
where b.subjectID = 2) c
on s.studentID = c.studentID