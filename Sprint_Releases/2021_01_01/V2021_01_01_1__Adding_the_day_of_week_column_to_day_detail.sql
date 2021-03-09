 --Adding Column to table
    IF NOT EXISTS(SELECT 1
    FROM sys.columns
    WHERE Name = N'Day_Of_Week'
        AND Object_ID = Object_ID(N'dbo.Day_Detail')) --Checking column exists
BEGIN
        ALTER TABLE dbo.Day_Detail ADD Day_Of_Week VARCHAR(12) NOT NULL
    END