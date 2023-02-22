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
  uname     varchar(50),
  atype     varchar(20)
);

-- Dummy Data for Answer
INSERT INTO Qn3_Test VALUES ('CA', 'A');
INSERT INTO Qn3_Test VALUES ('CB', 'B');
INSERT INTO Qn3_Test VALUES ('CC', 'C');

-- TEST YOUR ANSWER HERE
DROP VIEW IF EXISTS qn3;
CREATE VIEW qn3 (uname, atype) AS 
  WITH NP AS (SELECT uname FROM Customers 
    EXCEPT SELECT uname FROM PetOwner)
  SELECT DISTINCT NP.uname, C.atype
  FROM NP 
  LEFT JOIN 
  CareTaker C
  ON NP.uname = C.uname;
------------------------

-- Test Code: MAKE SURE YOU HAVE YOUR ANSWER
SELECT * FROM qn3
ORDER BY uname; -- your answer
SELECT * FROM Qn3_test
ORDER BY uname; -- expected solution
