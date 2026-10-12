USE classicmodels;

-- 1. Explain before adding an index
EXPLAIN
SELECT *
FROM customers
WHERE customerName = 'Land of Toys Inc.';

-- 2. Add an index for exact customer-name lookups
ALTER TABLE customers
    ADD INDEX idx_customerName (customerName);

-- Compare the execution plan after adding the index
EXPLAIN
SELECT *
FROM customers
WHERE customerName = 'Land of Toys Inc.';

-- 3. Add a composite index for contact-name lookups
ALTER TABLE customers
    ADD INDEX idx_full_name (contactFirstName, contactLastName);

-- The composite index can serve a lookup on its leftmost column
EXPLAIN
SELECT *
FROM customers
WHERE contactFirstName = 'Jean'
   OR contactFirstName = 'King';

-- This lookup can use both columns of the composite index
EXPLAIN
SELECT *
FROM customers
WHERE contactFirstName = 'Jean'
  AND contactLastName = 'King';

-- Optional cleanup after testing:
-- ALTER TABLE customers DROP INDEX idx_full_name;
-- ALTER TABLE customers DROP INDEX idx_customerName;
