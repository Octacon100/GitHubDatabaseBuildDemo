CREATE OR ALTER FUNCTION dbo.udf_funct_test
(
	@Day_Date DATETIME
)
RETURNS TABLE
	RETURN SELECT *
FROM dbo.Day_Detail
	;