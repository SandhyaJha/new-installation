# Run PowerShell as administrator
# Install all packages silently without prompts
Get-Content windows_packages.txt | 
Select-String "winget$" | 
ForEach-Object { 
    $id = ($_ -split '\s+')[1]  # Extract the package ID
    winget install --id $id --silent --accept-source-agreements --accept-package-agreements
}

