# FlexiMart Database Schema Documentation

## 1. Entity: customers
**Purpose:** Stores all customer information.

| Attribute          | Type         | Key         | Description                       |
|-------------------|-------------|------------|-----------------------------------|
| customer_id        | INT         | PK         | Primary key, auto-increment       |
| first_name         | VARCHAR(50) |            | Customer first name               |
| last_name          | VARCHAR(50) |            | Customer last name                |
| email              | VARCHAR(100)| UNIQUE     | Customer email                    |
| phone              | VARCHAR(20) |            | Customer phone number             |
| city               | VARCHAR(50) |            | Customer city                     |
| registration_date  | DATE        |            | Date of registration              |

**Relationships:**  
* One customer can have many orders (1:M)

---

## 2. Entity: products
**Purpose:** Stores product details.

| Attribute        | Type          | Key  | Description                        |
|-----------------|--------------|------|------------------------------------|
| product_id       | INT          | PK   | Primary key, auto-increment        |
| product_name     | VARCHAR(100) |      | Product name                       |
| category         | VARCHAR(50)  |      | Product category                   |
| price            | DECIMAL(10,2)|      | Product price                      |
| stock_quantity   | INT          |      | Available stock                    |

**Relationships:**  
* One product can appear in many order_items (1:M)

---

## 3. Entity: orders
**Purpose:** Stores order-level information.

| Attribute       | Type         | Key  | Description                    |
|----------------|-------------|------|--------------------------------|
| order_id       | INT         | PK   | Primary key, auto-increment    |
| customer_id    | INT         | FK   | Links to customers table       |
| order_date     | DATE        |      | Date of order                  |
| total_amount   | DECIMAL(10,2)|      | Total order amount             |
| status         | VARCHAR(20) |      | Order status (Pending, Completed) |

**Relationships:**  
* One order can have many order_items (1:M)

---

## 4. Entity: order_items
**Purpose:** Stores product-level details for each order.

| Attribute      | Type          | Key | Description                    |
|----------------|---------------|-----|--------------------------------|
| order_item_id  | INT           | PK  | Primary key, auto-increment    |
| order_id       | INT           | FK  | Links to orders table          |
| product_id     | INT           | FK  | Links to products table        |
| quantity       | INT           |     | Quantity of the product        |
| unit_price     | DECIMAL(10,2) |     | Price per unit                 |
| subtotal       | DECIMAL(10,2) |     | quantity * unit_price          |

**Relationships:**  
* Each order_item belongs to one order and one product

---

## 5. Normalization Explanation (200–250 words)

The FlexiMart database follows **3NF (Third Normal Form)**:

1. **1NF:** All tables have atomic values; no repeating groups.  
2. **2NF:** Non-key attributes depend fully on the primary key.  
3. **3NF:** No transitive dependencies; non-key attributes do not depend on other non-key attributes.

This design avoids:

* **Insertion anomalies:** Cannot insert order without customer.  
* **Update anomalies:** Updating a product price automatically applies in all orders.  
* **Deletion anomalies:** Deleting a customer does not remove products.  

**Functional dependencies:**

* `customer_id → first_name, last_name, email, phone, city, registration_date`  
* `product_id → product_name, category, price, stock_quantity`  
* `order_id → customer_id, order_date, total_amount, status`  
* `order_item_id → order_id, product_id, quantity, unit_price, subtotal`

---

## 6. Sample Data Tables (Optional for Submission)

**Customers**

| customer_id | first_name | last_name | email             | phone        | city     | registration_date |
|------------|------------|-----------|-----------------|-------------|---------|-----------------|
| 1          | Rahul      | Sharma    | rahul.sharma@mail.com    | +91-1234567890 | Lucknow | 2024-01-05      |
| 2          | Priya     | Patel    | Priya.patel@mail.com  | +91-9876543210 | Lucknow | 2024-01-10      |

**Products**

| product_id | product_name | category   | price  | stock_quantity |
|-----------|--------------|-----------|-------|----------------|
| 1         | Laptop       | Electronics| 50000 | 10             |
| 2         | Chair        | Furniture  | 2500  | 50             |

**Orders**

| order_id | customer_id | order_date | total_amount | status    |
|----------|------------|------------|--------------|-----------|
| 1        | 1          | 2024-01-15 | 55000        | Completed |
| 2        | 2          | 2024-01-16 | 2500         | Pending   |

**Order_Items**

| order_item_id | order_id | product_id | quantity | unit_price | subtotal |
|---------------|---------|------------|---------|------------|---------|
| 1             | 1       | 1          | 1       | 50000      | 50000   |
| 2             | 1       | 2          | 2       | 2500       | 5000    |


