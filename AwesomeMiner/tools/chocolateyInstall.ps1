$targetPath = Get-ToolsLocation
$validExitCodes = @(0, 3010, 1641)
$url = "https://www.awesomeminer.com/download/setup/AwesomeMiner.msi"
$arguments = @{
    packageName    = 'awesomeminer'
    softwareName   = 'awesomeminer'
    url            = $url
    #url64bit       = $url
    checksum       = 'ffc85edfd6a88871f08a10e9b3ba092edfc8edbc7ab0e1998e012f4159b436dc'
    checksumType   = 'sha256'
    # checksum64     = 'AD300DABD8D158F1714303A1EF89EBF743AF67A90909DBEB366F892125D40634'
    # checksumType64 = 'sha256'
    filetype       = 'MSI'
    silentArgs     = "/QUIET /NORESTART" 
}

Install-ChocolateyPackage @arguments -validExitCodes $validExitCodes  -ErrorActionPreference 'Stop'