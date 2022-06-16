$ErrorActionPreference = 'Stop'

$targetPath = Join-Path -Path $Env:chocolateyPackageFolder -ChildPath tools
$validExitCodes = @(0, 3010, 1641)
$url = "https://www.oldergeeks.com/downloads/files/nethor-2022.1.0-setup.exe"
$arguments = @{
    packageName    = 'nethor'
    #softwareName  = 'nethor*'
    url            = $url
    #url64bit       = $url
    checksum       = '176703c250303e43c7e29d038281494cd721ecfe8eac644a151540d6288b60a0'
    checksumType   = 'sha256'
    #checksum64     = '176703c250303e43c7e29d038281494cd721ecfe8eac644a151540d6288b60a0'
    #checksumType64 = 'sha256'
    filetype       = 'EXE'
    silentArgs     = "/SP /VERYSILENT /SUPPRESSMSGBOXES/ NOCANCEL /NORESTART" 
}

$ignoreFilePath = Join-Path -Path $targetPath -ChildPath "${Env:PROCESSOR_ARCHITECTURE}\nethor-setup.exe.ignore"
if (Test-Path -Path $ignoreFilePath) {
    Remove-Item -Path $ignoreFilePath
}
else {
    Write-Warning "Unsupported processor architecture: $Env:PROCESSOR_ARCHITECTURE"
}

Install-ChocolateyPackage @arguments -validExitCodes $validExitCodes

Write-Output 'The Nethor documentation is available at https://nethor.com/'