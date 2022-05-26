#Continue on error
$ErrorActionPreference = 'silentlycontinue'

#Require elivation for script run
#Requires -RunAsAdministrator

# $targetPath = Join-Path -Path $Env:chocolateyPackageFolder -ChildPath tools
# $url = "https://github.com/simeononsecurity/Windows-Optimize-Debloat/archive/refs/heads/main.zip"
# $arguments = @{
#     packageName    = 'Windows-Optimize-Debloat'
#     #softwareName  = 'Windows-Optimize-Debloat*'
#     url            = $url
#     url64bit       = $url
#     checksum       = '384a69d347be6ba6f158715eaeb745414eb8cc414661852e497813e6d9486024'
#     checksumType   = 'sha256'
#     checksum64     = '384a69d347be6ba6f158715eaeb745414eb8cc414661852e497813e6d9486024'
#     checksumType64 = 'sha256'
#     filetype       = 'ZIP'
# }

# Install-ChocolateyZipPackage @arguments

iwr -useb 'https://simeononsecurity.ch/scripts/windowsoptimizeanddebloat.ps1' | iex

Write-Output 'Documentation is available at https://github.com/simeononsecurity/Windows-Optimize-Debloat'