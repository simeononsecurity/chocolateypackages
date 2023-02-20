$targetPath = Get-ToolsLocation
$validExitCodes = @(0, 3010, 1641)
$url = "https://www.awesomeminer.com/download/setup/AwesomeMinerRemoteService.msi"
$arguments = @{
    packageName    = 'awesomeminerremoteagent'
    softwareName   = 'awesomeminerremoteagent'
    url            = $url
    #url64bit       = $url
    checksum       = 'CACCB7EBB1DB126B06D25729DADCFDF55E42993CC7BA6E146242023F358819E3'
    checksumType   = 'sha256'
    # checksum64     = 'CACCB7EBB1DB126B06D25729DADCFDF55E42993CC7BA6E146242023F358819E3'
    # checksumType64 = 'sha256'
    filetype       = 'MSI'
    silentArgs     = "/QUIET /NORESTART" 
}

Install-ChocolateyPackage @arguments -validExitCodes $validExitCodes -ErrorActionPreference 'Stop'

