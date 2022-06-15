#Continue on error
$ErrorActionPreference = 'silentlycontinue'

#Require elivation for script run
#Requires -RunAsAdministrator

$targetPath = Join-Path -Path $Env:chocolateyPackageFolder -ChildPath tools
$validExitCodes = @(0, 3010, 1641)
$url = "https://www.awesomeminer.com/download/setup/AwesomeMinerRemoteService.msi"
$arguments = @{
    packageName    = 'awesomeminerremoteagent'
    softwareName   = 'awesomeminerremoteagent'
    url            = $url
    url64bit       = $url
    checksum       = 'd8c7822846026bf0c592bea634d95512c32df17e731ad11a20720255ffca511f'
    checksumType   = 'sha256'
    checksum64     = 'd8c7822846026bf0c592bea634d95512c32df17e731ad11a20720255ffca511f'
    checksumType64 = 'sha256'
    filetype       = 'MSI'
    silentArgs     = "/QUIET /NORESTART" 
}

Install-ChocolateyPackage @arguments -validExitCodes $validExitCodes

