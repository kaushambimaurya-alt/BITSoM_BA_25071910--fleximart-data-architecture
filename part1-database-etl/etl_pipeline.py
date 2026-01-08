# etl_pipeline.py
import pandas as pd
import os

print("Starting ETL pipeline...")

# Step 0: Set base folder (where your CSVs are)
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

# Step 1: Load raw CSV files
try:
    customers_path = os.path.join(BASE_DIR, "customers_raw.csv")
    products_path = os.path.join(BASE_DIR, "products_raw.csv")
    sales_path = os.path.join(BASE_DIR, "sales_raw.csv")

    print("Extracting data...")
    customers = pd.read_csv(customers_path)
    products = pd.read_csv(products_path)
    sales = pd.read_csv(sales_path)
except FileNotFoundError as e:
    print(f"ERROR: {e}")
    print("Make sure your CSV files are in the same folder as this script.")
    exit(1)

print("Data extraction completed.\n")

# Step 2: Inspect data (optional, but good practice)
print("Customers data sample:")
print(customers.head(), "\n")

print("Products data sample:")
print(products.head(), "\n")

print("Sales data sample:")
print(sales.head(), "\n")

# Step 3: Basic cleaning (remove duplicates & handle missing values)
customers.drop_duplicates(inplace=True)
products.drop_duplicates(inplace=True)
sales.drop_duplicates(inplace=True)

customers.fillna("", inplace=True)
products.fillna(0, inplace=True)
sales.fillna(0, inplace=True)

print("Data cleaning completed.\n")

# Step 4: Simple transformations (example)
# Convert transaction_date to datetime
sales['transaction_date'] = pd.to_datetime(sales['transaction_date'], errors='coerce')

# Calculate total sales per row
sales['total_amount'] = sales['quantity'] * sales['unit_price']

print("Data transformation completed.\n")

# Step 5: Save cleaned CSVs (optional, for ETL checkpoints)
cleaned_dir = os.path.join(BASE_DIR, "cleaned_data")
os.makedirs(cleaned_dir, exist_ok=True)

customers.to_csv(os.path.join(cleaned_dir, "customers_cleaned.csv"), index=False)
products.to_csv(os.path.join(cleaned_dir, "products_cleaned.csv"), index=False)
sales.to_csv(os.path.join(cleaned_dir, "sales_cleaned.csv"), index=False)

print("Cleaned data saved to 'cleaned_data' folder.\n")
print("ETL pipeline completed successfully!")

# Step 6: Data Quality Report
report_path = os.path.join(BASE_DIR, "data_quality_report.txt")

with open(report_path, "w") as f:
    f.write("=== DATA QUALITY REPORT ===\n\n")

    # Customers
    f.write("Customers Records Processed: {}\n".format(len(customers)))
    f.write("Duplicates Removed: {}\n".format(customers.duplicated().sum()))
    f.write("Missing Emails Dropped: {}\n".format(customers['email'].isna().sum()))
    f.write("Records Loaded: {}\n\n".format(len(customers)))

    # Products
    f.write("Products Records Processed: {}\n".format(len(products)))
    f.write("Duplicates Removed: {}\n".format(products.duplicated().sum()))
    f.write("Missing Prices Dropped: {}\n".format(products['price'].isna().sum()))
    f.write("Stock Defaults Applied: {}\n\n".format(products['stock_quantity'].isna().sum()))
    f.write("Records Loaded: {}\n\n".format(len(products)))

    # Sales
    f.write("Sales Records Processed: {}\n".format(len(sales)))
    f.write("Duplicates Removed: {}\n".format(sales.duplicated().sum()))
    f.write("Invalid Foreign Keys Dropped: {}\n".format(sales[['customer_id','product_id']].isna().sum().sum()))
    f.write("Records Loaded: {}\n".format(len(sales)))

print(f"Data quality report generated at: {report_path}")

