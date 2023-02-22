-- Dummy Data for Testing
INSERT INTO Users VALUES ('A', 'A');
INSERT INTO Users VALUES ('ABC', 'J');
INSERT INTO Users VALUES ('AAAA', 'I');
INSERT INTO Users VALUES ('ABCD', 'B');
INSERT INTO Users VALUES ('AAAAA', 'D');
INSERT INTO Users VALUES ('BBBBB', 'H');
INSERT INTO Users VALUES ('ABCDE', 'C');
INSERT INTO Users VALUES ('BAAAAA', 'G');
INSERT INTO Users VALUES ('BCDEFGHIJ', 'F');
INSERT INTO Users VALUES ('ABCDEFGHIJ', 'E');

INSERT INTO Customers VALUES ('A');
INSERT INTO Customers VALUES ('ABC');
INSERT INTO Customers VALUES ('AAAA');
INSERT INTO Customers VALUES ('ABCD');
INSERT INTO Customers VALUES ('ABCDE');
INSERT INTO Customers VALUES ('AAAAA');
INSERT INTO Customers VALUES ('BBBBB');
INSERT INTO Customers VALUES ('BAAAAA');
INSERT INTO Customers VALUES ('BCDEFGHIJ');
INSERT INTO Customers VALUES ('ABCDEFGHIJ');

-- Dummy Table for Answer
DROP TABLE IF EXISTS Qn1_Test CASCADE;
CREATE TABLE Qn1_Test (
  uname     varchar(50)
);

-- Dummy Data for Answer
INSERT INTO Qn1_Test VALUES ('ABCDE');
INSERT INTO Qn1_Test VALUES ('AAAAA');
INSERT INTO Qn1_Test VALUES ('ABCDEFGHIJ');

-- TEST YOUR ANSWER HERE
DROP VIEW IF EXISTS qn1;
CREATE VIEW qn1 (uname) AS
  SELECT uname
  FROM Customers C
  WHERE uname LIKE 'A____%'
;
------------------------

-- Test Code: MAKE SURE YOU HAVE YOUR ANSWER
-- SELECT * FROM qn1;      -- your answer
-- SELECT * FROM Qn1_Test; -- expected solution

WITH Same AS (
  SELECT * FROM qn1
  UNION
  SELECT * FROM Qn1_Test
),   Diff AS (
  SELECT * FROM qn1
  EXCEPT
  SELECT * FROM Qn1_Test
)
SELECT (((SELECT COUNT(*) FROM Same) = (SELECT COUNT(*) FROM qn1))
        AND
        ((SELECT COUNT(*) FROM Same) = (SELECT COUNT(*) FROM Qn1_Test))
        AND
        ((SELECT COUNT(*) FROM Diff) = 0)) AS is_correct;
        