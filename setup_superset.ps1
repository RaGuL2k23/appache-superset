# === CONFIGURABLE SECRET KEY ===
# Fixed key you want to keep forever (or rotate manually)
$SECRET_KEY = '7b17hsqfUbTY+JRfSTQy/i0d8WzjAsSgZrPIyqwvQEeQQCW/CxTscCSM'

# === Step 1: Generate superset_config.py ===
Write-Host "Writing superset_config.py with secure SECRET_KEY..."

@"
# Superset Configuration
SECRET_KEY = '$SECRET_KEY'
"@ | Set-Content -Encoding UTF8 -Path "superset_config.py"

Write-Host "superset_config.py created."

# === Step 2: Export environment variables ===
$env:FLASK_APP = "superset.app:create_app"
$env:SUPERSET_CONFIG_PATH = Join-Path (Get-Location) "superset_config.py"
$env:SUPERSET_SECRET_KEY = $SECRET_KEY

# === Step 3: Activate Python Virtual Environment ===
Write-Host "Activating virtual environment..."

# For Windows virtual envs:
. .\venv\Scripts\Activate.ps1

# === Step 4: Optional - Create admin user (Uncomment if needed) ===
# Write-Host "Creating admin user..."
# superset fab create-admin

# === Step 5: Success message ===
Write-Host "`n✅ Setup complete. You can now run Superset:"
Write-Host "   superset run -p 8088"
