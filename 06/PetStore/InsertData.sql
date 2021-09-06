USE [Neosoft_Anagha]
GO

/****** Object:  StoredProcedure [dbo].[InsertCustomerData]    Script Date: 9/6/2021 11:36:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertCustomerData]
	-- Add the parameters for the stored procedure here
	@Name		varchar(50),
	@Email		varchar(100),
	@ZipCode	int,
	@Username	varchar(20),
	@Password	varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @CustomerID int 
	INSERT INTO Customer
				(
					Name,
					Email,
					Zipcode
				)
			VALUES
				(
					@Name,
					@Email,
					@ZipCode
				)

	SELECT @CustomerID = SCOPE_IDENTITY()

	INSERT INTO Login
				(
					Username,
					CustomerId,
					Password
				)
			VALUES
				(
					@Username,
					@CustomerID,
					@Password
				)
END
GO

