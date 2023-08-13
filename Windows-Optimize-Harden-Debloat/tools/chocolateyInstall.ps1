$packageName = 'Windows-Optimize-Harden-Debloat'
$url = "https://github.com/simeononsecurity/Windows-Optimize-Harden-Debloat/archive/refs/tags/4.0.2.zip"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$zipFilePath = Join-Path $toolsDir "Windows-Optimize-Harden-Debloat.zip"
$extractPath = "C:\temp\WOHD"
$extractedDirName = "Windows-Optimize-Harden-Debloat-4.0.2"
$ps1ScriptPath = Join-Path -Path (Join-Path -Path $extractPath -ChildPath $extractedDirName) -ChildPath "sos-optimize-windows.ps1"

# Download the ZIP file
$packageArgs = @{
  packageName   = $packageName
  fileType      = 'ZIP'
  url           = $url
  checksum      = 'b55a7907967679e3cc5a8966d24adb871aa9cb641778e5558926ce468fee9b97'
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

Write-Output 'Documentation is available at https://github.com/simeononsecurity/Windows-Optimize-Harden-Debloat'