-- Dummy Data for Testing
INSERT INTO Users VALUES ('WA', 'A');
INSERT INTO Users VALUES ('WB', 'B');
INSERT INTO Users VALUES ('WC', 'C');
INSERT INTO Users VALUES ('WD', 'D');
INSERT INTO Users VALUES ('WE', 'E');

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

INSERT INTO PetOwner VALUES ('CD');
INSERT INTO PetOwner VALUES ('CE');
INSERT INTO PetOwner VALUES ('CF');
INSERT INTO PetOwner VALUES ('CG');
INSERT INTO PetOwner VALUES ('CH');
INSERT INTO PetOwner VALUES ('CI');
INSERT INTO PetOwner VALUES ('CJ');

INSERT INTO Pet VALUES ('CD', 'Pet1', 'A', 'D1');
INSERT INTO Pet VALUES ('CD', 'Pet2', 'A', 'D1');
INSERT INTO Pet VALUES ('CE', 'Pet3', 'A', 'D1');
INSERT INTO Pet VALUES ('CE', 'Pet1', 'B', 'D1');
INSERT INTO Pet VALUES ('CF', 'Pet2', 'B', 'D1');
INSERT INTO Pet VALUES ('CG', 'Pet3', 'A', 'D1');
INSERT INTO Pet VALUES ('CG', 'Pet1', 'C', 'D1');
INSERT INTO Pet VALUES ('CH', 'Pet2', 'C', 'D1');
INSERT INTO Pet VALUES ('CI', 'Pet3', 'C', 'D1');
INSERT INTO Pet VALUES ('CI', 'Pet4', 'D', 'D1');

-- Dummy Table for Answer
DROP TABLE IF EXISTS Qn5_Test CASCADE;
CREATE TABLE Qn5_Test (
  p1uname   varchar(50),
  p2uname   varchar(50)
);

-- Dummy Data for Answer
INSERT INTO Qn5_Test VALUES ('CD', 'CE');
INSERT INTO Qn5_Test VALUES ('CD', 'CG');
INSERT INTO Qn5_Test VALUES ('CE', 'CF');
INSERT INTO Qn5_Test VALUES ('CE', 'CG');
INSERT INTO Qn5_Test VALUES ('CG', 'CH');
INSERT INTO Qn5_Test VALUES ('CG', 'CI');
INSERT INTO Qn5_Test VALUES ('CH', 'CI');

-- TEST YOUR ANSWER HERE
DROP VIEW IF EXISTS qn5;
CREATE VIEW qn5 (p1uname, p2uname) AS
  SELECT DISTINCT P1.uname, P2.uname 
  FROM Pet P1, Pet P2
  WHERE P1.uname < P2.uname 
  AND P1.atype = P2.atype 
;
------------------------

-- Test Code: MAKE SURE YOU HAVE YOUR ANSWER
-- SELECT * FROM qn5
-- ORDER BY p1uname, p2uname; -- your answer
-- SELECT * FROM Qn5_Test
-- ORDER BY p1uname, p2uname; -- expected solution

WITH Same AS (
  SELECT * FROM qn5
  UNION
  SELECT * FROM Qn5_Test
),   Diff AS (
  SELECT * FROM qn5
  EXCEPT
  SELECT * FROM Qn5_Test
)
SELECT (((SELECT COUNT(*) FROM Same) = (SELECT COUNT(*) FROM qn5))
        AND
        ((SELECT COUNT(*) FROM Same) = (SELECT COUNT(*) FROM Qn5_Test))
        AND
        ((SELECT COUNT(*) FROM Diff) = 0)) AS is_correct;
        