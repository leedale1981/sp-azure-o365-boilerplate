$programFiles = [environment]::getfolderpath("programfiles")

Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.dll"

$username = ""
$password = ""
$cred = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $username, $(convertto-securestring $password -asplaintext -force)
Connect-SPOService -Url https://leedale8850hotmail-admin.sharepoint.com -Credential $cred

Get-SPOTenantCdnEnabled -CdnType Public
Get-SPOTenantCdnOrigins -CdnType Public
Get-SPOTenantCdnPolicies -CdnType Public

Set-SPOTenantCdnEnabled -CdnType Public

Get-SPOTenantCdnEnabled -CdnType Public
Get-SPOTenantCdnOrigins -CdnType Public
Get-SPOTenantCdnPolicies -CdnType Public

Add-SPOTenantCdnOrigin -CdnType Public -OriginUrl */cdn