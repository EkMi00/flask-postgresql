SELECT c.ssn Customer_ssn, c.first_name, c.last_name, c.country,
cc.number credit_card_no, cc.type credit_card_type,
m.code merchant_code, m.name merchant_name, m.country merchant_country,
t.identifier transaction_ID, t.datetime transaction_datetime, t.amount transaction_amount
FROM customers c, credit_cards cc, merchants m, transactions t
WHERE t.number = cc.number
AND t.code = m.code
AND cc.ssn = c.ssn
LIMIT(1000);

-- Q3 Give the SQL code for an insertion to the 
-- table merchants that violates a not null constraint
INSERT INTO merchants (code, name, country) VALUES ('98-1479529', 'Walt, Olson and Mertz', NULL);
-- ERROR: null value in column "country" of relation "merchants" violates not-null constraint

-- Q4 Give the SQL code for an update to the 
-- table transactions that violates a constraint 
-- on the table merchants.
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
-- purchased something on Christmas day 2017 with their Visa credit
-- card (the credit card type is "Visa")
SELECT DISTINCT c.ssn
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
SELECT table1.ssn, table1.type, 
(CASE WHEN table2.count_type IS NULL
THEN 0 ELSE count_type END)
FROM

(SELECT c.ssn, cc2.type
FROM customers c, 
(SELECT DISTINCT(cc1.type) 
FROM credit_cards cc1) AS cc2 
ORDER BY c.ssn) AS table1

LEFT OUTER JOIN

(SELECT c.ssn, cc.type, 
COUNT(cc.type) AS count_type
FROM customers c, credit_cards cc
WHERE cc.ssn = c.ssn
GROUP BY c.ssn, cc.type
ORDER BY c.ssn) AS table2

ON table1.ssn = table2.ssn
AND table1.type = table2.type
ORDER BY table1.ssn, table1.type;

-- Q11 Find the code and name of different merchants who did
-- not entertain transactions for every type of credit card.
-- Do not use aggregate functions.
SELECT DISTINCT table1.code, table1.name
FROM

(SELECT DISTINCT m.code, m.name, cc.type
FROM credit_cards cc, merchants m
ORDER BY m.code, cc.type) AS table1

LEFT OUTER JOIN

(SELECT DISTINCT m.code, cc.type
FROM credit_cards cc, merchants m, transactions t
WHERE t.number = cc.number
AND t.code = m.code
ORDER BY m.code, cc.type) AS table2


ON table1.code = table2.code
AND table1.type = table2.type
WHERE table2.type IS NULL
ORDER BY table1.code;



-- SELECT m.code, m.name
-- FROM merchants m, credit_cards cc, transactions t
-- WHERE t.number = cc.number
-- AND t.code = m.code
-- GROUP BY m.code
-- HAVING COUNT(DISTINCT cc.type) < 16
-- ORDER by m.code;


-- Q12 Find the first and last names of the different customers
-- from Thailand who do not have a JCB credit card (the credit
-- card type is "jcb"). Propose five (5) different SQL queries

-- Method 1
SELECT DISTINCT c.first_name, c.last_name
FROM customers c, credit_cards cc, merchants m, transactions t
WHERE t.number = cc.number
AND t.code = m.code
AND cc.ssn = c.ssn
AND c.country = 'Thailand'
AND cc.type != 'jcb'
ORDER BY c.first_name

-- Method 2
SELECT DISTINCT c.first_name, c.last_name
FROM customers c, credit_cards cc, merchants m, transactions t
WHERE t.number = cc.number
AND t.code = m.code
AND cc.ssn = c.ssn
AND c.country = 'Thailand'
INTERSECT
SELECT DISTINCT c.first_name, c.last_name
FROM customers c, credit_cards cc, merchants m, transactions t
WHERE t.number = cc.number
AND t.code = m.code
AND cc.ssn = c.ssn
AND cc.type != 'jcb'

-- Method 3
SELECT DISTINCT c.first_name, c.last_name
FROM customers c
WHERE c.ssn IN (
    SELECT cc.ssn
    FROM credit_cards cc
    WHERE c.ssn = cc.ssn
    AND c.country = 'Thailand'
    AND cc.type != 'jcb'
)
-- SELECT c.first_name, c.last_name
-- FROM customers c, credit_cards cc, merchants m, transactions t
-- WHERE t.number = cc.number
-- AND t.code = m.code
-- AND cc.ssn = c.ssn
-- EXCEPT
-- (SELECT c.first_name, c.last_name
-- FROM customers c, credit_cards cc, merchants m, transactions t
-- WHERE t.number = cc.number
-- AND t.code = m.code
-- AND cc.ssn = c.ssn
-- AND (c.country != 'Thailand'
-- OR cc.type = 'jcb'))

-- Method 4
SELECT DISTINCT c.first_name, c.last_name
FROM customers c
WHERE EXISTS (
    SELECT cc.type card_type 
    FROM credit_cards cc
    WHERE c.ssn = cc.ssn
    AND c.country = 'Thailand'
    AND cc.type != 'jcb'
)
ORDER BY c.first_name

-- Method 5
SELECT DISTINCT c.first_name, c.last_name
FROM customers c
WHERE c.ssn = ANY (
    SELECT cc.ssn
    FROM credit_cards cc
    WHERE c.ssn = cc.ssn
    AND c.country = 'Thailand'
    AND cc.type != 'jcb'
)