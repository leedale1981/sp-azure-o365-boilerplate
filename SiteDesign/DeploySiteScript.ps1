$programFiles = [environment]::getfolderpath("programfiles")

Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.dll"

$username = "leedale@att-office.info"
$password = "M1llwall03"
$cred = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $username, $(convertto-securestring $password -asplaintext -force)
Connect-SPOService -Url https://leedale8850hotmail-admin.sharepoint.com -Credential $cred


# Get the site script JSON from file.

$content = Get-Content 'C:\src\SP-Azure-O365-Boilerplate\SiteDesign\ld-test-script.json' -Raw

Add-SPOSiteScript -Title "LD Demo PnP Script" -Content $content


# Add site design and assoctiate script

Add-SPOSiteDesign `
  -Title "LD Demo" `
  -WebTemplate "64" `
  -SiteScripts "7623d64f-2f03-4ad9-aeb9-1758ab9e53ca" `
  -Description "LD Demo"

Get-SPOSiteScript