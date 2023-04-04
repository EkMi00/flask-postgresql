.open myfile.db 
.mode column
.header on
PRAGMA foreign_keys = ON;
.help



CREATE TABLE downloads(
    first_name VARCHAR(64), 
    last_name VARCHAR(64), 
    email VARCHAR(64), 	
    dob DATE,
    since DATE,
    customerid VARCHAR(16), 
    country VARCHAR(16),
    name VARCHAR(32),
    version CHAR(3),
    price NUMERIC);
    
DROP TABLE downloads;
    
CREATE TABLE customers (
	first_name VARCHAR(64),
	last_name VARCHAR(64),
	email VARCHAR(64),
	dob DATE,
	since DATE,
	customerid VARCHAR(16),
	country VARCHAR(16));

CREATE TABLE games (
	name VARCHAR(32),
	version CHAR(3),
	price DECIMAL(2,2));
	
CREATE TABLE downloads(
	customerid VARCHAR(16),
	name VARCHAR(32),
	version CHAR(3));
	
DROP TABLE customers;

CREATE TABLE customers (
first_name VARCHAR(64),
last_name VARCHAR(64),
email VARCHAR(64),
dob DATE,
since DATE,
customerid VARCHAR(16) PRIMARY KEY,
country VARCHAR(16));

INSERT INTO customers VALUES(
	'Carole', 
	'Yoga', 
	'cyoga@glarge.org', 
	'1989-08-01', 
	'2016-09-15', 
	'Carole89', 
	'France');
	
	
INSERT INTO customers VALUES(
	'Carole', 
	'Yoga', 
	'cyoga@glarge.org', 
	'1989-08-01', 
	'2016-09-15', 
	'Carole89', 
	'France');

DROP TABLE games;

CREATE TABLE games(
name VARCHAR(32),
version CHAR(3),
price NUMERIC,
PRIMARY KEY (name, version));

INSERT INTO games VALUES ('Aerified2', '1.0', 5);
INSERT INTO games  VALUES ('Aerified2', '1.0', 6);

INSERT INTO games VALUES ('Aerified2', '2.0', 5);
INSERT INTO games  VALUES ('Aerified3', '1.0', 6);

DROP TABLE games;

CREATE TABLE games(
name VARCHAR(32),
version CHAR(3),
price NUMERIC NOT NULL);

INSERT INTO games (name, version) VALUES ('Aerified2', '1.0');

INSERT INTO games VALUES ('Aerified2', '1.0', null);

DROP TABLE customers;

CREATE TABLE customers (
	first_name VARCHAR(64),
	last_name VARCHAR(64),
	email VARCHAR(64) UNIQUE,
	dob DATE,
	since DATE,
	customerid VARCHAR(16),
	country VARCHAR(16),
	UNIQUE (first_name, last_name));
	
DROP TABLE downloads;
DROP TABLE customers;
DROP TABLE games;

CREATE TABLE customers (
 first_name VARCHAR(64),
 last_name VARCHAR(64),
 email VARCHAR(64),
 dob DATE,
 since DATE,
 customerid VARCHAR(16) PRIMARY KEY,
 country VARCHAR(16));
	
CREATE TABLE games(
 name VARCHAR(32),
 version CHAR(3),
 price NUMERIC,
 PRIMARY KEY (name, version));
	
CREATE TABLE downloads(
customerid VARCHAR(16) REFERENCES customers (customerid),
name VARCHAR(32),
version CHAR(3),
FOREIGN KEY (name, version) REFERENCES games(name, version));

INSERT INTO downloads VALUES ('Adam1983', 'Biodex', '1.0');

INSERT INTO customers VALUES ('Deborah', 'Ruiz', 'druiz0@drupal.org', '1984-08-01', '2016-10-17', 'Deborah84', 'Singapore');
INSERT INTO games VALUES ('Aerified', '1.0', 12);
INSERT INTO downloads VALUES ('Deborah84', 'Aerified', '1.0');
DELETE FROM customers WHERE country='Singapore';


DROP TABLE downloads;
DROP TABLE customers;
DROP TABLE games;

CREATE TABLE games (
	name VARCHAR(32),
	version CHAR(3),
	price DECIMAL(2,2) NOT NULL CHECK (price > 0));


INSERT INTO games VALUES ('Aerified', '1.0', 12);
INSERT INTO games VALUES ('Aerified', '1.1', 3.99);

UPDATE games SET price = price - 10;


CREATE TABLE customers (
	first_name VARCHAR(64) NOT NULL,
	last_name VARCHAR(64) NOT NULL,
	email VARCHAR(64) UNIQUE NOT NULL,
	dob DATE NOT NULL,
	since DATE NOT NULL,
	customerid VARCHAR(16) PRIMARY KEY,
	country VARCHAR(16) NOT NULL);

CREATE TABLE games (
	name VARCHAR(32),
	version CHAR(3),
	price DECIMAL(2,2) NOT NULL CHECK (price > 0) ,
	PRIMARY KEY (name, version));

CREATE TABLE downloads(
	customerid VARCHAR(16) REFERENCES customers(customerid),
	name VARCHAR(32),
	version CHAR(3),
	FOREIGN KEY (name, version) REFERENCES games(name, version),
	PRIMARY KEY(customerid, name, version));
	
INSERT INTO games (name, version, price) VALUES ('Voyatouch', '6.6', 6.36);
INSERT INTO games (name, version, price) VALUES ('Voltsillam', '7.4', 3.76);
INSERT INTO games (name, version, price) VALUES ('Stim', '8.2', 3.04);
INSERT INTO games (name, version, price) VALUES ('Y-Solowarm', '8.9', 9.99);
INSERT INTO games (name, version, price) VALUES ('Quo Lux', '9.9', 2.64);
INSERT INTO games (name, version, price) VALUES ('Biodex', '5.3', 7.3);
INSERT INTO games (name, version, price) VALUES ('Biodex', '8.7', 4.13);


DROP TABLE downloads;
DROP TABLE customers;
DROP TABLE games;


.read AppStoreSchema.sql
.read AppStoreCustomers.sql
.read AppStoreGames.sql
.read AppStoreDownloads.sql
 
SELECT first_name, last_name 
FROM customers 
WHERE country = 'Singapore';

SELECT first_name, last_name, email, dob, since, customerid, country
FROM customers;

SELECT *
FROM customers;

SELECT *
FROM games;

SELECT *
FROM downloads;

SELECT c.email, a.version 
FROM customers c, downloads d, games a 
WHERE c.customerid = d.customerid AND a.name = d.name AND a.version = d.version 
AND c.country = 'Indonesia' AND a.name = 'Fixflex';

CREATE VIEW singapore_customers1 AS
SELECT c.first_name, c.last_name, c.email, c.dob, c.since, c.customerid 
FROM customers c 
WHERE country='Singapore';

SELECT * FROM singapore_customers1;

CREATE TABLE singapore_customers2 (
	first_name VARCHAR(64) NOT NULL,
	last_name VARCHAR(64) NOT NULL,
	email VARCHAR(64) UNIQUE NOT NULL,
	dob DATE NOT NULL,
	since DATE NOT NULL,
	customerid VARCHAR(16) PRIMARY KEY REFERENCES customers(customerid));
	
SELECT * FROM singapore_customers2;

INSERT INTO singapore_customers2 
SELECT c.first_name, c.last_name, c.email, c.dob, c.since, c.customerid 
FROM customers c 
WHERE country='Singapore';

SELECT * FROM singapore_customers2;

DROP VIEW singapore_customers1;
DROP TABLE singapore_customers2;

