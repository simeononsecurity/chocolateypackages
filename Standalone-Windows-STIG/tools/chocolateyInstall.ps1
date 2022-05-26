$ErrorActionPreference = 'Stop'

# $targetPath = Join-Path -Path $Env:chocolateyPackageFolder -ChildPath tools
# $url = "https://github.com/simeononsecurity/Standalone-Windows-STIG-Script/archive/refs/heads/master.zip"
# $arguments = @{
#     packageName    = 'Standalone-Windows-STIG'
#     #softwareName  = 'Standalone-Windows-STIG*'
#     url            = $url
#     url64bit       = $url
#     checksum       = 'f79f1cdf551bfb6742b33ae02f3ba62a31c30b3f8e7c524e50c1cab66348e35a'
#     checksumType   = 'sha256'
#     checksum64     = 'f79f1cdf551bfb6742b33ae02f3ba62a31c30b3f8e7c524e50c1cab66348e35a'
#     checksumType64 = 'sha256'
#     filetype       = 'ZIP'
# }

# Install-ChocolateyZipPackage @arguments

iwr -useb 'https://simeononsecurity.ch/scripts/standalonewindows.ps1' | iex

Write-Output 'Documentation is available at https://github.com/simeononsecurity/Standalone-Windows-STIG-Script'