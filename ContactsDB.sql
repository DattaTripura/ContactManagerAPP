USE [ContactsDB]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 13-03-2022 13:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Name] [varchar](50) NULL,
	[Phonenumber] [varchar](50) NULL,
	[Email] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13-03-2022 13:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
	[Phonenumber] [varchar](50) NULL,
	[Password] [varchar](50) NOT NULL,
	[Secret] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveContact]    Script Date: 13-03-2022 13:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SaveContact]
@Email varchar(50),
@Phonenumber varchar(50),
@Name varchar(50),
@ERROR VARCHAR(100) OUT

AS

BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
               
SET NOCOUNT ON;

---Checking Condition if User exists or not if user not exists returns different message if exists returns different message

IF NOT EXISTS(SELECT * FROM Contacts WHERE Email=@Email)
BEGIN
INSERT INTO Contacts
(
Name,
Phonenumber,
Email

)
VALUES
(
@Name,
@Phonenumber,
@Email
)
--If User Successfully Saved I am returing this Message as Output Parameter
SET @ERROR=@Email+' Contact Saved Successfully'
END
ELSE
BEGIN
--If User already Exists i am returning this Message as Output Parameter
SET @ERROR=@Email + ' Already Exists'
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_userinformation]    Script Date: 13-03-2022 13:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_userinformation]
@Email varchar(50),
@Password varchar(50),
@Secret varchar(50),
@ERROR VARCHAR(100) OUT

AS

BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
               
SET NOCOUNT ON;

---Checking Condition if User exists or not if user not exists returns different message if exists returns different message

IF NOT EXISTS(SELECT * FROM Users WHERE Email=@Email)
BEGIN
INSERT INTO Users
(
Email,
[Password],
Secret
)
VALUES
(
@Email,
@Password,
@Secret
)
--If User Successfully Registerd I am returing this Message as Output Parameter
SET @ERROR=@Email+' Registered Successfully'
END
ELSE
BEGIN
--If User already Exists i am returning this Message as Output Parameter
SET @ERROR=@Email + ' Already Exists'
END
END
GO
