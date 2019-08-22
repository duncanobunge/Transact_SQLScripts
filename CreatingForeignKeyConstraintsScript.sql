Use [LearningDB]
GO
--DROP TABLE IF EXITS
DROP TABLE IF EXISTS  [dbo].[Department]
GO
-- CREATE TABLE DEPARTMENT
CREATE TABLE [dbo].[Department](
	[DepartmentId] int  IDENTITY(100,1) PRIMARY KEY,
	[DepartmentName] varchar(50),
	[IsActive] bit Default(1)
)
GO
--DROP THE TABLE IF IT EXIST
DROP TABLE IF EXISTS  [dbo].[Employee]
GO

--CREATING  FK_CONSTRAINT EXPLICITLY
-- CREATE  TABLE EMPLOYEE
CREATE TABLE [dbo].[Employee](
   [EmployeeId] int IDENTITY(100,1) PRIMARY KEY,
   [EmployeeName] varchar(100) NOT NULL,
   [EmployeeGender] nchar(1),
   [DepartmentId] int NOT NULL,
   [IsActive] bit Default(1)
   CONSTRAINT FK_EmployeeId_DepartmentId FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department](DepartmentId)

)


--CREATING  FK_WITHOUT CONSTRAINT IMPLICITLY
-- CREATE  TABLE EMPLOYEEHistory
CREATE TABLE [dbo].[EmployeeHistory](
   [EmployeeId] int IDENTITY(100,1) PRIMARY KEY,
   [EmployeeName] varchar(100) NOT NULL,
   [EmployeeGender] nchar(1),
   [DepartmentId] int NOT NULL,
   [IsActive] bit Default(1)
        FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department](DepartmentId)

)

