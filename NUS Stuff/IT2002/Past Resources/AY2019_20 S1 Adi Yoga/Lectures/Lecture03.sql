-- Basic
CREATE TABLE Students();
DROP TABLE Students;

-- Data Domain
CREATE TABLE Students(
  studentID   integer,
  name        varchar(100),
  birthDate   date
);
DROP TABLE Students;

-- Primary Key
CREATE TABLE Students (
  studentID	  integer PRIMARY KEY,
  name	      varchar(100),
  birthDate	  date
);
DROP TABLE Students;

-- Multiple PK
CREATE TABLE Enrolls (
  sid	    integer,
  cid	    integer,
  grade	  char(2),
  PRIMARY KEY(sid, cid)
);
DROP TABLE Enrolls;


-- Foreign Key
CREATE TABLE Students (
  studentID	  integer PRIMARY KEY,
  name	      varchar(100),
  birthDate	  date
);
CREATE TABLE Courses (
  courseID    integer PRIMARY KEY,
  name        varchar(100)
);
CREATE TABLE Enrolls ( 
  sid	    integer REFERENCES students(studentID),
  cid	    integer,
  grade	  char(2),
  FOREIGN KEY(cid) REFERENCES courses(courseID)
);
DROP TABLE Enrolls;
DROP TABLE Courses;
DROP TABLE Students;

-- Multiple FK
CREATE TABLE Student_Course (
  studentID   integer,
  courseID    integer,
  PRIMARY KEY(studentID,courseID)
);
CREATE TABLE Enrolls ( 
  sid	    integer,
  cid	    integer,
  FOREIGN KEY(sid,cid) REFERENCES
    Student_Course(studentID, courseID)
);
DROP TABLE Enrolls;
DROP TABLE Student_Course;


-- Not-null
CREATE TABLE Students ( 
  studentID	  integer,
  name	      varchar(100) NOT NULL,
  birthDate	  date
);
DROP TABLE Students;

CREATE TABLE Students ( 
  studentID	  integer,
  name	      varchar(100),
  birthDate	  date,
  CHECK (name IS NOT NULL)
);
DROP TABLE Students;

-- Unique
CREATE TABLE Students ( 
  studentID	  integer,
  name	      varchar(100) UNIQUE,
  birthDate	  date
);
DROP TABLE Students;

CREATE TABLE Students ( 
  studentID	  integer,
  name	      varchar(100),
  birthDate	  date,
  UNIQUE (studentID, name)
);
DROP TABLE Students;


-- Table modification
CREATE TABLE Students (
  studentID	  integer PRIMARY KEY,
  name	      varchar(100),
  dept	      varchar(20) DEFAULT 'CS'
);
INSERT INTO Students VALUES (12345, 'Alice', 'Eng');
INSERT INTO Students (studentID) VALUES (23456);
INSERT INTO Students (studentID) VALUES (12345);
INSERT INTO Students VALUES (34567, 'Bob', 'Eng');
INSERT INTO Students (dept, name, studentID)
VALUES ('Maths', 'Carol', 45678);
DELETE FROM Students WHERE dept='Eng';
DELETE FROM Students; -- remove all
INSERT INTO Students VALUES (12345, 'Alice', 'Eng');
INSERT INTO Students (studentID) VALUES (23456);
UPDATE Students SET name = 'Bob' WHERE dept = 'CS';
UPDATE Students SET studentID = studentID + 1;
DROP TABLE Students;


/* Modified Pizza.sql */
DROP TABLE IF EXISTS Likes;
DROP TABLE IF EXISTS Sells;
DROP TABLE IF EXISTS Contains;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Restaurants;
DROP TABLE IF EXISTS Pizzas;

CREATE TABLE Pizzas (
	pizza   VARCHAR(50),
	PRIMARY KEY (pizza)
);

CREATE TABLE Restaurants (
	rname   VARCHAR(50),
	area    VARCHAR(10),
	PRIMARY KEY (rname)
);


CREATE TABLE Customers (
	cname   VARCHAR(50),
	area    VARCHAR(10),
	PRIMARY KEY (cname)
);

CREATE TABLE Sells (
	rname   VARCHAR(50),
	pizza   VARCHAR(50),
	price   INTEGER,
	PRIMARY KEY (rname,pizza),
	FOREIGN KEY (rname) REFERENCES Restaurants (rname),
	FOREIGN KEY (pizza) REFERENCES Pizzas (pizza)
);

CREATE TABLE Likes (
	cname   VARCHAR(50),
	pizza   VARCHAR(50),
	PRIMARY KEY (cname,pizza),
	FOREIGN KEY (cname) REFERENCES Customers (cname),
	FOREIGN KEY (pizza) REFERENCES Pizzas (pizza)
);

