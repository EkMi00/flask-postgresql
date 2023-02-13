-- USE sql_store;

-- SELECT *
-- FROM customers;
-- WHERE customer_id = 1
-- ORDER BY first_name

-- SELECT first_name, last_name, points + 10
-- SELECT 
-- 	first_name, 
--     last_name, 
-- 	points % 2 AS discount_factor -- AS is alias, changes column name
-- FROM customers

-- UPDATE `sql_store`.`customers` SET `state` = 'VA' WHERE (`customer_id` = '1');
-- SELECT DISTINCT state
-- FROM customers

SELECT *
FROM customers
-- WHERE points > 3000  OR state = 'VA'
-- WHERE state = 'VA'
WHERE NOT (birth_date > '1990-01-01' AND points > 1000)-- AND > OR precedence
