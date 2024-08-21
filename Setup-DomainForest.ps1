#Verify IP and name
Get-NetIPConfiguration
hostname

#$DomainNetBIOSName = "TESTCORP"
#$DomainAdminUser = "Administrator"
#$DomainAdminPassword = "Password1234"

$DomainName = "sesoplab.local"
$DatabasePath = "C:\Windows\NTDS"
$LogPath = "C:\Windows\NTDS"
$SysvolPath = "C:\Windows\SYSVOL"
$ReplicationSourceDC = "DEV-DC02.$DomainName"
$SiteName = "Default-First-Site-Name"

$CreateDnsDelegation = $false
$CriticalReplicationOnly = $false
$InstallDns = $false
$NoGlobalCatalog = $false
$NoRebootOnCompletion = $false
$Force = $true


Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
Install-ADDSDomainController `
-NoGlobalCatalog:$NoGlobalCatalog `
-CreateDnsDelegation:$CreateDnsDelegation `
-CriticalReplicationOnly:$CriticalReplicationOnly `
-DatabasePath $DatabasePath `
-DomainName $DomainName `
-InstallDns:$InstallDns `
-LogPath $LogPath `
-NoRebootOnCompletion:$NoRebootOnCompletion `
-ReplicationSourceDC $ReplicationSourceDC `
-SiteName $SiteName `
-SysvolPath $SysvolPath `
-Force:$Force `

#Set DNS settings
Set-DnsClientServerAddress -InterfaceIndex 7 -ResetServerAddresses
Set-DnsClientServerAddress -InterfaceIndex 7 -ServerAddresses 8.8.8.8,1.1.1.1