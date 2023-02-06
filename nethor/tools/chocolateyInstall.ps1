$ErrorActionPreference = 'Stop'

$targetPath = Join-Path -Path $Env:chocolateyPackageFolder -ChildPath tools
$validExitCodes = @(0, 3010, 1641)
$url = "https://www.oldergeeks.com/downloads/download.php?id=3689"
$arguments = @{
    packageName    = 'nethor'
    #softwareName  = 'nethor*'
    url            = $url
    #url64bit       = $url
    checksum       = '2F904100EB3118B16D66BAC1EA4BE8D92D089EE821B9219BC609C702151DD998'
    checksumType   = 'sha256'
    #checksum64     = '2F904100EB3118B16D66BAC1EA4BE8D92D089EE821B9219BC609C702151DD998'
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
