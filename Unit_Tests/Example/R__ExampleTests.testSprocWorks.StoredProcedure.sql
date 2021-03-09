CREATE OR ALTER PROCEDURE ExampleTests.testSprocWorks
AS
BEGIN
    DECLARE @expected INT = 1

    DECLARE @actual INT = 
    (
        select 1
    )

    EXEC tSQLt.AssertEquals @expected = @expected, @actual= @actual, @message = 'Test was failed.'

END