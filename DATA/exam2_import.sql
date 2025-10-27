-- ==========================================================
-- exam2_import.sql
-- Exam 2 Starter Schema + Data (Bike Shop Context)
-- Simplified: customers, products, and customer_totals
--
-- Row counts after import:
--   customers: 2
--   products:  3
--   customer_totals: 2
--
-- Totals by customer:
--   Penny Farthing  -> order_count=3, total_spent=164.49
--   Spokes McGee    -> order_count=1, total_spent=24.50
-- ==========================================================

CREATE DATABASE IF NOT EXISTS exam2 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE exam2;

SET NAMES utf8mb4;
SET SQL_MODE = 'STRICT_ALL_TABLES';

DROP TABLE IF EXISTS customer_totals;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- Customers
CREATE TABLE customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(60) NOT NULL,
  last_name  VARCHAR(60) NOT NULL,
  email      VARCHAR(120),
  UNIQUE KEY uq_customers_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Products
CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name  VARCHAR(120) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  UNIQUE KEY uq_products_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Precomputed totals for customers (no calculations required)
CREATE TABLE customer_totals (
  customer_id INT PRIMARY KEY,
  order_count INT NOT NULL,
  total_spent DECIMAL(10,2) NOT NULL,
  CONSTRAINT fk_totals_customer
    FOREIGN KEY (customer_id) REFERENCES customers(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------------------------------------
-- Data
-- ----------------------------------------------------------

-- Punny customers
INSERT INTO customers (first_name, last_name, email) VALUES
  ('Penny',  'Farthing', 'p.farthing@example.com'),
  ('Spokes', 'McGee',    's.mcgee@example.com');

-- Products (match example output)
INSERT INTO products (name, price) VALUES
  ('Road Helmet', 49.99),
  ('Alloy Pedals', 24.50),
  ('Trail Tires',  35.00);

-- Totals already provided
INSERT INTO customer_totals (customer_id, order_count, total_spent) VALUES
  (1, 3, 164.49),
  (2, 1, 24.50);

-- ----------------------------------------------------------
-- Optional sanity checks (for instructor use only)
-- SELECT * FROM customers;
-- SELECT * FROM products;
-- SELECT * FROM customer_totals;
-- ----------------------------------------------------------