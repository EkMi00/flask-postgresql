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
INSERT INTO Users VALUES ('WK', 'K');

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
INSERT INTO Workers VALUES ('WK', 9);

INSERT INTO Offices VALUES ('A', 1, 'WA', DATE('1990-1-1'));
INSERT INTO Offices VALUES ('B', 2, 'WB', DATE('1990-1-1'));
INSERT INTO Offices VALUES ('C', 3, 'WC', DATE('1990-1-1'));
INSERT INTO Offices VALUES ('D', 4, 'WD', DATE('1990-1-1'));
INSERT INTO Offices VALUES ('E', 5, 'WE', DATE('1990-1-1'));
INSERT INTO Offices VALUES ('K', 5, 'WK', DATE('1990-1-1'));

INSERT INTO Work VALUES ('WA', 'A', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WB', 'A', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WB', 'B', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WC', 'A', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WC', 'B', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WC', 'C', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WD', 'A', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WD', 'B', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WD', 'D', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WE', 'A', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WE', 'B', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WE', 'E', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WF', 'A', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WG', 'B', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WH', 'C', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WI', 'D', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WJ', 'E', DATE('1990-1-1'));
INSERT INTO Work VALUES ('WK', 'K', DATE('1990-1-1'));


-- Dummy Table for Answer
DROP TABLE IF EXISTS Qn8_Test CASCADE;
CREATE TABLE Qn8_Test (
  uname   varchar(50),
  area    varchar(20)
);

-- Dummy Data for Answer
INSERT INTO Qn8_Test VALUES ('WA', 'A');

-- TEST YOUR ANSWER HERE
DROP VIEW IF EXISTS qn8;
CREATE VIEW qn8 (uname, area) AS
  SELECT uname, area
  FROM Offices O 
  WHERE 
;
------------------------

-- Test Code: MAKE SURE YOU HAVE YOUR ANSWER
-- SELECT * FROM qn8
-- ORDER BY uname, area; -- your answer
-- SELECT * FROM Qn8_Test
-- ORDER BY uname, area; -- expected solution

WITH Same AS (
  SELECT * FROM qn8
  UNION
  SELECT * FROM Qn8_Test
),   Diff AS (
  SELECT * FROM qn8
  EXCEPT
  SELECT * FROM Qn8_Test
)
SELECT (((SELECT COUNT(*) FROM Same) = (SELECT COUNT(*) FROM qn8))
        AND
        ((SELECT COUNT(*) FROM Same) = (SELECT COUNT(*) FROM Qn8_Test))
        AND
        ((SELECT COUNT(*) FROM Diff) = 0)) AS is_correct;
