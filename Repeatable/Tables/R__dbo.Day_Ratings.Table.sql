--Check table exists
IF NOT EXISTS
(
    select s.name, t.name
from sys.tables T
    inner join sys.schemas s
    on s.schema_id = t.schema_id
where s.name = 'dbo' and t.name = 'Day_Rating'
)
BEGIN

    CREATE TABLE dbo.Day_Rating
    (
        Day_Rating_Id INT IDENTITY(1,1) NOT NULL,
        Day_ID INT NOT NULL,
        User_ID INT NOT NULL,
        Day_Rating INT NOT NULL,
        Day_Notes VARCHAR(2000) DEFAULT '',
        I_Am_Grateful_For_1 VARCHAR(500) DEFAULT '',
        I_Am_Grateful_For_2 VARCHAR(500) DEFAULT '',
        I_Am_Grateful_For_3 VARCHAR(500) DEFAULT '',
        What_Would_Make_Today_Great_1 VARCHAR(500) DEFAULT '',
        What_Would_Make_Today_Great_2 VARCHAR(500) DEFAULT '',
        What_Would_Make_Today_Great_3 VARCHAR(500) DEFAULT '',
        Daily_Affirmation VARCHAR(500) DEFAULT '',
        Amazing_Thing_1 VARCHAR(500) DEFAULT '',
        Amazing_Thing_2 VARCHAR(500) DEFAULT '',
        Amazing_Thing_3 VARCHAR(500) DEFAULT '',
        How_Could_Day_Been_Better VARCHAR(500) DEFAULT ''
    )

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Basic PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Day_Rating', @level2type=N'COLUMN',@level2name=N'Day_Rating_Id'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FK to Day_Details' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Day_Rating', @level2type=N'COLUMN',@level2name=N'Day_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FK to User_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Day_Rating', @level2type=N'COLUMN',@level2name=N'User_ID'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A rating between 1-10 that the user gives to the day.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Day_Rating', @level2type=N'COLUMN',@level2name=N'Day_Rating'

END