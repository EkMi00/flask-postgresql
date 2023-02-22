CREATE TABLE book (
title VARCHAR(256) NOT NULL,
format CHAR(9) CHECK(format = 'paperback' OR format='hardcover'),
pages INT,
language VARCHAR(32),
authors VARCHAR(256),
publisher VARCHAR(64),
year DATE,
ISBN10 CHAR(10) NOT NULL UNIQUE,
ISBN13 CHAR(14) PRIMARY KEY
);

CREATE TABLE student (
name VARCHAR(32) NOT NULL,
email VARCHAR(256) PRIMARY KEY,
join DATE NOT NULL,
faculty VARCHAR(62) NOT NULL,
department VARCHAR(32) NOT NULL,
graduate DATE,
CHECK(graduate >= join)
);

CREATE TABLE copy (
owner VARCHAR(256) REFERENCES student(email) ON DELETE CASCADE,
ISBN CHAR(14) REFERENCES book(ISBN13) ON DELETE CASCADE,
copynum INT CHECK(copynum>0),
available VARCHAR(6)CHECK(available = 'TRUE' OR available='FALSE'),
PRIMARY KEY (ISBN, copynum)
);

CREATE TABLE loan (
borrower VARCHAR(256) REFERENCES student(email),
ISBN CHAR(14),
copynum INT,
loanDate DATE,
returnDate DATE,
FOREIGN KEY (ISBN, copynum) REFERENCES copy(ISBN, copynum) ON DELETE CASCADE,
PRIMARY KEY (borrower, ISBN, copynum, loanDate),
CHECK(returnDate >= loanDate)
);

