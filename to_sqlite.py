import pandas as pd
import sqlite3

# Load your receipt data
# name = "receipts"

name = "weather"
name = 'GlobalWeatherRepository'


df = pd.read_csv(f"{name}.csv")

# Convert to SQLite
conn = sqlite3.connect(f"{name}.db")
df.to_sql("receipts", conn, if_exists="replace", index=False)
conn.close()

print("✅ Done! File 'receipts.db' created.")
