CREATE TABLE [dbo].Users
(
	[ID] INT NOT NULL PRIMARY KEY, 
    [UserName] NVARCHAR(25) NOT NULL, 
    [Email] VARCHAR(100) NOT NULL, 
    [Password] NCHAR(30) NOT NULL, 
    [Role] INT NOT NULL
)
