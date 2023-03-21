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

INSERT INTO Pet VALUES ('CD', 'Pet1', 'A', 'D1');
INSERT INTO Pet VALUES ('CD', 'Pet2', 'B', 'D2');
INSERT INTO Pet VALUES ('CE', 'Pet1', 'C', 'D1');
INSERT INTO Pet VALUES ('CE', 'Pet2', 'D', 'D2');
INSERT INTO Pet VALUES ('CF', 'Pet1', 'E', 'D1');
INSERT INTO Pet VALUES ('CG', 'Pet2', 'F', 'D1');
INSERT INTO Pet VALUES ('CH', 'Pet3', 'G', 'D1');

INSERT INTO Availability VALUES ('CA', DATE('1990-1-1'), '12:00:00', '13:00:00');
INSERT INTO Availability VALUES ('CA', DATE('1990-1-1'), '13:00:00', '14:00:00');
INSERT INTO Availability VALUES ('CA', DATE('1990-1-1'), '14:00:00', '15:00:00');
INSERT INTO Availability VALUES ('CA', DATE('1990-1-1'), '15:00:00', '16:00:00');
INSERT INTO Availability VALUES ('CB', DATE('1990-1-1'), '12:00:00', '13:00:00');
INSERT INTO Availability VALUES ('CC', DATE('1990-1-1'), '12:00:00', '13:00:00');
INSERT INTO Availability VALUES ('CC', DATE('1990-1-1'), '13:00:00', '14:00:00');
INSERT INTO Availability VALUES ('CE', DATE('1990-1-1'), '12:00:00', '13:00:00');

INSERT INTO Bid VALUES ('CD', 'Pet1', 'CA', DATE('1990-1-1'), '12:00:00', '13:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CD', 'Pet2', 'CA', DATE('1990-1-1'), '12:00:00', '13:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CD', 'Pet1', 'CA', DATE('1990-1-1'), '13:00:00', '14:00:00', 200, null, TRUE);
INSERT INTO Bid VALUES ('CD', 'Pet2', 'CA', DATE('1990-1-1'), '13:00:00', '14:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CD', 'Pet1', 'CA', DATE('1990-1-1'), '14:00:00', '15:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CD', 'Pet2', 'CA', DATE('1990-1-1'), '14:00:00', '15:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CE', 'Pet1', 'CA', DATE('1990-1-1'), '12:00:00', '13:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CE', 'Pet2', 'CA', DATE('1990-1-1'), '13:00:00', '14:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CE', 'Pet1', 'CA', DATE('1990-1-1'), '14:00:00', '15:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CE', 'Pet2', 'CA', DATE('1990-1-1'), '15:00:00', '16:00:00', 200, null, TRUE);
INSERT INTO Bid VALUES ('CF', 'Pet1', 'CA', DATE('1990-1-1'), '12:00:00', '13:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CF', 'Pet1', 'CA', DATE('1990-1-1'), '13:00:00', '14:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CF', 'Pet1', 'CA', DATE('1990-1-1'), '14:00:00', '15:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CF', 'Pet1', 'CA', DATE('1990-1-1'), '15:00:00', '16:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CG', 'Pet2', 'CE', DATE('1990-1-1'), '12:00:00', '13:00:00', 200, null, TRUE);
INSERT INTO Bid VALUES ('CH', 'Pet3', 'CC', DATE('1990-1-1'), '13:00:00', '14:00:00', 200, null, FALSE);
INSERT INTO Bid VALUES ('CH', 'Pet3', 'CE', DATE('1990-1-1'), '12:00:00', '13:00:00', 200, null, FALSE);