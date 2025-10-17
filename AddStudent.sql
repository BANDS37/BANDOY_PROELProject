-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- ============================================

CREATE PROCEDURE AddStudent_SP 
	-- Add the parameters for the stored procedure here
	 @FirstName VARCHAR(50),
	 @LastName VARCHAR(50),
	 @Age INT,
	 @Gender VARCHAR(10),
	 @Phone VARCHAR(20),
	 @Address VARCHAR(100),
	 @Email VARCHAR(100),
	 @Username NVARCHAR(50),
	 @HashedPassword NVARCHAR(64),
	 @EnrollmentDate DATE,
	 @Action NVARCHAR(100),
	 @Description NVARCHAR(100),
	 @AddName VARCHAR(50)

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ProfileID INT;
	DECLARE @RoleID INT;

	--Role For Student--
	SELECT @RoleID= RoleID FROM Roles WHERE RoleName= 'Student'

	--Insert into Profiles--
	INSERT INTO Profiles(FirstName, LastName, Age, Gender, Phone, Address, Email, Status)
	VALUES (@FirstName, @LastName, @Age, @Gender, @Phone, @Address, @Email, 'Active');

	SET @ProfileID=SCOPE_IDENTITY();


	--Insert into Users--
	INSERT INTO Users(Username, Password, RoleID, ProfileID)
	VALUES( @Username, @HashedPassword, @RoleID, @ProfileID);

	--Insert into Students--
	INSERT INTO Students(ProfileID, EnrollmentDate)
	VALUES(@ProfileID, @EnrollmentDate);

	--Insert into Logs--
	INSERT INTO Logs(Name, Action, Description)
	VALUES(@AddName, @Action, @Description);


END
GO
