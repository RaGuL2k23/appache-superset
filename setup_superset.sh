#!/bin/bash

# 1. Generate a strong SECRET_KEY and write it to superset_config.py
echo "Generating superset_config.py with secure SECRET_KEY..."

cat > superset_config.py << EOF
import os

# Generate or set a fixed secure key
SECRET_KEY = os.environ.get('SUPERSET_SECRET_KEY', '$(openssl rand -base64 42)')

EOF

echo "superset_config.py created."

# 2. Export environment variables
export FLASK_APP=superset
export SUPERSET_CONFIG_PATH=$(pwd)/superset_config.py
export SUPERSET_SECRET_KEY=$(openssl rand -base64 42)

# 3. Activate your Python virtual environment - change path if needed
echo "Activating virtual environment..."
source venv/bin/activate

# 4. Create admin user
echo "Creating admin user for Superset..."
superset fab create-admin

echo "Done! If successful, you can now run Superset."
