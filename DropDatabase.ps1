 param (
    [string]$subscriptionId = "7589b205-2f3e-408c-8f6f-784212bfee55",
    [string]$serverName = "databasebuilddemo.database.windows.net",
    [string]$databaseName = "DatabaseBuildAndTearDownDemo",
    [string]$resourceGroupName = "DatabaseBuildDemo"
 )

$databaseExists = Get-AzSqlDatabase -ServerName $serverName -ResourceGroupName $resourceGroupName -DatabaseName $databaseName -ErrorAction SilentlyContinue
if ($databaseExists) {
    Remove-AzSqlDatabase -ResourceGroupName $resourceGroupName -ServerName $serverName -DatabaseName $databaseName
     }
else { 
# Do nothing
    }

