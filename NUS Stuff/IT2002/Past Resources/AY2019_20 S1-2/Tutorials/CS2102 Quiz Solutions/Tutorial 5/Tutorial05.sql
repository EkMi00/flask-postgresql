-- QUIZ

-- QUESTION 1 

-- Solution 1 (with aggregate)

SELECT  *
FROM Sells S1
WHERE price = (SELECT MAX(price) FROM Sells  S2 WHERE S1.pizza = S2.pizza);

-- Solution 2

select  *
from Sells S1
where price >= all (select price from Sells where pizza = S1.pizza);


-- Solution 3
-- problematic? no

select  *
from Sells S1
where NOT price < ANY (select price from Sells where pizza = S1.pizza);

-- Solution 4

select  *
from Sells S1
where not exists (
	select 1
	from sells S2
	where S1.pizza = S2.pizza
	and S1.price < S2.price );




-- QUESTION 2

-- Solution 1 

with q1 as (
select rname, max(price) as maxPrice
from Sells
group by rname)

select T1.rname, T2.rname
from q1 T1, q1 T2
where T1.maxPrice > T2.maxPrice;

-- Solution 2

with q1 as (
select rname, max(price) as maxPrice
from Sells
group by rname)

select T1.rname, T2.rname
from q1 T1 join q1 T2 on T1.maxPrice > T2.maxPrice;


-- Solution 3

select distinct T1.rname, T2.rname
from sells T1, sells T2
where (select max(price) from sells where rname = T1.rname) 
	> (select max(price) from sells where rname = T2.rname);

-- Solution 4

select distinct T1.rname, T2.rname
from restaurants T1, restaurants T2
where (select max(price) from sells where rname = T1.rname) 
	> (select max(price) from sells where rname = T2.rname);

-- Solution 5

select distinct T1.rname, T2.rname
from (select distinct rname from sells) as T1, (select distinct rname from sells) as T2
where (select max(price) from sells where rname = T1.rname) 
	> (select max(price) from sells where rname = T2.rname);






