 param (
    [string]$subscriptionId = "7589b205-2f3e-408c-8f6f-784212bfee55",
    [string]$serverName = "databasebuilddemo.database.windows.net",
    [string]$databaseName = "DatabaseBuildAndTearDownDemo",
    [string]$resourceGroupName = "DatabaseBuildDemo"
 )

Connect-AzureRmAccount

$databaseExists = Get-AzureRmSqlDatabase -ServerName $serverName -ResourceGroupName $resourceGroupName -DatabaseName $databaseName -ErrorAction SilentlyContinue
if ($databaseExists) {
    # Do nothing
     }
else { 
# Create a blank database with an S0 performance level
$database = New-AzureRmSqlDatabase  -ResourceGroupName $resourceGroupName `
    -ServerName $serverName `
    -DatabaseName $databaseName `
    -RequestedServiceObjectiveName "S0" 
    }

