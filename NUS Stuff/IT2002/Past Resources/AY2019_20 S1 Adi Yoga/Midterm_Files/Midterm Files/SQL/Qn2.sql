-- Dummy Data for Testing
INSERT INTO Users VALUES ('CD', 'D');
INSERT INTO Users VALUES ('CE', 'E');
INSERT INTO Users VALUES ('CF', 'F');
INSERT INTO Users VALUES ('CG', 'G');
INSERT INTO Users VALUES ('CH', 'H');
INSERT INTO Users VALUES ('CI', 'I');
INSERT INTO Users VALUES ('CJ', 'J');

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
INSERT INTO Pet VALUES ('CD', 'Pet2', 'B', 'D2');
INSERT INTO Pet VALUES ('CD', 'Pet3', 'C', 'D2');
INSERT INTO Pet VALUES ('CE', 'Pet1', 'A', 'D1');
INSERT INTO Pet VALUES ('CE', 'Pet2', 'C', 'D2');
INSERT INTO Pet VALUES ('CF', 'Pet3', 'B', 'D1');
INSERT INTO Pet VALUES ('CF', 'Pet1', 'C', 'D1');
INSERT INTO Pet VALUES ('CG', 'Pet2', 'A', 'D1');
INSERT INTO Pet VALUES ('CH', 'Pet3', 'B', 'D1');
INSERT INTO Pet VALUES ('CI', 'Pet1', 'A', 'D1');
INSERT INTO Pet VALUES ('CI', 'Pet2', 'B', 'D1');
INSERT INTO Pet VALUES ('CJ', 'Pet3', 'D', 'D1');
INSERT INTO Pet VALUES ('CJ', 'Pet4', 'E', 'D1');

-- Dummy Table for Answer
DROP TABLE IF EXISTS Qn2_Test CASCADE;
CREATE TABLE Qn2_Test (
  uname     varchar(50),
  name      varchar(50)
);

-- Dummy Data for Answer
INSERT INTO Qn2_Test VALUES ('CD', 'Pet1');
INSERT INTO Qn2_Test VALUES ('CE', 'Pet1');
INSERT INTO Qn2_Test VALUES ('CF', 'Pet3');
INSERT INTO Qn2_Test VALUES ('CG', 'Pet2');
INSERT INTO Qn2_Test VALUES ('CH', 'Pet3');
INSERT INTO Qn2_Test VALUES ('CI', 'Pet1');
INSERT INTO Qn2_Test VALUES ('CI', 'Pet2');

-- TEST YOUR ANSWER HERE
DROP VIEW IF EXISTS qn2;
CREATE VIEW qn2 (uname, name) AS
  SELECT uname, name 
  FROM Pet 
  WHERE (atype = 'A' OR atype = 'B') AND  
  diet = 'D1'
;
------------------------

-- Test Code: MAKE SURE YOU HAVE YOUR ANSWER
-- SELECT * FROM qn2
-- ORDER BY uname;      -- your answer
-- SELECT * FROM Qn2_Test
-- ORDER BY uname; -- expected solution

WITH Same AS (
  SELECT * FROM qn2
  UNION
  SELECT * FROM Qn2_Test
),   Diff AS (
  SELECT * FROM qn2
  EXCEPT
  SELECT * FROM Qn2_Test
)
SELECT (((SELECT COUNT(*) FROM Same) = (SELECT COUNT(*) FROM qn2))
        AND
        ((SELECT COUNT(*) FROM Same) = (SELECT COUNT(*) FROM Qn2_Test))
        AND
        ((SELECT COUNT(*) FROM Diff) = 0)) AS is_correct;
        