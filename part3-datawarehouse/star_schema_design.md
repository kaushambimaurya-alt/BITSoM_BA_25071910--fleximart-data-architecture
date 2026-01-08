##  Star Schema Design – FlexiMart Data Warehouse


## Section 1: Star Schema Overview

### FACT TABLE: fact_sales

Grain:
One record represents a single product sold in a single order (line-item level).

Business Process:
This table captures all sales transactions made by customers.

Measures (Numeric Facts):
- quantity_sold: Number of units sold
- unit_price: Price per unit at the time of sale
- discount_amount: Discount applied on the transaction
- total_amount: Final sales value after discount

Foreign Keys:
- date_key → dim_date
- product_key → dim_product
- customer_key → dim_customer

---

### DIMENSION TABLE: dim_date

Purpose:
Supports time-based analysis such as daily, monthly, quarterly, and yearly sales trends.

Attributes:
- date_key (PK): Surrogate key in YYYYMMDD format
- full_date: Actual calendar date
- day_of_week: Name of the day
- day_of_month: Numeric day
- month: Month number
- month_name: Name of the month
- quarter: Quarter of the year (Q1–Q4)
- year: Year value
- is_weekend: Indicates weekend or weekday

---

### DIMENSION TABLE: dim_product

Purpose:
Stores descriptive information related to products.

Attributes:
- product_key (PK): Surrogate product key
- product_id: Business product identifier
- product_name: Name of the product
- category: Product category
- subcategory: Product sub-type
- unit_price: Standard price of the product

---

### DIMENSION TABLE: dim_customer

Purpose:
Stores customer demographic and segmentation details.

Attributes:
- customer_key (PK): Surrogate customer key
- customer_id: Business customer identifier
- customer_name: Full name of customer
- city: City of residence
- state: State of residence
- customer_segment: Customer type (Retail, Corporate, etc.)

---

## Section 2: Design Decisions

The fact table is designed at the transaction line-item level to allow detailed analysis of sales by product, customer, and time. 
This granularity helps in performing drill-down analysis and understanding customer purchasing behavior.

Surrogate keys are used in all dimension tables to improve query performance and isolate the data warehouse from changes in source system identifiers. 
This also ensures consistent joins between fact and dimension tables.

The star schema structure was chosen because it simplifies query design and improves performance for analytical workloads. 
It enables easy roll-up and drill-down operations across different dimensions, making it suitable for business intelligence and reporting needs.

---

## Section 3: Sample Data Flow

### Source Transaction:
Order ID: 101  
Customer: John Doe  
Product: Laptop  
Quantity: 2  
Unit Price: 50,000  
Order Date: 15-Jan-2024  

### Data Warehouse Representation:

fact_sales:
- date_key: 20240115
- product_key: 5
- customer_key: 12
- quantity_sold: 2
- unit_price: 50000
- discount_amount: 0
- total_amount: 100000

dim_date:
- date_key: 20240115
- month: January
- quarter: Q1
- year: 2024

dim_product:
- product_key: 5
- product_name: Laptop
- category: Electronics

dim_customer:
- customer_key: 12
- customer_name: John Doe
- city: Mumbai