CREATE TABLE Contains (
	pizza       VARCHAR(50),
	ingredient  VARCHAR(50),
	PRIMARY KEY (pizza,ingredient),
	FOREIGN KEY (pizza) REFERENCES Pizzas (pizza)
);

INSERT  INTO Pizzas VALUES ('Diavola');
INSERT  INTO Pizzas VALUES ('Funghi');
INSERT  INTO Pizzas VALUES ('Hawaiian');
INSERT  INTO Pizzas VALUES ('Margherita');
INSERT  INTO Pizzas VALUES ('Marinara');
INSERT  INTO Pizzas VALUES ('Sciliana');

INSERT  INTO Customers VALUES ('Homer','West');
INSERT  INTO Customers VALUES ('Lisa','South');
INSERT  INTO Customers VALUES ('Maggie','East');
INSERT  INTO Customers VALUES ('Moe','Central');
INSERT  INTO Customers VALUES ('Ralph','Central');
INSERT  INTO Customers VALUES ('Willie','North');

INSERT  INTO Restaurants VALUES ('Corleone Corner','North');
INSERT  INTO Restaurants VALUES ('Gambino Oven','Central');
INSERT  INTO Restaurants VALUES ('Lorenzo Tavern','Central');
INSERT  INTO Restaurants VALUES ('Mamma''s Place','South');
INSERT  INTO Restaurants VALUES ('Pizza King','East');

INSERT  INTO Sells VALUES ('Corleone Corner','Diavola',24);
INSERT  INTO Sells VALUES ('Corleone Corner','Hawaiian',25);
INSERT  INTO Sells VALUES ('Corleone Corner','Margherita',19);
INSERT  INTO Sells VALUES ('Gambino Oven','Sciliana',16);
INSERT  INTO Sells VALUES ('Lorenzo Tavern','Funghi',23);
INSERT  INTO Sells VALUES ('Mamma''s Place','Marinara',23);
INSERT  INTO Sells VALUES ('Pizza King','Diavola',17);
INSERT  INTO Sells VALUES ('Pizza King','Hawaiian',21);

INSERT  INTO Likes VALUES ('Homer','Hawaiian');
INSERT  INTO Likes VALUES ('Homer','Margherita');
INSERT  INTO Likes VALUES ('Lisa','Funghi');
INSERT  INTO Likes VALUES ('Maggie','Funghi');
INSERT  INTO Likes VALUES ('Moe','Funghi');
INSERT  INTO Likes VALUES ('Moe','Sciliana');
INSERT  INTO Likes VALUES ('Ralph','Diavola');

INSERT  INTO Contains VALUES ('Diavola','cheese');
INSERT  INTO Contains VALUES ('Diavola','chilli');
INSERT  INTO Contains VALUES ('Diavola','salami');
INSERT  INTO Contains VALUES ('Funghi','ham');
INSERT  INTO Contains VALUES ('Funghi','mushroom');
INSERT  INTO Contains VALUES ('Hawaiian','ham');
INSERT  INTO Contains VALUES ('Hawaiian','pineapple');
INSERT  INTO Contains VALUES ('Margherita','cheese');
INSERT  INTO Contains VALUES ('Margherita','tomato');
INSERT  INTO Contains VALUES ('Marinara','seafood');
INSERT  INTO Contains VALUES ('Sciliana','anchovies');
INSERT  INTO Contains VALUES ('Sciliana','capers');
INSERT  INTO Contains VALUES ('Sciliana','cheese');
/* ------------------ */



-- Query
SELECT rname, pizza, price
FROM   Sells
WHERE  price < 20;

SELECT *
FROM   Sells
WHERE  price < 20;

SELECT rname, pizza, price
FROM   Sells
WHERE  (price < 20 OR pizza = 'Marinara')
  AND  pizza <> 'Diavola';


-- Distinct
CREATE TABLE r (
  a   integer,
  b   integer,
  c   integer
);
INSERT INTO r VALUES (10, 1, 2);
INSERT INTO r VALUES (10, 7, 2);
INSERT INTO r VALUES (20, 3, null);
INSERT INTO r VALUES (20, 9, null);
INSERT INTO r VALUES (30, 3, 2);
INSERT INTO r VALUES (40, 5, 2);

SELECT a,c FROM r;
SELECT DISTINCT a,c FROM r;
DROP TABLE r;


-- Renaming
CREATE TABLE Orders (
  item    varchar(1),
  price   numeric,
  qty     integer
);
INSERT INTO Orders VALUES ('A', 2.50, 100);
INSERT INTO Orders VALUES ('B', 4.00, 100);
INSERT INTO Orders VALUES ('C', 7.50, 100);
SELECT item, price * qty AS cost FROM Orders;
DROP TABLE Orders;


SELECT 'Price of ' || pizza || ' is ' || round(price / 1.3) || ' USD' AS menu
FROM Sells WHERE rname = 'Corleone Corner';
