SELECT d.department
FROM department d;

SELECT DISTINCT s.department
FROM student s;

SELECT DISTNCT s.email
FROM loan l, student s 
WHERE (s.email = l.borrower AND l.borrowed < s.year)
OR (s.email = l.owner AND l.borrowed < s.year);

SELECT book, returned - borrowed + 1 AS duration
FROM loan
WHERE NOT (returned ISNULL)
ORDER BY book ASC, duration DESC;

SELECT book,
((CASE
WHEN returned ISNULL
THEN '2010-12-31'
ELSE returned
END) - borrowed + 1) AS duration
FROM loan
ORDER BY book ASC, duration ASC;