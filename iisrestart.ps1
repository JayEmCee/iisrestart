<#Use case - GEINC4299283
  Health Web Hosting - Web Operations team restarted IIS services in the app pool.
#>


#Gets list of app pools on the server and restarts IIS app pools
param(
[Parameter(Mandatory=$true)]$webserver
)
Invoke-Command -ComputerName $webserver -ScriptBlock {
    Import-Module WebAdministration
    $apppools = Get-ChildItem IIS:\AppPools
    foreach ($pool in $apppools) {
        Restart-WebAppPool -Name $pool.Name
    }
}

