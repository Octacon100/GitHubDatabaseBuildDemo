CREATE OR ALTER PROCEDURE dbo.Today_Data_Get(
    @User_Name VARCHAR(255),
    @Date DATETIME
)                 
AS
BEGIN

    SELECT d.*, dr.*
    FROM dbo.Day_Rating dr
    INNER JOIN dbo.[Day_detail] d
    on dr.Day_ID = d.Day_Id
    INNER JOIN dbo.User_Details u
    on u.User_Id = dr.User_ID
    where u.[User_Name] = @User_Name
    and d.Day_Date = @Date

END
