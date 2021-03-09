--Check table exists
IF NOT EXISTS
(
    select s.name, t.name
from sys.tables T
    inner join sys.schemas s
    on s.schema_id = t.schema_id
where s.name = 'dbo' and t.name = 'User_Detail'
)
BEGIN

    CREATE TABLE dbo.User_Detail
    (
        User_Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        User_Name NVARCHAR(255) NOT NULL,
        Password_Hash BINARY(64) NOT NULL,
        First_Name NVARCHAR(255) NOT NULL,
        Last_Name NVARCHAR(255) NOT NULL
    )

END    