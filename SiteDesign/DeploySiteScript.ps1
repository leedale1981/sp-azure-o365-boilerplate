
# Get the site script JSON from file.

Get-Content 'ld-test-script.json' `
     -Raw | `
     Add-SPOSiteScript `
    -Title "LD Demo Script"



# Add site design and assoctiate script

Add-SPOSiteDesign `
  -Title "LD Demo" `
  -WebTemplate "64" `
  -SiteScripts "2756067f-d818-4933-a514-2a2b2c50fb06" `
  -Description "LD Demo"