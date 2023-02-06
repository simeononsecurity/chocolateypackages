#Continue on error
$ErrorActionPreference = 'silentlycontinue'

#Require elivation for script run
#Requires -RunAsAdministrator

$targetPath = Join-Path -Path $Env:chocolateyPackageFolder -ChildPath tools
$validExitCodes = @(0, 3010, 1641)
$url = "https://www.awesomeminer.com/download/setup/AwesomeMiner.msi"
$arguments = @{
    packageName    = 'awesomeminer'
    softwareName   = 'awesomeminer'
    url            = $url
    #url64bit       = $url
    checksum       = 'AD300DABD8D158F1714303A1EF89EBF743AF67A90909DBEB366F892125D40634'
    checksumType   = 'sha256'
    # checksum64     = 'AD300DABD8D158F1714303A1EF89EBF743AF67A90909DBEB366F892125D40634'
    # checksumType64 = 'sha256'
    filetype       = 'MSI'
    silentArgs     = "/QUIET /NORESTART" 
}

Install-ChocolateyPackage @arguments -validExitCodes $validExitCodes