 param (
    [string]$serverName = "databasebuilddemo.database.windows.net",
    [string]$databaseName = "DatabaseBuildDemo",
    [string]$userName = "databasebuilddemo",
    [string]$password = ""
 )

$connectionString = "Server=$serverName;Database=$databaseName;User Id=$userName;Password=$password;"
$sqlCommand = 'BEGIN TRY EXEC tSQLt.RunAll END TRY BEGIN CATCH END CATCH; EXEC tSQLt.XmlResultFormatter'

$connection = new-object system.data.SqlClient.SQLConnection($connectionString)
$command = new-object system.data.sqlclient.sqlcommand($sqlCommand,$connection)
$connection.Open()

$adapter = New-Object System.Data.sqlclient.sqlDataAdapter $command
$dataset = New-Object System.Data.DataSet
$adapter.Fill($dataSet) | Out-Null

$connection.Close()
$dataSet.Tables[0].Rows[0].ItemArray[0] | Out-File "./TEST-TSqlT.xml"