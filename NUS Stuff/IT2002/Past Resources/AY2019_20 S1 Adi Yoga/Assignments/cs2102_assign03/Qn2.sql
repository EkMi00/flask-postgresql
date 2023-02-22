-- Dummy Data for Testing
INSERT INTO Users VALUES ('WA', 'A');
INSERT INTO Users VALUES ('WB', 'B');
INSERT INTO Users VALUES ('WC', 'C');
INSERT INTO Users VALUES ('WD', 'D');
INSERT INTO Users VALUES ('WE', 'E');
INSERT INTO Users VALUES ('WF', 'F');
INSERT INTO Users VALUES ('WG', 'G');
INSERT INTO Users VALUES ('WH', 'H');
INSERT INTO Users VALUES ('WI', 'I');
INSERT INTO Users VALUES ('WJ', 'J');

INSERT INTO Workers VALUES ('WA', 0);
INSERT INTO Workers VALUES ('WB', 1);
INSERT INTO Workers VALUES ('WC', 2);
INSERT INTO Workers VALUES ('WD', 3);
INSERT INTO Workers VALUES ('WE', 4);
INSERT INTO Workers VALUES ('WF', 5);
INSERT INTO Workers VALUES ('WG', 6);
INSERT INTO Workers VALUES ('WH', 7);
INSERT INTO Workers VALUES ('WI', 8);
INSERT INTO Workers VALUES ('WJ', 9);

INSERT INTO Offices VALUES ('A', 1, 'WA', DATE('1999-1-1'));
INSERT INTO Offices VALUES ('B', 2, 'WB', DATE('1999-1-1'));
INSERT INTO Offices VALUES ('C', 3, 'WC', DATE('1999-1-1'));
INSERT INTO Offices VALUES ('D', 4, 'WD', DATE('1999-1-1'));
INSERT INTO Offices VALUES ('E', 5, 'WE', DATE('1999-1-1'));

INSERT INTO Work VALUES ('WA', 'A', DATE('1999-1-1'));
INSERT INTO Work VALUES ('WB', 'B', DATE('1999-1-1'));
INSERT INTO Work VALUES ('WC', 'C', DATE('1999-1-1'));
INSERT INTO Work VALUES ('WD', 'D', DATE('1999-1-1'));
INSERT INTO Work VALUES ('WE', 'E', DATE('1999-1-1'));
INSERT INTO Work VALUES ('WF', 'A', DATE('1999-1-1'));
INSERT INTO Work VALUES ('WG', 'B', DATE('1999-1-1'));
INSERT INTO Work VALUES ('WH', 'C', DATE('1999-1-1'));
INSERT INTO Work VALUES ('WI', 'D', DATE('1999-1-1'));
INSERT INTO Work VALUES ('WJ', 'E', DATE('1999-1-1'));

-- Dummy Table for Answer
DROP TABLE IF EXISTS Qn2_Test CASCADE;
CREATE TABLE Qn2_Test (
  uname     varchar(50),
  expr      integer
);

-- Dummy Data for Answer
INSERT INTO Qn2_Test VALUES ('WC', 2);
INSERT INTO Qn2_Test VALUES ('WD', 3);
INSERT INTO Qn2_Test VALUES ('WE', 4);
INSERT INTO Qn2_Test VALUES ('WF', 5);
INSERT INTO Qn2_Test VALUES ('WG', 6);
INSERT INTO Qn2_Test VALUES ('WH', 7);
INSERT INTO Qn2_Test VALUES ('WI', 8);
INSERT INTO Qn2_Test VALUES ('WJ', 9);

-- TEST YOUR ANSWER HERE
DROP VIEW IF EXISTS qn2;
CREATE VIEW qn2 (uname, expr) AS 
  SELECT DISTINCT W.uname, Wer.expr 
  FROM Work W
  INNER JOIN Offices O 
  ON W.area = O.area
  INNER JOIN Workers Wer
  ON Wer.uname = W.uname
  WHERE (Wer.expr >= 5 AND Wer.expr <= 10)
    OR O.num_lvl >= 3;

/* CREATE VIEW qn2 (uname, expr) AS 
  SELECT DISTINCT W.uname, W.expr
  FROM  Workers W 
  NATURAL JOIN 
  Offices O
  WHERE W.expr >= 5 AND W.expr <= 10
    OR O.num_lvl >= 3;*/
------------------------

-- Test Code: MAKE SURE YOU HAVE YOUR ANSWER
SELECT * FROM qn2
ORDER BY uname; -- your answer
SELECT * FROM Qn2_test
ORDER BY uname; -- expected solution
