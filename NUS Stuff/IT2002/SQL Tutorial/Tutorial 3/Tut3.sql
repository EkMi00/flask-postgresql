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
WHERE NOT (returned IS NULL)
ORDER BY book ASC, duration DESC;

SELECT book,
((CASE
WHEN returned IS NULL
THEN '2010-12-31'
ELSE returned
END) - borrowed + 1) AS duration
FROM loan
ORDER BY book ASC, duration ASC;


SELECT borrowed, borrowed - 10 -- In Days
FROM loan

-- Difference between Oct 02, 2011 and Jan 01, 2012 in years
SELECT DATE_PART('year', '2012-01-01'::date) - DATE_PART('year', '2011-10-02'::date);
-- Result: 1

-- Difference between Oct 02, 2011 and Jan 01, 2012 in months
SELECT (DATE_PART('year', '2012-01-01'::date) - DATE_PART('year', '2011-10-02'::date)) * 12 +
            (DATE_PART('month', '2012-01-01'::date) - DATE_PART('month', '2011-10-02'::date));
-- Result: 3     

-- Difference between Dec 29, 2011 23:00 and Dec 31, 2011 01:00 in days
SELECT DATE_PART('day', '2011-12-31 01:00:00'::timestamp - '2011-12-29 23:00:00'::timestamp);
-- Result: 1

-- Difference between Dec 22, 2011 and Dec 31, 2011 in weeks
SELECT TRUNC(DATE_PART('day', '2011-12-31'::timestamp - '2011-12-22'::timestamp)/7);
-- Result: 1
