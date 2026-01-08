# FlexiMart Data Architecture Project

**Student Name:** Kaushambi Maurya  
**Student ID:** BITSoM_BA_25071910  
**Email:** kaushambi.maurya@gmail.com  
**Date:** 07-01-2026  

## Project Overview

This project implements an end-to-end data architecture solution for FlexiMart.
It includes data extraction, cleaning, relational database design, and data warehouse modeling for analytical reporting.
Part 2 (NoSQL/MongoDB operations) is planned but not implemented in this submission.

## Repository Structure
├── part1-database-etl/
│   ├── etl_pipeline.py
│   ├── schema_documentation.md
│   ├── business_queries.sql
│   └── data_quality_report.txt
├── part2-nosql/
│   ├── nosql_analysis.md
│   ├── mongodb_operations.js  # Planned, not yet implemented
│   └── products_catalog.json
├── part3-datawarehouse/
│   ├── star_schema_design.md
│   ├── warehouse_schema.sql
│   ├── warehouse_data.sql
│   └── analytics_queries.sql
└── README.md

## Technologies Used

- Python 3.x, pandas, mysql-connector-python
- MySQL 8.0
- (MongoDB 6.0 – planned for future implementation)

## Setup Instructions

### Database Setup

```bash
# Create databases
mysql -u root -p -e "CREATE DATABASE fleximart;"
mysql -u root -p -e "CREATE DATABASE fleximart_dw;"

# Run Part 1 - ETL Pipeline
python part1-database-etl/etl_pipeline.py

# Run Part 1 - Business Queries
mysql -u root -p fleximart < part1-database-etl/business_queries.sql

# Run Part 3 - Data Warehouse
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql

# Part 2 - Mongodb operation
#### MongoDB Setup

```bash
#MongoDB operations are planned for future implementation
#mongosh < part2-nosql/mongodb_operations.js


******** Key Learnings :-********

1. Learned to build a complete ETL pipeline using Python and MySQL.

2. Gained experience in data cleaning, transformation, and loading into a relational database.

3. Understood how to design a star schema for a data warehouse and write analytical queries.

4. Learned the importance of documenting project structure and workflow clearly.

***********Challenges Faced:-************

1. Handling missing and inconsistent data in raw CSV files – solved using pandas cleaning techniques.

2. Designing the star schema for the data warehouse – solved by correctly identifying fact and dimension tables.

3. Unable to implement MongoDB (Part 2) due to time constraints – noted as planned for future implementation.