   --Adding another column to a table
    IF NOT EXISTS(SELECT 1
    FROM sys.columns
    WHERE Name = N'Day_Quote'
        AND Object_ID = Object_ID(N'dbo.Day_Detail')) --Checking column exists
BEGIN
        ALTER TABLE dbo.Day_Detail ADD Day_Quote VARCHAR(500) NOT NULL
    END