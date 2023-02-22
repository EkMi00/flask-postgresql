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
INSERT INTO CareTaker VALUES ('CD', 'A');
INSERT INTO CareTaker VALUES ('CE', 'B');
INSERT INTO CareTaker VALUES ('CF', 'C');

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
DROP TABLE IF EXISTS Qn6_Test CASCADE;
CREATE TABLE Qn6_Test (
  pouname   varchar(50),
  ctuname   varchar(50)
);

-- Dummy Data for Answer
INSERT INTO Qn6_Test VALUES ('CD', 'CA');
INSERT INTO Qn6_Test VALUES ('CD', 'CB');
INSERT INTO Qn6_Test VALUES ('CD', 'CE');
INSERT INTO Qn6_Test VALUES ('CE', 'CC');
INSERT INTO Qn6_Test VALUES ('CE', 'CF');
INSERT INTO Qn6_Test VALUES ('CF', null);
INSERT INTO Qn6_Test VALUES ('CG', null);
INSERT INTO Qn6_Test VALUES ('CH', null);
INSERT INTO Qn6_Test VALUES ('CI', null);
INSERT INTO Qn6_Test VALUES ('CJ', null);

-- TEST YOUR ANSWER HERE
DROP VIEW IF EXISTS qn6;
CREATE VIEW qn6 (pouname, ctuname) AS 
  SELECT DISTINCT PO.uname, CT.uname
  FROM CareTaker CT
  INNER JOIN 
  Pet P
  ON P.atype = CT.atype
  RIGHT JOIN 
  PetOwner PO
  ON PO.uname = P.uname
  WHERE PO.uname <> CT.uname OR CT.uname IS NULL; 
/*  FROM PetOwner PO 
  LEFT JOIN
  Pet P
  ON PO.uname = P.uname
  LEFT JOIN 
  CareTaker CT
  ON P.atype = CT.atype
  WHERE PO.uname <> CT.uname
; */
------------------------

-- Test Code: MAKE SURE YOU HAVE YOUR ANSWER
SELECT * FROM qn6
ORDER BY pouname, ctuname; -- your answer
SELECT * FROM Qn6_Test
ORDER BY pouname, ctuname; -- expected solution
