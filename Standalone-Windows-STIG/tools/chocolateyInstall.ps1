$packageName = 'Standalone-Windows-STIG'
$url = "https://github.com/simeononsecurity/Standalone-Windows-STIG-Script/archive/refs/tags/1.0.2.zip"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$zipFilePath = Join-Path $toolsDir "Standalone-Windows-STIG.zip"
$extractPath = "C:\temp\WS"
$extractedDirName = "Standalone-Windows-STIG-1.0.2"
$ps1ScriptPath = Join-Path -Path (Join-Path -Path $extractPath -ChildPath $extractedDirName) -ChildPath "secure-standalone.ps1"

# Download the ZIP file
$packageArgs = @{
  packageName   = $packageName
  fileType      = 'ZIP'
  url           = $url
  checksum      = '1059a0b624d681d36c2f803d0d72a4282727e442bade6f43dcc725078a3bc64b'
  checksumType  = 'sha256'
  unzipLocation = $extractPath  # Specify the unzip location here
  confirm       = $false     # Disable confirmation prompt
}

#Remove Path Limit
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -PropertyType "DWORD" -Value "1" -Force

# Check if the folder already exists
if (-not (Test-Path $extractPath)) {
    # Create the folder
    New-Item -Path $extractPath -ItemType Directory -Force
}

Install-ChocolateyZipPackage @packageArgs

# Run the script
Invoke-Expression -Command "powershell.exe -ExecutionPolicy Bypass -File '$ps1ScriptPath'"

# Clean up: Remove the downloaded ZIP file
Remove-Item -Path $zipFilePath -Force

Write-Output 'Documentation is available at https://github.com/simeononsecurity/Standalone-Windows-STIG-Script'