
-- Query 1: Customer Purchase History
-- Business Question:
-- Generate a report showing each customer's name, email,
-- total number of transactions, and total amount spent.
-- Include only customers with at least 2 transactions
-- and total spending greater than ₹5000.
-- =====================================================

SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    COUNT(s.transaction_id) AS total_orders,
    SUM(s.quantity * s.unit_price) AS total_spent
FROM customers c
JOIN sales s
    ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email
HAVING COUNT(s.transaction_id) >= 2
   AND SUM(s.quantity * s.unit_price) > 5000
ORDER BY total_spent DESC;


-- =====================================================
-- Query 2: Product Sales Analysis
-- Business Question:
-- For each product category, show number of products sold,
-- total quantity sold, and total revenue generated.
-- Include only categories with revenue greater than ₹10000.
-- =====================================================

SELECT
    p.category,
    COUNT(DISTINCT p.product_id) AS num_products,
    SUM(s.quantity) AS total_quantity_sold,
    SUM(s.quantity * s.unit_price) AS total_revenue
FROM products p
JOIN sales s
    ON p.product_id = s.product_id
GROUP BY p.category
HAVING SUM(s.quantity * s.unit_price) > 10000
ORDER BY total_revenue DESC;


-- =====================================================
-- Query 3: Monthly Sales Trend
-- Business Question:
-- Show monthly sales trends for the year 2024,
-- including total orders, monthly revenue,
-- and cumulative revenue.
-- =====================================================

SELECT
    MONTHNAME(s.transaction_date) AS month_name,
    COUNT(s.transaction_id) AS total_orders,
    SUM(s.quantity * s.unit_price) AS monthly_revenue,
    SUM(SUM(s.quantity * s.unit_price))
        OVER (ORDER BY MONTH(s.transaction_date)) AS cumulative_revenue
FROM sales s
WHERE YEAR(s.transaction_date) = 2024
GROUP BY
    MONTH(s.transaction_date),
    MONTHNAME(s.transaction_date)
ORDER BY MONTH(s.transaction_date);
