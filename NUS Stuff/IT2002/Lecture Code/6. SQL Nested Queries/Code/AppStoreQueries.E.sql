SELECT cs.last_name, d.name
FROM
(SELECT * 
FROM customers c
WHERE c.country = 'Singapore') 
AS cs, 
downloads d
WHERE cs.customerid = d.customerid;

SELECT c.last_name, d.name
FROM  customers c, downloads d
WHERE c.country = 'Singapore'
AND c.customerid = d.customerid;

SELECT DISTINCT d.name
FROM  downloads d
WHERE d.customerid IN (
    SELECT c.customerid
    FROM customers c
    WHERE c.country = 'Singapore');

-- EXCEPT

SELECT DISTINCT d.name
FROM downloads d
WHERE EXISTS (
    SELECT *
    FROM customers c
    WHERE c.country = 'Singapore'
    AND c.customerid = d.customerid
)

-- EXCEPT

SELECT DISTINCT d.name
FROM customers c, downloads d
WHERE c.country = 'Singapore'
AND c.customerid = d.customerid;

    
SELECT d.name
FROM  customers c, downloads d
WHERE c.country = 'Singapore'
AND c.customerid = d.customerid; 

SELECT d.name
FROM  downloads d
WHERE d.customerid IN (
SELECT c.customerid
FROM customers c
WHERE c.country = 'Singapore');
    
SELECT d.name
FROM  downloads d
WHERE d.customerid = ANY (
SELECT c.customerid
FROM customers c
WHERE c.country = 'Singapore');
    
SELECT g1.name, g1.version, g1.price
FROM  games g1
WHERE g1.price >= ALL (
SELECT g2.price
FROM  games g2);
    
SELECT g1.name, g1.version, g1.price
FROM  games g1
WHERE g1.price >= ANY (
SELECT g2.price
FROM  games g2);
    
SELECT g.name, g.version, g.price
FROM  games g
HAVING g.price= MAX(g.price);

SELECT g1.name, g1.version, g1.price
FROM  games g1
WHERE g1.price = MAX(
SELECT g2.price 
FROM games g2);

SELECT g1.name, g1.version, g1.price
FROM  games g1
WHERE g1.price = ALL(
SELECT MAX(g2.price) 
FROM games g2);

SELECT d.name
FROM  downloads d
WHERE EXISTS (
SELECT c.customerid
FROM customers c
WHERE d.customerid = c.customerid
AND c.country = 'Singapore');

SELECT g1.name, g1.version, g1.price
FROM  games g1
WHERE g1.price >= ALL (
SELECT g2.price
FROM  games g2
WHERE g1.name = g2.name);
    
SELECT c.customerid, d.name
FROM  downloads d
WHERE d.customerid IN (
SELECT c.customerid
FROM customers c
WHERE c.country = 'Singapore');

    
SELECT c.customerid
FROM  customers c
WHERE c.customerid NOT IN (
    SELECT d.customerid
    FROM downloads d)

UNION

SELECT c.customerid
FROM customers c
WHERE NOT EXISTS (
    SELECT *
    FROM downloads d
    WHERE c.customerid = d.customerid)

SELECT c5.customerid
FROM 
(SELECT *
FROM customers c1
EXCEPT 
(SELECT c2.* FROM customers c2, 
(SELECT DISTINCT c3.*
FROM downloads d NATURAL JOIN customers c3) AS c4
WHERE c2.customerid = c4.customerid)) AS c5;


SELECT c.customerid
FROM  customers c
WHERE c.customerid != ALL (
SELECT d.customerid
FROM downloads d)

EXCEPT

SELECT c.customerid
FROM  customers c
WHERE c.customerid <> ALL (
SELECT d.customerid
FROM downloads d);

SELECT c.customerid
FROM  customers c
WHERE NOT EXISTS (
SELECT d.customerid
FROM downloads d
WHERE c.customerid = d.customerid);

SELECT c1.country
FROM customers c1
GROUP BY c1.country
HAVING COUNT(*) >= ALL (
SELECT COUNT(*)
FROM customers c2
GROUP BY c2.country)


-- Customers who have downloaded every version of Aerified
SELECT c.first_name, c.last_name
FROM customers c
WHERE NOT EXISTS ( 
    SELECT *   
    FROM games g  
    WHERE g.name = 'Aerified'  
    AND NOT EXISTS (      
        SELECT *      
        FROM downloads d     
        WHERE d.customerid = c.customerid     
        AND d.name = g.name      
        AND d.version = g.version) ); -- Subquery finds customers who did not download any version of Aerified

-- SELECT *
-- FROM downloads d, games g, customers c
-- WHERE d.customerid = c.customerid     
--         AND d.name = g.name      
--         AND d.version = g.version

-- WITH table1 AS 
-- (SELECT *
-- FROM downloads
-- NATURAL JOIN games
-- NATURAL JOIN customers),

-- table2 AS
-- (SELECT *
-- FROM games g
-- WHERE g.name = 'Aerified'),

-- table3 AS 
-- (SELECT *
-- FROM customers c),

-- cross1 AS 
-- (SELECT t2.* 
-- FROM table2 t2, table1 t1
-- WHERE t2.name = t1.name),

-- exclude1 AS
-- (SELECT *
-- FROM table2
-- EXCEPT 
-- SELECT *
-- FROM cross1)

-- -- SELECT *
-- -- FROM exclude1

-- cross3 AS
-- (SELECT *
-- FROM table3 t3, exclude1 e1)



-- Customers who have downloaded every version of every game
SELECT DISTINCT c.first_name, c.last_name,
g1.name, g1.version
FROM customers c, games g1
WHERE NOT EXISTS ( 
    SELECT *
    FROM games g2   
    WHERE g1.name = g2.name
    AND NOT EXISTS (      
        SELECT *      
        FROM downloads d     
        WHERE d.customerid = c.customerid     
        AND d.name = g2.name      
        AND d.version = g2.version) )
ORDER BY c.first_name, c.last_name,
g1.name, g1.version;


SELECT c.first_name, c.last_name, g.name, g.version
FROM customers c, games g, downloads d
WHERE c.customerid = d.customerid
AND d.name = g.name
AND d.version = g.version