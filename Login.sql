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
-- =============================================
CREATE PROCEDURE Login_SP
    -- Add the parameters for the stored procedure here
    @Username VARCHAR(50), 
    @Password VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
SET NOCOUNT ON;

    SELECT 
        u.UserID,
        u.Username,
        u.Status,
        u.RoleID,
        r.RoleName,
        p.FirstName,
        p.LastName
    FROM Users u
    INNER JOIN Roles r ON u.RoleID = r.RoleID
    INNER JOIN Profiles p ON u.ProfileID = p.ProfileID
    WHERE u.Username = @username AND u.Password = @password;
END;
GO