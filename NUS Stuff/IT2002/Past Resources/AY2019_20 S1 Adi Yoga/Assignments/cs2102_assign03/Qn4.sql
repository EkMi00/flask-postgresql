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
INSERT INTO CareTaker VALUES ('CE', 'I');
INSERT INTO CareTaker VALUES ('CF', 'J');

INSERT INTO PetOwner VALUES ('CD');
INSERT INTO PetOwner VALUES ('CE');
INSERT INTO PetOwner VALUES ('CF');
INSERT INTO PetOwner VALUES ('CG');
INSERT INTO PetOwner VALUES ('CH');
INSERT INTO PetOwner VALUES ('CI');
INSERT INTO PetOwner VALUES ('CJ');

INSERT INTO Pet VALUES ('CD', 'PetA1', 'A', 'D1');
INSERT INTO Pet VALUES ('CD', 'PetA2', 'B', 'D2');
INSERT INTO Pet VALUES ('CE', 'PetA1', 'C', 'D1');
INSERT INTO Pet VALUES ('CE', 'PetA2', 'D', 'D2');
INSERT INTO Pet VALUES ('CF', 'PetB1', 'E', 'D1');
INSERT INTO Pet VALUES ('CG', 'PetB2', 'F', 'D1');
INSERT INTO Pet VALUES ('CH', 'PetB3', 'G', 'D1');

-- Dummy Table for Answer
DROP TABLE IF EXISTS Qn4_Test CASCADE;
CREATE TABLE Qn4_Test (
  ctuname   varchar(50),
  atype     varchar(20),
  name      varchar(50)
);

-- Dummy Data for Answer
INSERT INTO Qn4_Test VALUES ('CA', 'A', 'PetA1');
INSERT INTO Qn4_Test VALUES ('CB', 'B', 'PetA2');
INSERT INTO Qn4_Test VALUES ('CC', 'C', 'PetA1');
INSERT INTO Qn4_Test VALUES ('CD', 'D', 'PetA2');

-- TEST YOUR ANSWER HERE
DROP VIEW IF EXISTS qn4;
CREATE VIEW qn4 (ctuname, atype, name) AS 
  SELECT DISTINCT CT.uname, CT.atype, P.name
  FROM CareTaker CT
  INNER JOIN 
  Pet P
  ON CT.atype = P.atype;

/*  SELECT B.ctuname, P.atype, B.name
  FROM Bid B NATURAL JOIN Pet P
  WHERE B.is_win = TRUE;*/
------------------------

-- Test Code: MAKE SURE YOU HAVE YOUR ANSWER
SELECT * FROM qn4
ORDER BY ctuname; -- your answer
SELECT * FROM Qn4_test
ORDER BY ctuname; -- expected solution
