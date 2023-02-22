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

INSERT INTO Offices VALUES ('A', 1, 'WA', DATE('1990-1-1'));
INSERT INTO Offices VALUES ('B', 2, 'WB', DATE('1990-1-1'));
INSERT INTO Offices VALUES ('C', 3, 'WC', DATE('1990-1-1'));
INSERT INTO Offices VALUES ('D', 4, 'WD', DATE('1990-1-1'));
INSERT INTO Offices VALUES ('E', 5, 'WE', DATE('1990-1-1'));

INSERT INTO Work VALUES ('WA', 'A', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WA', 'B', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WA', 'C', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WB', 'B', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WB', 'C', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WB', 'D', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WC', 'C', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WC', 'D', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WD', 'A', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WD', 'D', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WE', 'E', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WF', 'A', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WF', 'B', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WG', 'C', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WG', 'D', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WH', 'A', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WI', 'B', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WJ', 'C', DATE('1990-1-1'));

-- Dummy Table for Answer
DROP TABLE IF EXISTS Qn6_Test CASCADE;
CREATE TABLE Qn6_Test (
  pouname   varchar(50),
  num       integer
);

-- Dummy Data for Answer
INSERT INTO Qn6_Test VALUES ('WA', 8);
INSERT INTO Qn6_Test VALUES ('WB', 7);
INSERT INTO Qn6_Test VALUES ('WC', 5);
INSERT INTO Qn6_Test VALUES ('WD', 6);
INSERT INTO Qn6_Test VALUES ('WE', 0);
INSERT INTO Qn6_Test VALUES ('WF', 5);
INSERT INTO Qn6_Test VALUES ('WG', 5);
INSERT INTO Qn6_Test VALUES ('WH', 3);
INSERT INTO Qn6_Test VALUES ('WI', 3);
INSERT INTO Qn6_Test VALUES ('WJ', 4);

-- TEST YOUR ANSWER HERE
DROP VIEW IF EXISTS qn6;
CREATE VIEW qn6 (uname, num) AS
  WITH Number AS (SELECT W2.uname, area
    FROM Work W, Work W2
    WHERE W.area = W2.area AND W.uname <> W2.uname)
  SELECT DISTINCT Wo.uname, COUNT(Wo.uname) AS num
  FROM Work Wo, Number
  GROUP BY 
;
------------------------

-- Test Code: MAKE SURE YOU HAVE YOUR ANSWER
-- SELECT * FROM qn6
-- ORDER BY uname, num; -- your answer
-- SELECT * FROM Qn6_Test
-- ORDER BY pouname, ctuname; -- expected solution

WITH Same AS (
  SELECT * FROM qn6
  UNION
  SELECT * FROM Qn6_Test
),   Diff AS (
  SELECT * FROM qn6
  EXCEPT
  SELECT * FROM Qn6_Test
)
SELECT (((SELECT COUNT(*) FROM Same) = (SELECT COUNT(*) FROM qn6))
        AND
        ((SELECT COUNT(*) FROM Same) = (SELECT COUNT(*) FROM Qn6_Test))
        AND
        ((SELECT COUNT(*) FROM Diff) = 0)) AS is_correct;
