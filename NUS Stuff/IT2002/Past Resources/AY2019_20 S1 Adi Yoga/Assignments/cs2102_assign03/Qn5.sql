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

INSERT INTO Recommends VALUES ('CA', 'CB');
INSERT INTO Recommends VALUES ('CA', 'CC');
INSERT INTO Recommends VALUES ('CA', 'CD');
INSERT INTO Recommends VALUES ('CB', 'CA');
INSERT INTO Recommends VALUES ('CB', 'CE');
INSERT INTO Recommends VALUES ('CB', 'CG');
INSERT INTO Recommends VALUES ('CD', 'CA');
INSERT INTO Recommends VALUES ('CD', 'CH');
INSERT INTO Recommends VALUES ('CG', 'CA');
INSERT INTO Recommends VALUES ('CG', 'CB');
INSERT INTO Recommends VALUES ('CG', 'CH');
INSERT INTO Recommends VALUES ('CG', 'CJ');

-- Dummy Table for Answer
DROP TABLE IF EXISTS Qn5_Test CASCADE;
CREATE TABLE Qn5_Test (
  uname   varchar(50),
  num     integer
);

-- Dummy Data for Answer
INSERT INTO Qn5_Test VALUES ('CA', 3);
INSERT INTO Qn5_Test VALUES ('CB', 2);
INSERT INTO Qn5_Test VALUES ('CC', 1);
INSERT INTO Qn5_Test VALUES ('CD', 2);
INSERT INTO Qn5_Test VALUES ('CG', 4);

-- TEST YOUR ANSWER HERE
DROP VIEW IF EXISTS qn5;
CREATE VIEW qn5 (uname, num) AS 
  WITH A AS (SELECT C.uname, CASE
      WHEN P.uname IS NULL THEN (SELECT COUNT(giver) FROM Recommends
                                 WHERE receiver = C.uname)
      ELSE (SELECT COUNT(receiver) FROM Recommends WHERE giver = C.uname)
    END AS num
    FROM PetOwner P
    RIGHT JOIN Customers C
    ON P.uname = C.uname)
  SELECT DISTINCT * FROM A 
  WHERE num <> 0
;
/*  SELECT C.uname, CASE
    WHEN P.uname IS NULL THEN (SELECT COUNT(receiver) FROM Recommends 
                               WHERE receiver = C.uname)
    ELSE (SELECT COUNT(giver) FROM Recommends WHERE giver = C.uname)
  END AS num
  FROM PetOwner P
  LEFT JOIN Customers C
  ON P.uname = C.uname,
  CHECK num <> 0;*/
------------------------

-- Test Code: MAKE SURE YOU HAVE YOUR ANSWER
SELECT * FROM qn5
ORDER BY uname; -- your answer
SELECT * FROM Qn5_Test
ORDER BY uname; -- expected solution
