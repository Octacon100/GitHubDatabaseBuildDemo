--Check table exists
IF NOT EXISTS
(
    select s.name, t.name
from sys.tables T
    inner join sys.schemas s
    on s.schema_id = t.schema_id
where s.name = 'dbo' and t.name = 'Day_Detail'
)
BEGIN

    CREATE TABLE dbo.Day_Detail
    (
        Day_Id INT IDENTITY(1,1) NOT NULL,
        Day_Date DATETIME NOT NULL,
        Month VARCHAR(15) NOT NULL,
        Day_Week TINYINT NOT NULL
    )
END

    --Adding Column to table
    IF NOT EXISTS(SELECT 1
    FROM sys.columns
    WHERE Name = N'Day_Of_Week'
        AND Object_ID = Object_ID(N'dbo.Day_Detail')) --Checking column exists
BEGIN
        ALTER TABLE dbo.Day_Detail ADD Day_Of_Week VARCHAR(12) NOT NULL
    END

    --Adding another column to a table
    IF NOT EXISTS(SELECT 1
    FROM sys.columns
    WHERE Name = N'Day_Year'
        AND Object_ID = Object_ID(N'dbo.Day_Detail')) --Checking column exists
BEGIN
        ALTER TABLE dbo.Day_Detail ADD Day_Year INT NOT NULL
    END

    --Adding another column to a table
    IF NOT EXISTS(SELECT 1
    FROM sys.columns
    WHERE Name = N'Day_Quote'
        AND Object_ID = Object_ID(N'dbo.Day_Detail')) --Checking column exists
BEGIN
        ALTER TABLE dbo.Day_Detail ADD Day_Quote VARCHAR(500) NOT NULL
    END

    --Adding another column to a table
    IF NOT EXISTS(SELECT 1
    FROM sys.columns
    WHERE Name = N'Day_Productivity_Quote'
        AND Object_ID = Object_ID(N'dbo.Day_Detail')) --Checking column exists
BEGIN
        ALTER TABLE dbo.Day_Detail ADD Day_Productivity_Quote VARCHAR(500) NOT NULL
    END