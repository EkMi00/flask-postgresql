SELECT *
FROM loan l, student s1, student s2
WHERE l.owner = s1.email
AND l.borrower = s2.email
AND s1.department = s2.department; --502

SELECT d1.faculty, COUNT(*)
FROM loan l, student s1, student s2, department d1, department d2
WHERE l.owner = s1.email
AND l.borrower = s2.email
AND s1.department = d1.department
AND s2.department = d2.department
AND d1.faculty = d2.faculty
GROUP BY d1.faculty;

SELECT *
FROM loan l, student s1, student s2, department d1, department d2
WHERE l.owner = s2.email
AND l.borrower = s1.email
AND s1.department = d1.department
AND s2.department = d2.department
AND d1.faculty = d2.faculty;

SELECT AVG (temp.duration) ,
STDDEV_POP (temp.duration)
FROM (SELECT (( CASE 
WHEN l.returned ISNULL
THEN '2010-12-31'
ELSE l.returned
END) - l.borrowed + 1) AS duration FROM loan l ) AS temp;

-- Avg : 41.4963826366559486	
-- Stddev : 38.4206806387009364

SELECT b.title 
FROM book b
WHERE b.ISBN13 NOT IN (
SELECT l.book
FROM loan l); -- 0

SELECT s.name 
FROM student s 
WHERE s.email IN ( -- Why not NOT IN?
    SELECT c.owner
    FROM copy c 
    WHERE NOT EXISTS (
    SELECT *
    FROM loan l 
    WHERE l.owner = c.owner
    AND l.book = c.book
    AND l.copy = c.copy)); -- 0

SELECT s.name
FROM student s
WHERE s.email = ANY (
    SELECT c.owner
    FROM copy c
    WHERE NOT EXISTS (
    SELECT *
    FROM loan l
    WHERE l.owner = c.owner
    AND l.book = c.book
    AND l.copy = c.copy)
);

SELECT s.department, s.name, COUNT(*)
FROM student s, loan l
WHERE l.owner = s.email
GROUP BY s.department, s.email, s.name
HAVING COUNT(*) >= ALL 
    (SELECT COUNT(*) 
    FROM student s1, loan l1
    WHERE l1.owner = s1.email
    AND s.department = s1.department
    GROUP BY s1.email);

SELECT s.email, s.name
FROM student s
WHERE NOT EXISTS (
    SELECT *
    FROM book b
    WHERE authors = 'Adam Smith'
    AND NOT EXISTS (
        SELECT *
        FROM loan l
        WHERE l.book = b.ISBN13
        AND l.borrower = s.email));