
 if not exists (select 1 from sys.sysdatabases where name='GraduateTrackingDB')
  create database GraduateTrackingDB
 go
 use GraduateTrackingDB
 go
 if exists (select 1 from sys.tables where name='University')
  drop table University
 go
 create table University (
  UniversityId int not null identity(1,1), 
  UniversityName varchar(200) not null,
  CreatedBy nvarchar(450) not null,
  CreatedOn datetime not null,
  ModifiedBy nvarchar(450) not null,
  ModifiedOn datetime not null,
  Active bit not null,
  Deleted bit not null
  primary key clustered (UniversityId)
 )
 go
 if exists (select 1 from sys.tables where name='HighSchool')
  drop table HighSchool
 go
 create table HighSchool (
  HighSchoolId int not null identity(1,1), 
  HighSchoolName varchar(200) not null,
  UniversityId int not null,
  CreatedBy nvarchar(450) not null,
  CreatedOn datetime not null,
  ModifiedBy nvarchar(450) not null,
  ModifiedOn datetime not null,
  Active bit not null,
  Deleted bit not null
  primary key clustered (HighSchoolId)
 )
 go
 if exists (select 1 from sys.tables where name='Student')
  drop table Student
 go
 create table Student (
  StudentId int primary key identity(1,1),
  UserId nvarchar(450) not null ,
  FirstName NVARCHAR(100) not null,
  LastName NVARCHAR(100) not null,
  GraduationYear int not null,
  Email nvarchar(100),
  HighSchoolId int not null,
  CreatedBy nvarchar(450) not null,
  CreatedOn datetime not null,
  ModifiedBy nvarchar(450) not null,
  ModifiedOn datetime not null,
  Active bit not null,
  Deleted bit not null  
 )
 go
 if exists (select 1 from sys.tables where name='Announcement')
  drop table Announcement
 go 
 create table Announcement (
  AnnouncementId int not null identity(1,1), 
  AnnouncementTitle varchar(300),
  AnnouncementText varchar(max),
  CreatedBy nvarchar(450) not null,
  CreatedOn datetime not null,
  ModifiedBy nvarchar(450) not null,
  ModifiedOn datetime not null,
  Active bit not null,
  Deleted bit not null  
  primary key clustered (AnnouncementId)
 )
 go
 if exists (select 1 from sys.tables where name='JobOffer')
  drop table JobOffer
 go
 create table JobOffer (
  OfferId int not null identity(1,1),
  OfferTitle varchar(100) not null,
  OfferDescription varchar(max),
  CreatedBy nvarchar(450) not null,
  CreatedOn datetime not null,
  ModifiedBy nvarchar(450) not null,
  ModifiedOn datetime not null,
  Active bit not null,
  Deleted bit not null  
  primary key clustered (OfferId)
 )
 go

 if exists (select 1 from sys.tables where name='SchoolDepartment')
  drop table SchoolDepartment
 go 
 create table SchoolDepartment (
  DepartmentId int identity(1,1),
  DepartmentName varchar(100) not null,
  HighSchoolId int not null,
  Active bit not null,
  Deleted bit not null
  primary key clustered(DepartmentId)
 )
 go


 if exists (select 1 from sys.tables where name='SchoolDepartmentMapping')
  drop table SchoolDepartmentMapping
 go
 create table SchoolDepartmentMapping (
  DepartmentMappingId int identity(1,1) primary key,
  HighSchoolId int not null,
  DepartmentId int not null  
 )
 create unique index SchoolDepartmentMapping_01 on SchoolDepartmentMapping (HighSchoolId,DepartmentId) --Bir yüksekokulun bir tane bölümü olabilir.


 
 












