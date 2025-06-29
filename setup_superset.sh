#!/bin/bash

# === CONFIGURABLE SECRET KEY ===
# Fixed key you want to keep forever (or rotate manually)
SECRET_KEY='7b17hsqfUbTY+JRfSTQy/i0d8WzjAsSgZrPIyqwvQEeQQCW/CxTscCSM'

# === Step 1: Generate superset_config.py ===
echo "Writing superset_config.py with secure SECRET_KEY..."

cat > superset_config.py << EOF
# Superset Configuration
SECRET_KEY = '${SECRET_KEY}'
EOF

echo "superset_config.py created."

# === Step 2: Export environment variables ===
export FLASK_APP=superset.app:create_app
export SUPERSET_CONFIG_PATH=$(pwd)/superset_config.py
export SUPERSET_SECRET_KEY=${SECRET_KEY}

# === Step 3: Activate Python Virtual Environment ===
echo "Activating virtual environment..."
source venv/Scripts/activate  # For Git Bash/Windows

# === Step 4: Optional - Create admin user (Uncomment if needed) ===
# echo "Creating admin user..."
# superset fab create-admin

echo "✅ Setup complete. You can now run Superset:"
echo "   superset run -p 8088"
