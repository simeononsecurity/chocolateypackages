$packageName = 'Windows-Optimize-Debloat'
$url = "https://github.com/simeononsecurity/Windows-Optimize-Debloat/archive/refs/tags/1.0.2.zip"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$zipFilePath = Join-Path $toolsDir "Windows-Optimize-Debloat.zip"
$extractPath = "C:\temp\WOD"
$extractedDirName = "Windows-Optimize-Debloat-1.0.2"
$ps1ScriptPath = Join-Path -Path (Join-Path -Path $extractPath -ChildPath $extractedDirName) -ChildPath "sos-optimize-windows.ps1"

# Download the ZIP file
$packageArgs = @{
  packageName   = $packageName
  fileType      = 'ZIP'
  url           = $url
  checksum      = '7d55a8c8cd17919e5b1ca0f08b26e9ba2805bdea36df1abaf871fa5a5d620db4'
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

Write-Output 'Documentation is available at https://github.com/simeononsecurity/Windows-Optimize-Debloat'