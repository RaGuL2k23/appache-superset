import pandas as pd
import sqlite3

# Load your receipt data
df = pd.read_csv("receipts.csv")

# Convert to SQLite
conn = sqlite3.connect("receipts.db")
df.to_sql("receipts", conn, if_exists="replace", index=False)
conn.close()

print("✅ Done! File 'receipts.db' created.")
