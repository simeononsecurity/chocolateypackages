$packageName = 'Standalone-Windows-Server-STIG'
$url = "https://github.com/simeononsecurity/Standalone-Windows-Server-STIG-Script/archive/refs/tags/1.0.0.zip"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$zipFilePath = Join-Path $toolsDir "Standalone-Windows-Server-STIG-Script.zip"
$extractPath = "C:\temp\WSS"
$extractedDirName = "Standalone-Windows-Server-STIG-Script-1.0.0"
$ps1ScriptPath = Join-Path -Path (Join-Path -Path $extractPath -ChildPath $extractedDirName) -ChildPath "sos-secure-standalone-server.ps1"

# Download the ZIP file
$packageArgs = @{
  packageName   = $packageName
  fileType      = 'ZIP'
  url           = $url
  checksum      = '98823c5e316ba7d3bb2013c387420eb8411546c242ebabc05d8b05b32bba7b8e'
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
