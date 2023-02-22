-- Dummy Data for Testing
INSERT INTO Users VALUES ('CA', 'A');
INSERT INTO Users VALUES ('CB', 'B');
INSERT INTO Users VALUES ('CC', 'C');
INSERT INTO Users VALUES ('CD', 'D');
INSERT INTO Users VALUES ('CE', 'E');
INSERT INTO Users VALUES ('CF', 'F');
INSERT INTO Users VALUES ('CG', 'G');
INSERT INTO Users VALUES ('CH', 'H');
INSERT INTO Users VALUES ('CI', 'I');
INSERT INTO Users VALUES ('CJ', 'J');

INSERT INTO Customers VALUES ('CA');
INSERT INTO Customers VALUES ('CB');
INSERT INTO Customers VALUES ('CC');
INSERT INTO Customers VALUES ('CD');
INSERT INTO Customers VALUES ('CE');
INSERT INTO Customers VALUES ('CF');
INSERT INTO Customers VALUES ('CG');
INSERT INTO Customers VALUES ('CH');
INSERT INTO Customers VALUES ('CI');
INSERT INTO Customers VALUES ('CJ');

INSERT INTO CareTaker VALUES ('CA', 'A');
INSERT INTO CareTaker VALUES ('CB', 'B');
INSERT INTO CareTaker VALUES ('CC', 'C');
INSERT INTO CareTaker VALUES ('CD', 'D');
INSERT INTO CareTaker VALUES ('CE', 'E');
INSERT INTO CareTaker VALUES ('CF', 'F');

INSERT INTO PetOwner VALUES ('CD');
INSERT INTO PetOwner VALUES ('CE');
INSERT INTO PetOwner VALUES ('CF');
INSERT INTO PetOwner VALUES ('CG');
INSERT INTO PetOwner VALUES ('CH');
INSERT INTO PetOwner VALUES ('CI');
INSERT INTO PetOwner VALUES ('CJ');

-- Dummy Table for Answer
DROP TABLE IF EXISTS Qn3_Test CASCADE;
CREATE TABLE Qn3_Test (
  uname     varchar(50)
);

-- Dummy Data for Answer
INSERT INTO Qn3_Test VALUES ('CA');
INSERT INTO Qn3_Test VALUES ('CB');
INSERT INTO Qn3_Test VALUES ('CC');
INSERT INTO Qn3_Test VALUES ('CG');
INSERT INTO Qn3_Test VALUES ('CH');
INSERT INTO Qn3_Test VALUES ('CI');
INSERT INTO Qn3_Test VALUES ('CJ');

-- TEST YOUR ANSWER HERE
DROP VIEW IF EXISTS qn3;
CREATE VIEW qn3 (uname) AS
  SELECT C.uname 
  FROM (Customers C
  LEFT JOIN PetOwner P
  ON C.uname = P.uname
  LEFT JOIN CareTaker CT
  ON C.uname = CT.uname)
  WHERE (CT.uname IS NOT NULL AND P.uname IS NULL) 
  OR (CT.uname IS NULL AND P.uname IS NOT NULL)
;
------------------------

-- Test Code: MAKE SURE YOU HAVE YOUR ANSWER
-- SELECT * FROM qn3
-- ORDER BY uname;      -- your answer
-- SELECT * FROM Qn3_Test
-- ORDER BY uname; -- expected solution

WITH Same AS (
  SELECT * FROM qn3
  UNION
  SELECT * FROM Qn3_Test
),   Diff AS (
  SELECT * FROM qn3
  EXCEPT
  SELECT * FROM Qn3_Test
)
SELECT (((SELECT COUNT(*) FROM Same) = (SELECT COUNT(*) FROM qn3))
        AND
        ((SELECT COUNT(*) FROM Same) = (SELECT COUNT(*) FROM Qn3_Test))
        AND
        ((SELECT COUNT(*) FROM Diff) = 0)) AS is_correct;
        