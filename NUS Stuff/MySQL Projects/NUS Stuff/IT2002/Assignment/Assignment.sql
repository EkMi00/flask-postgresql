-- SELECT *
-- FROM customers c, credit_cards cre, merchants m, transactions t
-- WHERE cre.ssn = c.ssn
-- AND t.number = cre.number
-- AND t.code = m.code
-- LIMIT(100);

-- Q3 Give the SQL code for an insertion to the 
-- table merchants that violates a not null constraint
INSERT INTO merchants (code, name, country) VALUES ('98-1479529', 'Walt, Olson and Mertz', NULL);
-- ERROR: null value in column "country" of relation "merchants" violates not-null constraint

-- Q4 Give the SQL code for an update to the 
-- table transactions that violates a constraint on the table merchants
UPDATE merchants SET name = NULL;
-- ERROR: null value in column "name" of relation "merchants" violates not-null constraint

-- Q5 Give the SQL code for an insertion into the
-- table merchants that violates a primary key constraint
INSERT INTO merchants (code, name, country) VALUES ('88-1479529', 'Walt, Olson and Mertz', 'Singapore');
-- ERROR: duplicate key value violates unique constraint "merchants_pkey"

-- Q6 Give the SQL code for an update to the table 
-- transactions that violates a primary key constraint
UPDATE transactions SET identifier = 2 WHERE identifier = 1;
-- ERROR: duplicate key value violates unique constraint "transactions_pkey"

-- Q7 Find the last and first names of the different 
-- Singaporean customers. Print the result in alphabetical order of the last and first names.
SELECT DISTINCT last_name, first_name
FROM customers c
ORDER BY last_name, first_name;

-- Q8 For each Singaporean customer, find his or her 
-- first and last name and total expenditure. Implicitly 
-- ignore customers who did not use their credit cards or do not have a credit card.
SELECT c.first_name, c.last_name, SUM(t.amount)
FROM customers c, transactions t, credit_cards cc
WHERE cc.ssn = c.ssn
AND t.number = cc.number
GROUP BY c.first_name, c.last_name
ORDER BY c.first_name;

-- Q9 Find the social security number of the different customers who 
-- purchased something on Christmas day 2017 with their Visa 
-- card (the credit card type is "Visa")
SELECT *
FROM customers c, credit_cards cc, transactions t
WHERE cc.ssn = c.ssn
AND t.number = cc.number
AND t.datetime::DATE = DATE '2017-12-25'
AND cc.type = 'visa';

-- Q10 For each customer and for each credit card type, find how many
-- credit cards of that type the customer owns. Print the customer's 
-- social security number, the credit card type and the number of 
-- credit cards of the given type owned. Print zero if a customer does
-- not own a credit card of the given type.

SELECT table2.ssn, table2.type, 
(CASE WHEN table1.count_type IS NULL
THEN 0 ELSE count_type END)
FROM

(SELECT c.ssn, cc.type, 
COUNT(cc.type) AS count_type
FROM customers c, credit_cards cc
WHERE cc.ssn = c.ssn
GROUP BY c.ssn, cc.type
ORDER BY c.ssn) AS table1

RIGHT OUTER JOIN

(SELECT c.ssn, cc2.type
FROM customers c, 
(SELECT DISTINCT(cc1.type) 
FROM credit_cards cc1) AS cc2 
ORDER BY c.ssn) AS table2

ON table1.ssn = table2.ssn
AND table1.type = table2.type
ORDER BY table2.ssn, table2.type;

-- Q11 Find the code and name of different merchants who did
-- not entertain transactions for every type of credit card.
-- Do not use aggregate functions.
SELECT *
FROM merchants m, credit_cards cc, transactions t
WHERE t.number = cc.number
AND t.code = m.code
ORDER BY m.code;


-- Q12 Find the first and last names of the different customers
-- from Thailand who do not have a JCB credit card (the credit
-- card type is "jcb"). Propose five (5) different SQL queries