-- QUESTION 3   (can use round() function if you want to limit the decimal places, i.e. replace avg(price) with round(avg(price), 3) => 3 decimal points 
--				(not needed in this question, but could be useful for your project or FYI)


-- Solution 1 (With having clause)

select rname, avg(price)
from Sells 
group by rname
having avg(price) > 22;

-- Solution 2

with q1 as (
select rname, avg(price) as avgPrice
from Sells
group by rname)

select * 
from q1
where avgprice > 22;


-- Solution 3

select rname, avg(price)
from Sells  S1
where (select avg(price) from Sells S2 where S2.rname = S1.rname) > 22
group by rname;






-- QUESTION 4


-- Solution 1

WITH q1 as (
select rname, sum(price) as totalPrice
from Sells
group by rname)

SELECT *
FROM q1
WHERE totalPrice > (select avg(totalPrice) FROM q1);


-- Solution 2 ( the 1.0 not necessary unless price is of int data type. can omit it if price is type numberic / floating point )

select rname, sum(price)
from sells 
group by rname
having sum(price) > (select (1.0 * sum(price) )/ count(distinct rname) from sells);







-- QUESTION 5

-- Solution 1

SELECT C1.cname, C2.cname
FROM Likes C1, Likes C2
WHERE C1.cname < C2.cname
AND (NOT EXISTS (
		SELECT 1
		FROM Likes
		WHERE cname = C1.cname
		AND pizza NOT IN (SELECT pizza FROM Likes WHERE cname = C2.cname)
	)
	OR
	NOT EXISTS (
		SELECT 1
		FROM Likes
		WHERE cname = C2.cname
		AND pizza NOT IN (SELECT pizza FROM Likes WHERE cname = C1.cname)
	));
	
-- Solution 2  for all pizzas C1, C2 like, they are the same set == equivalent to ==>
--		        NOT (there exists some pizza that c1 likes that c2 doesnt like or some pizza that c2 likes that c2 doesnt like) 

SELECT C1.cname, C2.cname
FROM Likes C1, Likes C2
WHERE C1.cname < C2.cname
AND NOT EXISTS (
		SELECT 1
		FROM Likes
		WHERE (cname = C1.cname AND pizza NOT IN (SELECT pizza FROM Likes WHERE cname = C2.cname))
		OR (cname = C2.cname AND pizza NOT IN (SELECT pizza FROM Likes WHERE cname = C1.cname)	
	));

-- Solution 3  for all pizzas C1, C2 like, they are the same set => no. pizzas C1 like = no .pizzas C2 like = no. of pizzas C1 likes intersect / union no. of pizzas C2 likes
--														=> |C1| = |C2| = |C1 and/ or C2|
-- |C1| = |C2| ensures they like the same number of pizzas 
-- |C2| = |C1 and / or C2|    or   |C1| = |C1 and / or C2| ensures that they like exactly the same set of pizzas, with the assumption |C1| = |C2|

SELECT C1.cname, C2.cname
FROM Likes C1, Likes C2
WHERE C1.cname < C2.cname
AND ( (SELECT COUNT(*) FROM Likes WHERE cname = C1.cname) = (SELECT COUNT(*) FROM Likes WHERE cname = C2.cname) 
	    AND (SELECT COUNT(*) FROM Likes WHERE cname = C2.cname) =  (SELECT COUNT(DISTINCT pizza) FROM Likes WHERE cname IN (C1.cname, C2.cname))	--this is union
	);






-- QUESTION 6

-- Solution 1 

-- for testing purpose
select ('before update, ' || price || ' ' || area) as before_update
from restaurants natural join sells;

update Sells
set price = 
	case (select area FROM restaurants where restaurants.rname = Sells.rname)
	when 'Central' then price + 3 
	when 'East' then price + 2
	else price + 1
	end;

-- for testing purpose
select ('after update, ' || price || ' ' || area) as after_update
from restaurants natural join sells;


-- Solution 2 (difference from solution 1: evaluating expression placed after the when keywords instead of case keyword (solution one better)

-- for testing purpose
select ('before update, ' || price || ' ' || area) as before_update
from restaurants natural join sells;

update Sells
set price = 
	case 
	when (select area FROM restaurants where restaurants.rname = Sells.rname) = 'Central' then price + 3 
	when (select area FROM restaurants where restaurants.rname = Sells.rname) = 'East' then price + 2
	else price + 1
	end;

-- for testing purpose
select ('after update, ' || price || ' ' || area) as after_update
from restaurants natural join sells;






-- DISCUSSION QUESTION

-- Question 7a) 

/* DOESN'T WORK
SELECT sid
FROM Presenters
GROUP by sid
HAVING COUNT(*) = MAX(COUNT(*));
*/

/* DOESN'T WORK
SELECT sid
FROM Presenters
GROUP by sid
HAVING COUNT(*) = (select MAX(select COUNT(*) from presenters group by sid) from presenters);
*/


-- Solution 1
SELECT sid
FROM Presenters
GROUP by sid
HAVING COUNT(*) = (select MAX(num) from (select COUNT(*) as num from presenters group by sid) as smth);

-- Solution 2 (a different way of getting the max in subquery)

SELECT sid
FROM Presenters
group by sid
HAVING COUNT(*) = (select COUNT(sid) as num from presenters group by sid order by num desc limit 1);

-- Solution 3 (a different way of getting the max)

SELECT sid
FROM Presenters
GROUP by sid
HAVING COUNT(*) >= all (select COUNT(*) from presenters group by sid);

-- Solution 4

with q1 as (
SELECT sid, count(*) as num
FROM Presenters
GROUP BY sid)

SELECT sid
FROM q1
WHERE num = (SELECT MAX(num) FROM q1);






-- Question 7b)

-- Solution 1 (change 5 to 2 so that the current input data can output some result, cause my tables only has students who have presented at most 2 same weeks (just for testing)

SELECT s1.sid, s2.sid
FROM presenters s1 JOIN presenters s2 ON s1.sid < s2.sid AND s1.week = s2.week
GROUP BY s1.sid, s2.sid
HAVING COUNT(*) >= 5;





-- Question 7c)

-- Solution 1   (in my current data, max week = 5, all but 1 & 2 only presented once => all but 1 & 2 outputted
-- 				 1 & 2 not outputted and 1 and 2 presented in weeks 1 and 4 => no consecutive 3 weeks of non presentation)

