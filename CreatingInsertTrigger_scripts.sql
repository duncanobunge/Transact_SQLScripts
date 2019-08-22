-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,OBUNGE>
-- Create date: <Create Date,21/08/2019>
-- Description:	<Description,The trigger insert into the history table after insertion into Student>
-- =============================================
CREATE TRIGGER [dbo].[history] ON [dbo].[Student]
   AFTER INSERT
AS 
BEGIN
	declare @StudentID int;
    declare @Firstname varchar(50);
    declare @Lastname varchar(50); 
    declare @Age int;
    declare @Course varchar(50);

	select @StudentID = StudentList.StudentID from inserted StudentList;
	select @Firstname = StudentList.Firstname from inserted StudentList;
	SELECT @Lastname = StudentList.Lastname FROM  inserted StudentList;
	SELECT @Age = StudentList.Age FROM inserted StudentList;
	SELECT @Course = StudentList.Course FROM inserted StudentList;

	INSERT INTO [dbo].[StudentHistory](StudentID,Firstname,Lastname,Age,Course)VALUES(@StudentID,@Firstname,@Lastname,@Age,@Course);
END
GO
