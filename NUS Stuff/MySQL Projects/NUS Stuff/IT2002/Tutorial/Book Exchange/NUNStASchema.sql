/*******************

  Create the schema

********************/

CREATE TABLE IF NOT EXISTS BOOK (
  TITLE VARCHAR(256) NOT NULL,
  FORMAT CHAR(9) CONSTRAINT FORMAT CHECK(FORMAT = 'paperback' OR FORMAT='hardcover'),
  PAGES INT,
  LANGUAGE VARCHAR(32),
  AUTHORS VARCHAR(256),
  PUBLISHER VARCHAR(64),
  YEAR DATE,
  ISBN10 CHAR(10) NOT NULL UNIQUE,
  ISBN13 CHAR(14) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS STUDENT (
  NAME VARCHAR(32) NOT NULL,
  EMAIL VARCHAR(256) PRIMARY KEY,
  YEAR DATE NOT NULL,
  FACULTY VARCHAR(62) NOT NULL,
  DEPARTMENT VARCHAR(32) NOT NULL,
  GRADUATE DATE,
  CHECK(GRADUATE >= YEAR)
);

CREATE TABLE IF NOT EXISTS COPY (
  OWNER VARCHAR(256) REFERENCES STUDENT(EMAIL) ON DELETE CASCADE DEFERRABLE,
  BOOK CHAR(14) REFERENCES BOOK(ISBN13) DEFERRABLE,
  COPY INT CHECK(COPY>0),
  AVAILABLE VARCHAR(6) CHECK(AVAILABLE = 'TRUE' OR AVAILABLE='FALSE'),
  PRIMARY KEY (OWNER, BOOK, COPY)
);

CREATE TABLE IF NOT EXISTS LOAN (
  BORROWER VARCHAR(256) REFERENCES STUDENT(EMAIL) DEFERRABLE,
  OWNER VARCHAR(256),
  BOOK CHAR(14),
  COPY INT,
  BORROWED DATE,
  RETURNED DATE,
  FOREIGN KEY (OWNER, BOOK, COPY) REFERENCES COPY(OWNER, BOOK, COPY) ON DELETE CASCADE DEFERRABLE,
  PRIMARY KEY (BORROWED, BORROWER, OWNER, BOOK, COPY),
  CHECK(RETURNED >= BORROWED)
);

CREATE TABLE department (
department VARCHAR(32) PRIMARY KEY,
faculty VARCHAR(62) NOT NULL);

INSERT INTO department
SELECT DISTINCT department, faculty 
FROM STUDENT;

ALTER TABLE student
DROP COLUMN faculty;

ALTER TABLE student
ADD FOREIGN KEY (department) REFERENCES department(department);
