if not exists(
    select 1 from sys.schemas where name = 'ExampleTests'
)
BEGIN
    exec tsqlt.NewTestClass 'ExampleTests'
END 