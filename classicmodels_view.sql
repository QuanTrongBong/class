USE classicmodels;

-- Create a view with basic customer contact details
CREATE OR REPLACE VIEW customer_views AS
SELECT customerNumber, customerName, phone
FROM customers;

SELECT *
FROM customer_views;

-- Update the view to include contact names for customers in Nantes
CREATE OR REPLACE VIEW customer_views AS
SELECT customerNumber, customerName, contactFirstName, contactLastName, phone
FROM customers
WHERE city = 'Nantes';

SELECT *
FROM customer_views;

-- Optional: remove the view when you no longer need it
-- DROP VIEW customer_views;
