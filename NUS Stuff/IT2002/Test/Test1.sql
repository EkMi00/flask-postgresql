SELECT *
FROM customers c, credit_cards cc,
merchants m, transactions t
WHERE t.code = m.code
AND t.number = cc.number
AND cc.ssn = c.ssn;

-- Q2
INSERT INTO customers (ssn, first_name, last_name, country) VALUES ('111-11-1112', 'John', 'Doe', 'Singapore');
DELETE FROM customers c
WHERE c.ssn = '111-11-1112'

-- Q3
    UPDATE customers SET ssn = NULL;

-- Q4
SELECT DISTINCT c.first_name, c.last_name
FROM customers c
WHERE EXISTS (
    SELECT cc.type
    FROM credit_cards cc
    WHERE cc.type = 'jcb'
    AND cc.ssn = c.ssn
)
INTERSECT 
SELECT DISTINCT c.first_name, c.last_name
FROM customers c
WHERE EXISTS (
    SELECT cc.type
    FROM credit_cards cc
    WHERE cc.type = 'visa'
    AND cc.ssn = c.ssn
)

-- q5
SELECT c.ssn
FROM customers c
WHERE EXISTS (
    SELECT *
    FROM customers c2
    WHERE c2.first_name = c.first_name
    AND c2.last_name = c.last_name
    AND NOT c2.ssn = c.ssn
)

-- Q6
SELECT c.ssn, COUNT(cc.*)
FROM customers c, credit_cards cc
WHERE c.ssn = cc.ssn
GROUP BY c.ssn

--Q7
SELECT c.country, COUNT(C.*)
FROM customers c, merchants m
WHERE c.country != m.country
AND EXISTS (
    SELECT *
    FROM transactions t, credit_cards cc
    WHERE t.number = cc.number
    AND t.code = m.code
    AND cc.ssn = c.ssn
)
GROUP BY c.country;

--Q9
SELECT cc.type, t.identifier
FROM credit_cards cc, transactions t
WHERE cc.number = t.number
AND t.amount >= ALL(
    SELECT t2.amount
    FROM credit_cards cc2, transactions t2
    WHERE cc2.number = t2.number
    AND cc2.type = cc.type
)
GROUP BY cc.type, t.identifier;

--Q8
SELECT cc.type, t.identifier
FROM credit_cards cc, transactions t
WHERE cc.number = t.number

--Q10
SELECT DISTINCT m.code, m.name
FROM merchants m 
WHERE NOT EXISTS (
    SELECT *
    FROM credit_cards cc2
    WHERE (cc2.type = 'visa' OR cc2.type = 'diners-club%')
    AND EXISTS (
        SELECT *
        FROM transactions t
        WHERE t.number = cc2.number
        AND t.code = m.code
        AND t.amount >= 888) )
ORDER BY m.code, m.name;

--Q11
SELECT c.first_name, c.last_name,
SUM(t.amount) AS amount
FROM customers c, credit_cards cc, transactions t
WHERE cc.ssn = c.ssn
AND t.number = cc.number
AND c.country = 'Singapore'
GROUP BY c.ssn
UNION
SELECT c.first_name, c.last_name, 0 AS amount
FROM customers c
WHERE NOT EXISTS (
    SELECT *
    FROM credit_cards cc
    WHERE cc.ssn = c.ssn );

--Q12
SELECT DISTINCT c.ssn, c.first_name, c.last_name, COUNT(DISTINCT m.country)
FROM customers c, credit_cards cc, 
merchants m, transactions t
WHERE t.code = m.code
AND t.number = cc.number
AND cc.ssn = c.ssn
AND c.country = 'Thailand'
AND cc.type = 'jcb'
AND t.amount >= 100
GROUP BY c.ssn
HAVING COUNT(DISTINCT m.country) = (
    SELECT COUNT(DISTINCT m2.country)
    FROM credit_cards cc2, merchants m2,
    transactions t2
    WHERE t2.code = m2.code
    AND cc2.number = t2.number
) 

-- SELECT cc.type, COUNT(DISTINCT m.country)
-- FROM credit_cards cc, merchants m,
-- transactions t
-- WHERE t.code = m.code
-- AND cc.number = t.number 
-- GROUP BY cc.type 

SELECT c.ssn, COUNT(DISTINCT m.country)
FROM customers c, credit_cards cc,
merchants m, transactions t
WHERE t.code = m.code
AND t.number = cc.number
AND cc.ssn = c.ssn
AND c.country = 'Thailand'
AND cc.type = 'jcb'
AND t.amount >= 100
GROUP BY c.ssn;


-- Q13
SELECT DISTINCT c.ssn, c.first_name, c.last_name, COUNT(DISTINCT m1.country)
FROM customers c, merchants m1
WHERE c.country = 'Thailand'
AND EXISTS (
    SELECT *
    FROM credit_cards cc, merchants m,
    transactions t
    WHERE t.code = m.code
    AND cc.number = t.number
    AND t.amount >= 100
    AND cc.type = 'jcb'
    AND EXISTS (
        SELECT DISTINCT m2.country
        FROM credit_cards cc2, merchants m2,
        transactions t2
        WHERE cc2.number = t2.number 
        AND m2.code = t2.code
        AND m1.country = m2.country
    )
) 
GROUP BY c.ssn

-- Q14
CREATE TABLE IF NOT EXISTS E2 (
    D VARCHAR(10), 
    E VARCHAR(10),
    F VARCHAR(10) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS E1_S (
    A VARCHAR(10), 
    B VARCHAR(10), 
    C VARCHAR(10),
    F VARCHAR(10),
    PRIMARY KEY (C, F),
    FOREIGN KEY (F) REFERENCES E2 (F)
);



DROP TABLE IF EXISTS E1_S;
DROP TABLE IF EXISTS E2;


DROP TABLE IF EXISTS E1_S CASCADE;
-- DROP TABLE IF EXISTS S CASCADE;
DROP TABLE IF EXISTS E2 CASCADE;


CREATE TABLE IF NOT EXISTS E2 (
    G VARCHAR(10) PRIMARY KEY, 
    H VARCHAR(10), 
    J VARCHAR(10),
    K VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS E1_S (
    A VARCHAR(10) UNIQUE, 
    B VARCHAR(10), 
    C VARCHAR(10),
    D VARCHAR(10),
    F VARCHAR(10),
    G VARCHAR(10),
    PRIMARY KEY (C, D),
    FOREIGN KEY (G) REFERENCES E2 (G)
);


SELECT *
FROM customer c1, customer c2
WHERE c1.cnumber <> c2.cnumber
AND EXISTS (
    SELECT *
    FROM visited v1, visited v2
    WHERE c1.cnumber = v1.cnumber
    AND c2.cnumber = v2.cnumber
    AND v1.bname = v2.bname 
    AND v1.bcountry = v2.bname
    AND v1.vdate = v2.vdate 
) 