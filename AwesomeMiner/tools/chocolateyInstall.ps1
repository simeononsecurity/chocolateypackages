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
    url64bit       = $url
    checksum       = '48db2edaf6edcdddf911fc8dfa872800383493ecad9573fabfc8dd4e2c258119'
    checksumType   = 'sha256'
    # checksum64     = '48db2edaf6edcdddf911fc8dfa872800383493ecad9573fabfc8dd4e2c258119'
    # checksumType64 = 'sha256'
    filetype       = 'MSI'
    silentArgs     = "/QUIET /NORESTART" 
}

Install-ChocolateyPackage @arguments -validExitCodes $validExitCodes