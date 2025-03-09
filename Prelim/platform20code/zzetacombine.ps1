# Write-Output "Combined files into $outputFile"
# Define the output file
$outputFile = "zzetacombined.tf"

# Check if the file exists and remove it if it does
if (Test-Path $outputFile) {
    Remove-Item $outputFile -Force
    Write-Output "$outputFile already existed and was deleted."
}

# Combine root-level .tf files
Get-ChildItem -Path . -Filter "*.tf" | ForEach-Object {
    Add-Content -Path $outputFile -Value "### File: $($_.Name) ###"
    Get-Content $_.FullName | Add-Content $outputFile
    Add-Content $outputFile -Value "`n"
}

# Combine module .tf files
Get-ChildItem -Path ".\modules" -Directory | ForEach-Object {
    $moduleName = $_.Name
    Get-ChildItem -Path $_.FullName -Filter "*.tf" | ForEach-Object {
        Add-Content -Path $outputFile -Value "### File: modules\$moduleName\$($_.Name) ###"
        Get-Content $_.FullName | Add-Content $outputFile
        Add-Content $outputFile -Value "`n"
    }
}

Write-Output "Combined files into $outputFile"