wITH q1 as (
SELECT s.sid, p.week
FROM (select sid from students) as s, (select distinct week from presenters) as p
EXCEPT 
SELECT sid, week
FROM presenters)

SELECT DISTINCT s1.sid
FROM q1 s1, q1 s2, q1 s3
WHERE s1.sid = s2.sid and s2 .sid = s3.sid and s2.week =s1.week + 1 and s3.week = s2.week + 1;





-- QUESTION 7d)

-- Solution 1

WITH q1 as (
SELECT sid, COALESCE(COUNT(week), 0) as numQ, COALESCE(MAX(week), 0) as lastWk
FROM students natural left JOIN presenters
GROUP BY sid )


--question :
-- find all sets of two students S to be presenters for the next tutorial such that 
-- none of the students in (Students - S) has higher priority than any of the students in S.

-- equivalent to:

-- for all s1, s2 in Students ( for all s3 in Students - {s1, s2}, s3 has lower priority than s1 and s3 has lower priority than s2 )


-- equivalent to:

-- for all s1, s2 in Students (NOT ( there exist some s3 in Students - {s1, s2}, where s3 has higher priority than s1 and s3 has lower priority than s2 ) )
-- this is what i'm computing

SELECT S1.sid, S2.sid
FROM q1 S1 , q1 S2
WHERE S1.sid < S2.sid
AND NOT EXISTS (
	      SELECT 1 
	      FROM q1 S3
	      WHERE S3.sid NOT IN (S1.sid, S2.sid)
	      AND ( S3.numQ < S1.numQ OR (S1.numQ = S1.numQ AND S3.lastWk < S1.lastWk) 
	      	   OR (S3.numQ = S1.numQ AND S3.lastWk = S1.lastWk AND S3.sid  < S1.sid) 
	      	   OR S3.numQ < S2.numQ OR (S3.numQ = S2.numQ AND S3.lastWk < S2.lastWk) 
	      	   OR (S3.numQ = S2.numQ AND S3.lastWk = S2.lastWk AND S3.sid  < S2.sid) )
	      );
	     

 -- Solution 2 (only difference from solution is the way I get the CTE, expected values for the CTE should still be the same)

WITH q1 as (
SELECT sid, COALESCE((SELECT COUNT(*) FROM Presenters WHERE sid = S1.sid), 0) as numQ,
			COALESCE((SELECT MAX(week) FROM Presenters WHERE sid = S1.sid), 0) as lastWk
FROM students S1)


SELECT S1.sid, S2.sid
FROM q1 S1 , q1 S2
WHERE S1.sid < S2.sid
AND NOT EXISTS (
	      SELECT 1 
	      FROM q1 S3
	      WHERE S3.sid NOT IN (S1.sid, S2.sid)
	      AND ( S3.numQ < S1.numQ OR (S1.numQ = S1.numQ AND S3.lastWk < S1.lastWk) 
	      	   OR (S3.numQ = S1.numQ AND S3.lastWk = S1.lastWk AND S3.sid  < S1.sid) 
	      	   OR S3.numQ < S2.numQ OR (S3.numQ = S2.numQ AND S3.lastWk < S2.lastWk) 
	      	   OR (S3.numQ = S2.numQ AND S3.lastWk = S2.lastWk AND S3.sid  < S2.sid) )
	      );
	  
	     
	     
	     
	     
	    
 

-- Question 7e)

-- Solution 1

-- if at least one presenter each week (1 .... w) where w is max week => this outputs 0 
WITH q1 as (
SELECT COUNT(DISTINCT week) - MAX(week)
FROM presenters), 

-- if at least one presenter for each qnum (1... q), where q is max qnum for each week (1 .... w) where w is max week => this outputs 0 
q2 as (
SELECT COUNT(DISTINCT qnum) - MAX(qnum) as val
FROM presenters
GROUP BY week
)


-- each separate condition satisfied if it is equals to 0
-- if both satisfied 
SELECT CASE ((SELECT * FROM q1) = 0 AND (SELECT SUM(val) FROM q2) = 0)
		WHEN TRUE THEN 0
		ELSE 1 
		END;







