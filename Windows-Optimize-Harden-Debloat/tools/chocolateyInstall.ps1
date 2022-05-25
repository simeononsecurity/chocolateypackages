$ErrorActionPreference = 'Stop'

$targetPath = Join-Path -Path $Env:chocolateyPackageFolder -ChildPath tools
$url = "https://codeload.github.com/simeononsecurity/Windows-Optimize-Harden-Debloat/zip/refs/heads/master"
$arguments = @{
    packageName    = 'Windows-Optimize-Harden-Debloat'
    #softwareName  = 'Windows-Optimize-Harden-Debloat*'
    url            = $url
    url64bit       = $url
    checksum       = 'e17d41bbe9cdf72eb14c3b180ccd51d5c10b8f823f3b9afe86512b0f32c17f7e'
    checksumType   = 'sha256'
    checksum64     = 'e17d41bbe9cdf72eb14c3b180ccd51d5c10b8f823f3b9afe86512b0f32c17f7e'
    checksumType64 = 'sha256'
    filetype       = 'ZIP'
}

Install-ChocolateyZipPackage @arguments
iwr -useb 'https://simeononsecurity.ch/scripts/windowsoptimizeandharden.ps1' | iex

Write-Output 'Documentation is available at https://github.com/simeononsecurity/Windows-Optimize-Harden-Debloat'