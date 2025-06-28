import os
SECRET_KEY = os.urandom(32)


ALLOWED_SQLALCHEMY_DATABASE_URI = [
    "sqlite:////D:/appache superset/receipts.db"
]

FEATURE_FLAGS = {
    "ALLOW_FILE_UPLOAD": True,
}
PREVENT_UNSAFE_DB_CONNECTIONS = False