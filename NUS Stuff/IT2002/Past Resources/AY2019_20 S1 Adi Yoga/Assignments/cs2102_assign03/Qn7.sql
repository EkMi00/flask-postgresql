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

INSERT INTO Offices VALUES ('A', 1, 'WA', DATE('1990-1-1'));
INSERT INTO Offices VALUES ('B', 2, 'WB', DATE('1990-1-31'));
INSERT INTO Offices VALUES ('C', 3, 'WC', DATE('1990-2-1'));
INSERT INTO Offices VALUES ('D', 4, 'WD', DATE('1990-2-28'));
INSERT INTO Offices VALUES ('E', 5, 'WE', DATE('1990-3-1'));

INSERT INTO Located VALUES ('CA', 'A');
INSERT INTO Located VALUES ('CA', 'B');
INSERT INTO Located VALUES ('CB', 'B');
INSERT INTO Located VALUES ('CB', 'C');
INSERT INTO Located VALUES ('CC', 'C');
INSERT INTO Located VALUES ('CC', 'D');
INSERT INTO Located VALUES ('CD', 'D');
INSERT INTO Located VALUES ('CD', 'E');
INSERT INTO Located VALUES ('CE', 'E');
INSERT INTO Located VALUES ('CE', 'A');
INSERT INTO Located VALUES ('CF', 'A');
INSERT INTO Located VALUES ('CG', 'B');
INSERT INTO Located VALUES ('CH', 'C');
INSERT INTO Located VALUES ('CI', 'D');
INSERT INTO Located VALUES ('CJ', 'E');

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

INSERT INTO Availability VALUES ('CA', DATE('1990-1-1'), '12:00:00', '13:00:00');
INSERT INTO Availability VALUES ('CA', DATE('1990-1-1'), '13:00:00', '14:00:00');
INSERT INTO Availability VALUES ('CA', DATE('1990-1-1'), '14:00:00', '15:00:00');
INSERT INTO Availability VALUES ('CA', DATE('1990-1-1'), '15:00:00', '16:00:00');
INSERT INTO Availability VALUES ('CB', DATE('1990-1-1'), '12:00:00', '13:00:00');
INSERT INTO Availability VALUES ('CC', DATE('1990-1-1'), '12:00:00', '13:00:00');
INSERT INTO Availability VALUES ('CC', DATE('1990-1-1'), '13:00:00', '14:00:00');
INSERT INTO Availability VALUES ('CE', DATE('1990-1-1'), '12:00:00', '13:00:00');

INSERT INTO Bid VALUES ('CD', 'PetA2', 'CA', DATE('1990-1-1'), '12:00:00', '13:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CD', 'PetA1', 'CA', DATE('1990-1-1'), '13:00:00', '14:00:00', 200, 4, TRUE);
INSERT INTO Bid VALUES ('CD', 'PetA2', 'CA', DATE('1990-1-1'), '14:00:00', '15:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CE', 'PetA1', 'CA', DATE('1990-1-1'), '12:00:00', '13:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CE', 'PetA2', 'CA', DATE('1990-1-1'), '13:00:00', '14:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CE', 'PetA1', 'CA', DATE('1990-1-1'), '14:00:00', '15:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CE', 'PetA2', 'CA', DATE('1990-1-1'), '15:00:00', '16:00:00', 200, 3, TRUE);
INSERT INTO Bid VALUES ('CF', 'PetB1', 'CA', DATE('1990-1-1'), '12:00:00', '13:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CF', 'PetB1', 'CA', DATE('1990-1-1'), '13:00:00', '14:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CF', 'PetB1', 'CA', DATE('1990-1-1'), '14:00:00', '15:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CF', 'PetB1', 'CA', DATE('1990-1-1'), '15:00:00', '16:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CG', 'PetB2', 'CE', DATE('1990-1-1'), '12:00:00', '13:00:00', 200, 5, TRUE);
INSERT INTO Bid VALUES ('CH', 'PetB3', 'CC', DATE('1990-1-1'), '13:00:00', '14:00:00', 200, null, FALSE);

-- Dummy Table for Answer
DROP TABLE IF EXISTS Qn7_Test CASCADE;
CREATE TABLE Qn7_Test (
  ctuname   varchar(50)
);

-- Dummy Data for Answer
INSERT INTO Qn7_Test VALUES ('CB');
INSERT INTO Qn7_Test VALUES ('CC');
INSERT INTO Qn7_Test VALUES ('CD');
INSERT INTO Qn7_Test VALUES ('CF');

-- TEST YOUR ANSWER HERE
DROP VIEW IF EXISTS qn7;
CREATE VIEW qn7 (ctuname) AS
    (WITH Co AS (SELECT ctuname, COUNT(ctuname) AS num
      FROM Bid
      WHERE rating >= 4 AND is_win = TRUE AND ctuname <> pouname
      GROUP BY ctuname)
    SELECT DISTINCT ctuname FROM BID
    EXCEPT SELECT ctuname FROM Co)
  UNION
    (SELECT DISTINCT uname
    FROM CareTaker CT
    EXCEPT 
      (SELECT ctuname FROM Bid))
  UNION
    (SELECT DISTINCT uname 
    FROM CareTaker CT
    EXCEPT 
      (SELECT uname FROM Availability));
/*
    (SELECT DISTINCT ctuname
    FROM Bid
    EXCEPT 
      (SELECT ctuname FROM Bid 
      WHERE rating >= 4 AND is_win = TRUE AND ctuname <> pouname)
)*/
------------------------

-- Test Code: MAKE SURE YOU HAVE YOUR ANSWER
SELECT * FROM qn7
ORDER BY ctuname; -- your answer
SELECT * FROM Qn7_Test
ORDER BY ctuname; -- expected solution
