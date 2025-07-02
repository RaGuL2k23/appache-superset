# setenv.ps1

# Set FLASK_APP
$env:FLASK_APP = "superset"

# Set SUPERSET_CONFIG_PATH to current working directory
$currentDir = Get-Location
$env:SUPERSET_CONFIG_PATH = Join-Path $currentDir "superset_config.py"

Write-Output "Environment variables set:"
Write-Output "FLASK_APP=$env:FLASK_APP"
Write-Output "SUPERSET_CONFIG_PATH=$env:SUPERSET_CONFIG_PATH"



# Then in your PowerShell terminal, run this (only once per session):

# powershell
# Copy
# Edit
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# . .\setenv.ps1
