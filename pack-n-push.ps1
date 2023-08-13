# This script removes all nuPkg packages recursively

# Main script
$targetFolder = $PSScriptRoot

$nuspecFolders = Get-ChildItem -Path $targetFolder -Recurse -Directory | Where-Object { Test-Path (Join-Path $_.FullName "*.nuspec") }
Remove-Item (Get-ChildItem -Path $nuspecFolders -Recurse -Include *.nupkg)

foreach ($folder in $nuspecFolders) {
    $folderPath = $folder.FullName
    Write-Host "Processing folder: $folderPath"
    
    Set-Location $folderPath
    
    try {
        try{

            Write-Host "NuSpec packages removed successfully from: $folderPath" -ForegroundColor Green
        } catch {
            Set-Location $targetFolder
        }
        choco pack
        choco push --source=https://push.chocolatey.org/
        Write-Host "Choco pack and push completed for: $folderPath" -ForegroundColor Green
    } catch {
        Write-Host "Error processing folder $folderPath" -ForegroundColor Red
        Set-Location $targetFolder
    }
}

Write-Host "Script completed."
