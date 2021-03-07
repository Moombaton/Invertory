create database InventoryDB

USE InventoryDB
GO
CREATE TABLE Category 
(
    Id INT NOT NULL PRIMARY KEY identity(1,1),
    [Name] [NVARCHAR](50) NOT NULL
)
GO

CREATE TABLE Title
(
    Id INT NOT NULL PRIMARY KEY identity(1,1), -- primary key column
    [Name] [NVARCHAR](50) NOT NULL,
    CategoryId INT NOT NULL
    CONSTRAINT FK_Category FOREIGN KEY (CategoryId)
    REFERENCES Category(Id) 
)
GO
CREATE TABLE Person
(
    Id INT NOT NULL PRIMARY KEY identity(1,1), -- primary key column
    [LastName] [NVARCHAR](50) NOT NULL,
    [FirstName] [NVARCHAR](50) NOT NULL,
    [MiddleName] [NVARCHAR](50) NOT NULL
)
GO
CREATE TABLE [Location]
(
    Id INT NOT NULL PRIMARY KEY identity(1,1), -- primary key column
    [Name] [NVARCHAR](50) NOT NULL
)
GO

CREATE TABLE Invertory
(
    Id INT NOT NULL PRIMARY KEY identity(1,1), -- primary key column
    TitleId INT NOT NULL,
    PersonId INT NOT NULL,
    LocationId INT NOT NULL,
    [Name] [NVARCHAR](50) NOT NULL
    CONSTRAINT FK_Title FOREIGN KEY (TitleId)
    REFERENCES Title(Id),
    CONSTRAINT FK_Person FOREIGN KEY (PersonId)
    REFERENCES Person(Id),
    CONSTRAINT FK_Location FOREIGN KEY (LocationId)
    REFERENCES [Location](Id) 
)

GO