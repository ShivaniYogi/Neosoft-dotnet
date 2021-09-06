CREATE TABLE Customer(
Id int primary key identity(1,1),
[Name] varchar(50) Not Null,
ZipCode int Not Null,
Email varchar(100) Not Null
)

CREATE TABLE Login(
Id int primary key identity(1,1),
CustomerId int Foreign Key References Customer(Id),
Username varchar(20) Not Null,
Password varchar(50) Not Null
)
